//
//  ChatScorll.m
//  Chat
//
//  Created by ly on 15/10/28.
//  Copyright (c) 2015年 123. All rights reserved.
//

#import "ChatScorll.h"
#import "Bean.h"
#import "ChatCell.h"
#import "Util.h"
#import "YMUSCRecordView.h"
@interface ChatScorll()<uscAgainPlayDelegate>
{
    NSMutableArray *alreadArray;
    UIImageView *rimgView;
    YMUSCRecordView *_recordView;
    DialogVO *dvo;
    CGFloat wh;
    sendButtonClick _sendBlock;
}
@end

@implementation ChatScorll

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(instancetype)initWithFrame:(CGRect)frame{

    self = [super initWithFrame:frame];
    if (self) {
        alreadArray = [NSMutableArray arrayWithCapacity:0];
        dvo = [[DialogVO alloc] init];
    }
    return self;
}
-(void)layoutSubviews{
    [super layoutSubviews];

}
-(void) addDialog:(DialogVO *) dialog andVO:(FriendVO *)fvo withDic:(NSMutableDictionary *) dic withshowSendButton:(BOOL) showSendButton withClickBlock:(sendButtonClick) sendBlock withimgBlock:(imgButtonClick) imgsBlock{
    dvo = dialog;
    if (sendBlock) {
        _sendBlock = sendBlock;
    }
    ChatCell *cell = [[ChatCell alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, 0)];
    cell.backgroundColor = [UIColor clearColor];
    cell.tag = 100+alreadArray.count;
      cell.changeBlock = ^(CGSize size){
        dispatch_async(dispatch_get_main_queue(), ^{
        cell.frame = CGRectMake(0, 0, self.bounds.size.width, size.height);
            NSLog(@"===%@",NSStringFromCGRect(cell.frame));
            
            CGFloat marx = 0;
            CGFloat mary = 10;
            for (NSInteger i = 0; i<alreadArray.count; i++) {
                NSLog(@"===========================================");
                ChatCell *cell =(ChatCell *) [self viewWithTag:100+i];
                    cell.frame = CGRectMake(marx, mary, cell.bounds.size.width, cell.bounds.size.height);
                NSLog(@"---%@",NSStringFromCGRect(cell.frame));
                mary += cell.bounds.size.height;
                mary += 10;
            }
            wh = mary;
            if (showSendButton == YES) {
                UIImage *rimg = [UIImage imageNamed:@"wTrumpet_1.png"];
                if (rimgView == nil) {
                    rimgView = [[UIImageView alloc] initWithFrame:CGRectMake(scrW/2 - rimg.size.width/2, mary-10, rimg.size.width, rimg.size.height)];
                    rimgView.image =  rimg;
                    [rimgView addClickBlock:^(NSInteger tag) {
                        [self imgClick];
                    }];
                    //                rimgView.backgroundColor = [UIColor blackColor];
                    [self addSubview:rimgView];
                }
                self.contentSize = CGSizeMake(self.bounds.size.width, wh+rimg.size.height+10);
                
            }else{
                self.contentSize = CGSizeMake(self.bounds.size.width, mary);
            }
            
        });
        
        

    };
    
    [cell config_data:dialog andVO:fvo withDic:dic withshowSendButton:showSendButton withClickBlock:^(id bean) {
        if (sendBlock) {
            sendBlock(bean);
        }
    }withimgBlock:^(id bean) {
        imgsBlock (fvo);
    } with:^(id bean) {
        NSNumber *celltag = (NSNumber *)bean;
        
        for (NSInteger i = 0; i<viewArr.count; i++) {
            NSLog(@"================stop.......==================");
            if ([celltag integerValue] != 100 + i) {
                ChatCell *cell =(ChatCell *) viewArr[i];
                for (UIView *subview in cell.subviews) {
                    NSLog(@"%@",cell.subviews);
                    if ([subview isKindOfClass:[UIImageView class]]) {
                        UIImageView *imgv = (UIImageView *)subview;
                        for (UIView *subv in imgv.subviews) {
                            if ([subv isKindOfClass:[UIImageView class]]) {
                                UIImageView *iv = (UIImageView *)subv;
                                if([iv isAnimating]){//判断是否在动画中
                                    [iv stopAnimating];//停止动画
                                    NSLog(@"=================stop=====================");
                                }
                            }
                        }
                        
                    }
                }
            }
          
            
            
        }

        
    }];
    [self addSubview:cell];
    [alreadArray addObject:dialog];
    [viewArr addObject:cell];

}
- (void)imgClick{
    [rimgView removeFromSuperview];
    rimgView = nil;
    _recordView = [[YMUSCRecordView alloc] initWithFrame:CGRectMake(0,wh, scrW, 60) andType:@""];
    self.contentSize = CGSizeMake(self.bounds.size.width, wh+60);
    _recordView.delegate = self;
    [self addSubview:_recordView];
    
    [self recordStart];
}
-(void)recordStart{
    NSMutableString *mStr =[NSMutableString  string];
    NSArray *arr = @[@"I will be happier if you give me a life-long discount card",@"I am beautiful lady like you",@"Did try that kind of cake"];
    for ( NSInteger i = dvo.subTexts.count - 1;i>=0;i--) {
//        NSString *str = dvo.subTexts[i];
////
//        NSString *sstr = [JTextView formatString:str];
        NSString *sstr = arr[i];
        if (i==0) {
             [mStr appendFormat:@"%@",sstr];
            break;
        }
        [mStr appendFormat:@"%@\n",sstr];
        
    }
    NSLog(@"subtext == %@",dvo.subTexts);
    [_recordView start_only];
    
    [_recordView recordBeginWithStr:mStr andDuration:2];
}
- (void)usc_play_right_wrong:(BOOL)isRight{
    if (isRight == NO) {
        UIAlertView *alter = [[UIAlertView alloc] initWithTitle:@"提示" message:@"识别失败,是否重试" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
        [alter show];
    }else{
        [_recordView stop];
    }
}
-(void)usc_resultwithindex:(NSInteger)index{
    NSLog(@"alreadArray%@",alreadArray);
    for (DialogVO *vo in alreadArray) {
        if ([vo.selectedTag integerValue]== index) {
            if (_sendBlock) {
                _sendBlock(vo);
            }
        }
    }
    NSLog(@"index%zd",index);
}
-(void)usc_show_right_wrong:(BOOL)isRight{
    
}
-(void)uscAgainPlay{
    
}
-(void)uscPassPlay{
    
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 0) {
        [_recordView stop];
        UIImage *rimg = [UIImage imageNamed:@"wTrumpet_1.png"];
        if (rimgView == nil) {
            rimgView = [[UIImageView alloc] initWithFrame:CGRectMake(scrW/2 - rimg.size.width/2, wh-10, rimg.size.width, rimg.size.height)];
            rimgView.image =  rimg;
            [rimgView addClickBlock:^(NSInteger tag) {
                [self imgClick];
            }];
            //                rimgView.backgroundColor = [UIColor blackColor];
            [self addSubview:rimgView];
        }
        self.contentSize = CGSizeMake(self.bounds.size.width, wh+rimg.size.height+10);
    }else{
       [self recordStart];
    }
  
}
-(void) removeAllDialog{

    for (UIView *v in [self subviews]) {
        [v removeFromSuperview];
    }
    [alreadArray removeAllObjects];
}
@end
