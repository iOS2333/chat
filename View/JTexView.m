//
//  StringDeal.m
//  MF_sgenglish
//
//  Created by 123 on 15/8/25.
//  Copyright (c) 2015年 mf. All rights reserved.
//

#import "JTexView.h"
#import "Tools.h"
@interface JTextView ()<UITextViewDelegate>
{
    CGSize sizeFrame;
    CGFloat _width;
    NSMutableArray *idsArr;
    NSAttributedString *_article;
    NSMutableString *_sourceStr;
    CGFloat _fontSize;
    CGFloat _translastionFontSize;
    AVPlayer *player;
    AVAudioPlayer *auplayer;
    NSString *avplayerStr;
    NSNumber *_readNO;
    NSArray *userWordIds_arr;
    NSNumber *_wordIDno;
}
@property (strong,nonatomic)UITextView *textView;

@property (strong,nonatomic)NSArray *wordArr;

@property (nonatomic,assign)id<JTextViewDelegate>delegate;


@end



@implementation JTextView



- (void)setup:(CGRect)frame
            WithArticleString:(NSString *)string
                witharticleID:(NSNumber *)readNO
                  withWordDic:(NSDictionary *)wordDic
                 andViewWidth:(CGFloat)width
                 withFontSize:(CGFloat)fontSize
             andTransFontSize:(CGFloat)TfontSize
                     delegate:(id<JTextViewDelegate>)delegate
{

        if (width) {
            _width = width;
        }else{
            _width = [UIScreen mainScreen].bounds.size.width;
        }
        
        if (fontSize) {
            _fontSize = fontSize;
        }else{
            _fontSize = 20;
        }
        if (TfontSize) {
            _translastionFontSize = TfontSize;
        }else{
            _translastionFontSize = 12;
        }
        _readNO = readNO;
        self.delegate = delegate;
        NSMutableArray  *m_array = [NSMutableArray array];
        
        for (NSString *wordidstr in [wordDic allKeys]) {
            NSDictionary *dic = [wordDic objectForKey:wordidstr];
            CETWordListVO *vo = [[CETWordListVO alloc] init];
            vo.translation = [dic objectForKey:@"translation"];
            vo.word = [dic objectForKey:@"word"];
            vo.readNo = [dic objectForKey:@"readNo"];
            [m_array addObject:vo];
            
        }
        _wordArr = m_array;
        
        _sourceStr = [NSMutableString stringWithString:string];
        _textView = [[UITextView alloc] init];
        _textView.editable = NO;
        _textView.delegate = self;
        _textView.showsVerticalScrollIndicator = NO;
        _textView.backgroundColor = [UIColor clearColor];
        _textView.scrollEnabled = NO;
        _textView.selectable = NO;
        NSLog(@"string=======%@",[self delete_paragraph_ids:[[NSAttributedString alloc] initWithString:_sourceStr]]);
        _textView.attributedText = [self delete_paragraph_ids:[[NSAttributedString alloc] initWithString:_sourceStr]];
        _article = [[NSAttributedString alloc] initWithAttributedString:[self delete_paragraph_ids:[[NSAttributedString alloc] initWithString:_sourceStr]]];
        _textView.font = [UIFont systemFontOfSize:_fontSize];
        sizeFrame = [_textView sizeThatFits:CGSizeMake(_width,CGFLOAT_MAX)];
        UITapGestureRecognizer* tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(_handleTap:)];
        [_textView addGestureRecognizer:tap];
        [self addSubview:_textView];
        idsArr = [NSMutableArray array];
    

    self.frame = frame;
        [self changeViewsHight];

}


- (void)getwordIDs:(NSArray *)wordids_arr withWords:(NSArray *)word_arr{
    if (idsArr.count) {
        [idsArr removeAllObjects];
    }
    if (wordids_arr.count) {
        for (NSNumber *word in wordids_arr) {
            NSString *words = [NSString stringWithFormat:@"%@",word];
            [idsArr addObject:words];
        }
        
        NSInteger i = 0;
        for (NSString *woids in idsArr) {
            if (player == nil) {
                player = [[AVPlayer alloc] init];
            }
            dispatch_async( dispatch_get_main_queue(), ^{
                _textView.attributedText = [self add_translate_withWordid:woids withArticleString:_sourceStr withWordArr:word_arr];//加翻译,改变颜色
                _textView.frame = self.bounds;
                
                if (i == idsArr.count - 1) {
                    sizeFrame = [_textView sizeThatFits:CGSizeMake(_width,CGFLOAT_MAX)];
                    [self changeViewsHight];
                }
            });
            
            i++;
            
        }
    }
    
    
}

+(CGFloat) heightForString:(NSString *)value fontSize:(CGFloat)fontSize andWidth:(CGFloat)width
{    UIFont *font;
    if (fontSize) {
       font = [UIFont systemFontOfSize:fontSize];
    }else{
        font = [UIFont systemFontOfSize:17];
    }
   
    CGSize sizeToFit = [value sizeWithFont:font constrainedToSize:CGSizeMake(width, CGFLOAT_MAX) lineBreakMode:NSLineBreakByWordWrapping];//此处的换行类型（lineBreakMode）可根据自己的实际情况进行设置
    return sizeToFit.height;
}
-(void)changeViewsHight{
    if ([self.delegate respondsToSelector:@selector(viewSize:AndTag:andArticleID:andWordID:)]) {
        [self.delegate viewSize:sizeFrame AndTag:self.tag andArticleID:_readNO andWordID:_wordIDno];
        
    }
    _textView.frame = self.bounds;
}
-(void)_handleTap:(UITapGestureRecognizer*)tap{
    
    if(tap.state == UIGestureRecognizerStateRecognized){
        CGPoint tappedPoint = [tap locationInView:_textView];//获取点屏幕中心点坐标
        NSUInteger idx = [_textView closestCharacterIndexToPoint:tappedPoint];//转化为字符位置
        NSString *findword = [self pickIDfromArticleString:_sourceStr withIndex:idx];//获取点击单词ID
        NSMutableString *str = [NSMutableString stringWithString:findword];
        NSString *idStr = [[str componentsSeparatedByString:@"-"] firstObject];
        _wordIDno = [NSNumber numberWithInteger:[idStr integerValue]];
        _textView.attributedText = [self add_translate_withWordid:idStr withArticleString:_sourceStr withWordArr:_wordArr ];//加翻译,改变颜色
        _article = [[NSAttributedString alloc] initWithAttributedString:_textView.attributedText];
        sizeFrame = [_textView sizeThatFits:CGSizeMake(_width,CGFLOAT_MAX)];
        if ([self.delegate respondsToSelector:@selector(viewSize:AndTag:andArticleID:andWordID:)]) {
            [self.delegate viewSize:sizeFrame AndTag:self.tag andArticleID:_readNO andWordID:_wordIDno];
            
        }

        
        _textView.frame = self.bounds;
        
    }
    
}
-(BOOL)textViewShouldBeginEditing:(UITextView *)textView
{
    return NO;
}
#pragma 音频处理
//-(void)startWithUrl:(NSString *)urlStr{
//    if (urlStr) {
//
//
//    [[AVAudioSession sharedInstance] setCategory: AVAudioSessionCategoryPlayback error: nil];
//    urlStr  = [urlStr stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
//    //    urlStr = [urlStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
//    NSMutableString *str = [NSMutableString stringWithString:urlStr];
//    NSString *lastStr = [[str componentsSeparatedByString:@"/"] lastObject];
//    NSFileManager *fileManager = [NSFileManager defaultManager];
//    NSString *filePath = [NSString stringWithFormat:@"%@/%@",[Util get_doc_path],_readNO];
//    filePath = [NSString stringWithFormat:@"%@/%@",filePath,lastStr];
//
//    if([fileManager fileExistsAtPath:filePath]){
//        //播放本地音乐
//        NSLog(@"soundfilepath ==== %@",filePath);
//        NSURL *fileURL = [NSURL fileURLWithPath:filePath];
//        auplayer = [[AVAudioPlayer alloc] initWithContentsOfURL:fileURL error:nil];
//        auplayer.volume = 1.0;
//        [auplayer play];
//    }else{
//
//        NSURL *url = [[NSURL alloc]initWithString:urlStr];
//        player = [[AVPlayer alloc] initWithURL:url];
//        player.volume = 1.0;
//        [player play];
//    }
//}
//}
//- (void)stop{
//    player = nil;
//    if (auplayer) {
//        [auplayer stop];
//        auplayer = nil;
//    }
//}
#pragma 字符串处理
-(NSString *)pickIDfromArticleString:(NSString *)string withIndex:(NSInteger) index{
    
    NSString *fullWord = [self find_wordid_by_index:index withArticleString:string];
    NSString *wordIDStr = [self find_word_id:fullWord];
    NSMutableString *str = [NSMutableString stringWithString:wordIDStr];
    NSString *idStr = [[str componentsSeparatedByString:@"-"] firstObject];
    [idsArr addObject:idStr];
    return idStr;
}

- (NSString *)find_wordid_by_index:(NSInteger) index withArticleString:(NSString *)sourceStr{//通过点击的位置获取最近的ID片段
    
    NSMutableString *fullword = [[NSMutableString alloc] init];
    NSMutableString *fullWord = [[NSMutableString alloc] init];
    NSInteger equlaIndex = 0;
    BOOL cout = YES;
    BOOL add = NO;
    for (NSInteger i = 0; i<_sourceStr.length; i++) {
        NSString *chars = [_sourceStr substringWithRange:NSMakeRange(i, 1)];
        if (equlaIndex == index) {
            add = YES;
            NSLog(@"字符=====%@",chars);
            if ( ! (([chars characterAtIndex:0]<='Z'&&[chars characterAtIndex:0]>='A')||([chars characterAtIndex:0]<='z'&&[chars characterAtIndex:0]>='a'))) {
                
                BOOL add = NO;
                for (NSInteger j = i; j>=0; j--) {
                    NSString *charword = [ _sourceStr  substringWithRange:NSMakeRange(j, 1)];
                    if ([charword isEqualToString:@"]"]) {
                        add = YES;
                    }
                    if (add) {
                        [fullWord insertString:charword atIndex:0];
                    }
                    if ([charword isEqualToString:@"["]) {
                        add = NO;
                        break;
                    }
                }
                return fullWord;
            }
        }
        if (add) {
            [fullword appendString:chars];
        }
        {
            if ([chars isEqualToString:@"["]) {
                cout = NO;
                
            }
            if ([chars isEqualToString:@"]"]) {
                cout = YES;
                if (add) {
                    add = NO;
                    break;
                }
            }else
                if (cout) {
                    equlaIndex++;
                }
        }
        
    }
    return fullword;
}
- (NSString *)find_word_id:(NSString *)fullword{//获取点击单词的ID
    NSMutableString  *wordid = [[NSMutableString alloc] init];
    BOOL add = NO;
    for (int i = 0; i<fullword.length; i++) {
        NSString *chars = [fullword substringWithRange:NSMakeRange(i, 1)];
        if([chars isEqualToString:@"]"]){
            add = NO;
        }
        if (add) {
            [wordid appendString:chars];
        }
        if ([chars isEqualToString:@"["]) {
            add = YES;
        }
        if ([chars isEqualToString:@" "]) {
            break;
        }
        
    }
    return wordid;
}

- (NSAttributedString *)add_translate_withWordid:(NSString *)words
                               withArticleString:(NSMutableString *)sourceStr
                                     withWordArr:(NSArray *)wordArray
{//加翻译
    BOOL isadd = false;
    BOOL islast = false;
    NSLog(@"wordID======%@",words);
    NSString *tStr = [NSString string];
    NSMutableString *wordid = [NSMutableString string];
    BOOL add = NO;
    if (!words.length) {
        _sourceStr = [NSMutableString stringWithString:_sourceStr];
        NSAttributedString *sourceAttStr = [self change_translate_words_color_id:nil withArticleString:_sourceStr withtransStr:tStr withWordArr:wordArray withIDArr:idsArr withIsAdd:isadd];
        return sourceAttStr;
    }
    for (NSInteger i = 0; i<_sourceStr.length; i++) {
        NSString *chars = [_sourceStr substringWithRange:NSMakeRange(i, 1)];
        if([chars isEqualToString:@"]"]){
            add = NO;
            if (![wordid isEqualToString:@""]) {
                if ([words isEqualToString:[[wordid componentsSeparatedByString:@"-"] firstObject]]) {
                    for (CETWordListVO *cvo in wordArray) {
                        if ([cvo.readNo intValue] == [wordid intValue]) {
                            tStr = [NSString stringWithFormat:@"(%@)",cvo.translation];
                            break;
                        }
                        
                    }
                    if (i >= _sourceStr.length-2) {
                        [_sourceStr insertString: tStr atIndex:i+1];
                        isadd = YES;
                        islast = YES;
                        
                        
                        NSAttributedString *sourceAttStr = [self change_translate_words_color_id:words withArticleString:_sourceStr withtransStr:tStr withWordArr:wordArray withIDArr:idsArr withIsAdd:isadd ];
                        return sourceAttStr;
                        
                        
                    }
                    if (!islast) {
                        if ([[[wordid componentsSeparatedByString:@"-"] lastObject] isEqualToString:@"0"]) {
                            NSString *wordsssssss = [_sourceStr substringWithRange:NSMakeRange(i+1, tStr.length)];
                            if ([wordsssssss isEqualToString:tStr]) {
                                isadd = NO;
                                islast = NO;
                                [_sourceStr deleteCharactersInRange:NSMakeRange(i+1, tStr.length)];
                                [idsArr removeObject:words];
                            }
                            wordid = [NSMutableString string];
                            continue;
                        }
                    }
                    NSString *wordsssssss = [_sourceStr substringWithRange:NSMakeRange(i+1, tStr.length)];
                    if ([wordsssssss isEqualToString:tStr]) {
                        isadd = NO;
                        islast = NO;
                        [_sourceStr deleteCharactersInRange:NSMakeRange(i+1, tStr.length)];
                        [idsArr removeObject:words];
                    }else{
                        [_sourceStr insertString: tStr atIndex:i+1];
                        isadd = YES;
                    }
                }
                wordid = [NSMutableString string];
            }
        }
        if (add) {
            [wordid appendString:chars];
        }
        if ([chars isEqualToString:@"["]) {
            add = YES;
        }
    }
    
    NSAttributedString *sourceAttStr = [self change_translate_words_color_id:words withArticleString:_sourceStr withtransStr:tStr withWordArr:wordArray withIDArr:idsArr withIsAdd:isadd];
    return sourceAttStr;
}
- (NSAttributedString *)change_translate_words_color_id:(NSString *)words
                                      withArticleString:(NSString *)source
                                           withtransStr:(NSString *)tStr
                                            withWordArr:(NSArray *)wordArray
                                              withIDArr:(NSArray *)idArray
                                              withIsAdd:(BOOL) isadd
{//变颜色
    NSInteger index = 0;
    NSMutableAttributedString* showstr = [[NSMutableAttributedString alloc] initWithString:source];
    [showstr beginEditing];
    [showstr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:_fontSize] range:NSMakeRange(0, source.length)];
    NSMutableString *wordid = [NSMutableString string];
    NSMutableString *colorword = [NSMutableString string];
    BOOL add = NO;
    BOOL changeWord = NO;
    
    for (NSInteger i = 0; i<showstr.length; i++) {
        NSString *chars = [showstr attributedSubstringFromRange:NSMakeRange(i, 1)].string;
        if([chars isEqualToString:@"]"]){
            add = NO;
            if (![wordid isEqualToString:@""]) {
                //                if (words == nil) {
                //                     break;
                //                }
                if ([words isEqualToString:[[wordid componentsSeparatedByString:@"-"] firstObject]]) {
                    for (NSInteger j = i-wordid.length; j>= 0; j--) {
                        NSString *colorchars =[showstr attributedSubstringFromRange:NSMakeRange(j, 1)].string;
                        if ([colorchars isEqualToString:@"]"]) {
                            changeWord = NO;
                            continue;
                        }
                        if ((([colorchars characterAtIndex:0]<='Z'&&[colorchars characterAtIndex:0]>='A')||([colorchars characterAtIndex:0]<='z'&&[colorchars characterAtIndex:0]>='a'))) {
                            changeWord = YES;
                        }else if ([colorchars characterAtIndex:0]>='0'&&[colorchars characterAtIndex:0]<='9') {
                            changeWord = NO;
                        }else if ([colorchars isEqualToString:@"-"]) {
                            changeWord = YES;
                        }else if ([colorchars isEqualToString:@"'"]){
                            changeWord = YES;
                        }else if ([colorchars isEqualToString:@"["]) {
                            changeWord = YES;
                            continue;
                        }else {
                            changeWord = NO;
                            index = j;
                            break;
                        }
                        if (changeWord) {
                            [colorword insertString:colorchars atIndex:0];
                        }
                    }
                    if (isadd) {
                        [showstr addAttribute:NSForegroundColorAttributeName value:[UIColor orangeColor] range:NSMakeRange(index,colorword.length+1)];//橙色
                    }else{
                        [showstr addAttribute:NSForegroundColorAttributeName value:[UIColor blackColor] range:NSMakeRange(index,colorword.length+1)];
                    }
                    
                    for (CETWordListVO *cvo in wordArray) {
                        if ([cvo.readNo intValue] == [words intValue]) {
                            tStr = [NSString stringWithFormat:@"(%@)",cvo.translation];
                            avplayerStr = cvo.soundUrl;
                            break;
                        }
                        
                    }
                    if (i < showstr.string.length-2) {
                        
                        //                        NSLog(@"index%zd",index);
                        NSString *translateword = [showstr attributedSubstringFromRange:NSMakeRange(i+1, tStr.length)].string;
                        if ([translateword isEqualToString:tStr]) {
                            [showstr addAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:_translastionFontSize],NSForegroundColorAttributeName:[UIColor grayColor]} range:NSMakeRange(i+1,translateword.length)];
                            
                        }
                        
                    }
                }
                else{
                    for (NSString *str in idArray) {
                        if ([str isEqualToString:[[wordid componentsSeparatedByString:@"-"] firstObject]]) {
                            for (int j = (int)(i-wordid.length); j>= 0; j--) {
                                NSString *colorchars =[showstr attributedSubstringFromRange:NSMakeRange(j, 1)].string;
                                
                                if ((([colorchars characterAtIndex:0]<='Z'&&[colorchars characterAtIndex:0]>='A')||([colorchars characterAtIndex:0]<='z'&&[colorchars characterAtIndex:0]>='a'))) {
                                    changeWord = YES;
                                }else if ([colorchars characterAtIndex:0]>='0'&&[colorchars characterAtIndex:0]<='9') {
                                    changeWord = NO;
                                }else if ([colorchars isEqualToString:@"-"]) {
                                    changeWord = YES;
                                }else if ([colorchars isEqualToString:@"'"]){
                                    changeWord = YES;
                                }else  if ([colorchars isEqualToString:@"["]) {
                                    changeWord = YES;
                                    continue;
                                }else {
                                    changeWord = NO;
                                    index = j;
                                    break;
                                }
                                if (changeWord) {
                                    [colorword insertString:colorchars atIndex:0];
                                }
                            }
                            
                            for (CETWordListVO *cvo in wordArray) {
                                if ([cvo.readNo intValue] == [wordid intValue]) {
                                    tStr = [NSString stringWithFormat:@"(%@)",cvo.translation];
                                    break;
                                }
                                
                            }
                            
                            
                            [showstr addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithHexString:@"5CBCB3"] range:NSMakeRange(index,colorword.length+1)];//绿色
                            
                            
                            
                            //
                            if (i < showstr.string.length-2) {
                                NSString *translateword  = [showstr attributedSubstringFromRange:NSMakeRange(i+1, tStr.length)].string;
                                if ([translateword isEqualToString:tStr]) {
                                    [showstr addAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:_translastionFontSize],NSForegroundColorAttributeName: [UIColor grayColor]} range:NSMakeRange(i+1,translateword.length)];
                                }
                                
                                
                            }
                            
                            
                            
                        }
//                        colorword = [NSMutableString string];
                    }
                }
                wordid = [NSMutableString string];
                [colorword deleteCharactersInRange:NSMakeRange(0, colorword.length)];
            }
        }
        if (add) {
            [wordid appendString:chars];
        }
        if ([chars isEqualToString:@"["]) {
            add = YES;
        }
    }
    
    NSAttributedString *show = [[NSAttributedString alloc] initWithAttributedString: [self delete_paragraph_ids:showstr]];
    [showstr endEditing];
    return show;
}
- (NSMutableAttributedString *)delete_paragraph_ids:(NSAttributedString *)scource{//去除所有ID
    
    NSMutableAttributedString* rtnStr = [[NSMutableAttributedString alloc] init];
    BOOL add = YES;
    for (NSInteger i = 0; i<scource.length; i++) {
        NSAttributedString *chars = [scource attributedSubstringFromRange:NSMakeRange(i, 1)];
        if ([chars.string isEqualToString:@"["]) {
            add = NO;
            continue;
        }
        if ([chars.string isEqualToString:@"]"]) {
            add = YES;
            continue;
        }
        if (add) {
            [rtnStr appendAttributedString:chars];
        }
    }
    
    return rtnStr;
}
+ (NSString *)formatString:(NSString *)scource{//去除所有ID
    
    NSMutableString* rtnStr = [[NSMutableString alloc] init];
    BOOL add = YES;
    for (NSInteger i = 0; i<scource.length; i++) {
        NSString *chars = [scource substringWithRange:NSMakeRange(i, 1)];
        if ([chars isEqualToString:@"["]) {
            add = NO;
            continue;
        }
        if ([chars isEqualToString:@"]"]) {
            add = YES;
            continue;
        }
        if (add) {
            [rtnStr appendString:chars];
        }
    }
    
    return rtnStr;
}

@end
