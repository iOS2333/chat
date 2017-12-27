//
//  ChatCell.m
//  Chat
//
//  Created by ly on 15/10/28.
//  Copyright (c) 2015年 123. All rights reserved.
//

#import "ChatCell.h"
#import "JTexView.h"
#import "Util.h"
#define scrW [[UIScreen mainScreen] bounds].size.width
#define scrH [[UIScreen  mainScreen] bounds].size.height
@interface ChatCell()<AVAudioPlayerDelegate>
{
    JTextView *jTextV;
    UIImageView *imgview;
    DialogVO *cellVO;
    UIImageView *iv;
    float duration;
    float scale;
    UIImageView *iconimg;
    FriendVO *people;
    stopButtonClick stopBlock;
    UIImageView *transImg;
    UIButton *sendBtn;
    BOOL isMachine;
    sendButtonClick sBlock;
    BOOL showButton;
    UIImage *backimg;
    SystemSoundID  soundID;
    UIImageView *soundimg;
    UIImageView *soundimgs;
    UIImage *simg;
    UIImage *line;
    UIImageView *lineView;
    UIImageView *soundbkimg;
    UIImageView *sendimgView;
    UILabel *playertime_lb;
    BOOL isimgView;
    UIImage *sendimg;
    NSURL *fileUrl;
    BOOL isplay;
}
@end

@implementation ChatCell


-(instancetype)initWithFrame:(CGRect)frame{

    self = [super initWithFrame:frame];
    if (self) {
        isplay = NO;
        isimgView = NO;
        iconimg = [[UIImageView alloc] initWithFrame:CGRectZero];
      
        [self addSubview:iconimg];
        imgview = [[UIImageView alloc]initWithFrame:CGRectZero];
        imgview.userInteractionEnabled = YES;
        jTextV = [[JTextView alloc] initWithFrame:CGRectZero];
        [self addSubview:imgview];
        [imgview addSubview:jTextV];
        self.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth ;
        sendBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        sendimg = [UIImage imageNamed:@"send.png"];
        sendimgView = [[UIImageView alloc]initWithFrame:CGRectZero];
        sendimgView.userInteractionEnabled = YES;
        sendimgView.image = sendimg;
        [sendimgView addClickBlock:^(NSInteger tag) {
            [self sendClick];
        }];
        [self addSubview:sendimgView];
        
        playertime_lb = [[UILabel alloc] initWithFrame:CGRectZero];
        playertime_lb.textColor = [UIColor colorWithHexString:@"7f8389"];
        
        soundbkimg = [[UIImageView alloc]initWithFrame:CGRectZero];
        soundbkimg.userInteractionEnabled = YES;
        [self addSubview:soundbkimg];
        soundimg = [[UIImageView alloc] initWithFrame:CGRectZero];
        [soundbkimg addSubview:soundimg];
        transImg = [[UIImageView alloc]initWithFrame:CGRectZero];
        transImg.userInteractionEnabled = YES;
        [soundbkimg addSubview:transImg];
        soundimgs = [[UIImageView alloc] initWithFrame:CGRectZero];
        [imgview addSubview:soundimgs];
        lineView = [[UIImageView alloc] initWithFrame:CGRectZero];
        [imgview addSubview:lineView];
        
        [soundbkimg addSubview:playertime_lb];
//
        
        NSString *path = [[NSBundle mainBundle] pathForResource:@"test" ofType:@"mp3"];
        fileUrl = [NSURL URLWithString:path];
        AVAudioPlayer *player = [[AVAudioPlayer alloc] initWithContentsOfURL:fileUrl error:nil];
        duration = (float)player.duration;
        scale = duration/10.00;
        playertime_lb.text = [NSString stringWithFormat:@"%.1fs",duration];
        playertime_lb.font = [UIFont systemFontOfSize:14];
        }
    return self;
}

- (void)transClick{
    soundbkimg.hidden = YES;
    imgview.hidden = NO;
    jTextV.hidden = NO;
    soundimgs.hidden = NO;
    lineView.hidden = NO;
    [imgview addSubview:playertime_lb];
     playertime_lb.frame = CGRectMake(15, lineView.frame.origin.y/2- 20/2, 30, 20);
    if (isMachine == NO) {
        playertime_lb.frame = CGRectMake(imgview.frame.size.width - simg.size.width*1.2-15,lineView.frame.origin.y/2- 20/2, 30, 20);
    }
    if (showButton) {
         playertime_lb.frame = CGRectMake(15, lineView.frame.origin.y/2- 20/2, 30, 20);
    }
}
-(void)soundStop{
      isplay = NO;
    if (auplayer) {
        auplayer = nil;
        [auplayer stop];
    }
    [soundimg stopAnimating];
    [soundimgs stopAnimating];
  
}
- (void)soundPlay{
    isplay = YES;
    if (auplayer) {
        auplayer = nil;
        [auplayer stop];
    }


    
        if (auplayer == nil) {
            auplayer = [[AVAudioPlayer alloc] initWithContentsOfURL:fileUrl error:nil];
            auplayer.volume = 1.0;
            auplayer.delegate = self;
            [auplayer play];
            [soundimg startAnimating];
            [soundimgs startAnimating];
        }
}
- (void)soundControl{
    stopBlock([NSNumber numberWithInteger:self.tag]);
    if (isplay) {
        [self soundStop];
        if (showButton) {
            if ([playID integerValue] ==  [[cellVO.subIds objectAtIndex:[cellVO.selectedTag integerValue]] integerValue]) {
                
            }else{
                [self soundPlay];
                
            }
        }else{
            if ([playID integerValue] == [cellVO.did integerValue]) {
                
            }else{
                [self soundPlay];
                
            }
        }
        
    }else{
        [self soundPlay];
    }
    if (showButton) {
        playID =[NSNumber numberWithInteger:[[cellVO.subIds objectAtIndex:[cellVO.selectedTag integerValue]] integerValue]];
    }else{
       playID =[NSNumber numberWithInteger:[cellVO.did integerValue]];
    }
   
}
-(void) config_data:(DialogVO *) dvo andVO:(FriendVO *)ffvo withDic:(NSDictionary *) dic withshowSendButton:(BOOL) showSendButton withClickBlock:(sendButtonClick) sendBlock withimgBlock:(imgButtonClick) imgBlock with:(stopButtonClick)stop{
    CGFloat marx = 0;
    people = ffvo;
   
     line = [UIImage imageNamed:@"line_new.png"];
     line = [line stretchableImageWithLeftCapWidth:floorf(line.size.width/2) topCapHeight:floorf(line.size.height/2)];
    lineView.image = line;
    lineView.hidden = YES;
    UIImage *timg = [UIImage imageNamed:@"yi.png"];
    transImg.image = timg;
    simg = [UIImage imageNamed:@"sound_3.png"];
    soundimg.image = simg;
    soundimgs.image = simg;
    NSArray *soundArr = @[[UIImage imageNamed:@"sound_1.png"],[UIImage imageNamed:@"sound_2.png"],[UIImage imageNamed:@"sound_3.png"]];
    soundimg.animationImages = soundArr;//动画图片数组
    soundimg.animationDuration = soundArr.count/2;//动画播放的时间
    soundimg.animationRepeatCount = 100;//动画播放的次数
    
    soundimgs.animationImages = soundArr;//动画图片数组
    soundimgs.animationDuration = soundArr.count/2;//动画播放的时间
    soundimgs.animationRepeatCount = 100;//动画播放的次数
    
    
    

    [soundimg addClickBlock:^(NSInteger tag) {
      
        [self soundControl];
    }];
    [soundimgs addClickBlock:^(NSInteger tag) {
         [self soundControl];
    }];
    [transImg addClickBlock:^(NSInteger tag) {
        [self transClick];
    }];
    [soundbkimg addClickBlock:^(NSInteger tag) {
        [self soundControl];
    }];
     cellVO = dvo;
    
    if (sendBlock) {
        sBlock = sendBlock;
    }
    if (stop) {
        stopBlock = stop;
    }
    showButton = showSendButton;
      if ([dvo.isAutoMachine integerValue] == 1) {//机器
        isMachine = YES;
        backimg = [UIImage imageNamed:@"whiteback.png"];
        iconimg.image = [UIImage imageNamed:people.myicon];
        [iconimg addClickBlock:^(NSInteger tag) {
            imgBlock(ffvo);
        }];
        iconimg.frame = CGRectMake(5, 0, backimg.size.height, backimg.size.height);
        marx = iconimg.frame.origin.x+iconimg.frame.size.width;
         
          imgview.frame = CGRectMake(marx, 0, self.bounds.size.width - marx - 80,backimg.size.height);
          soundbkimg.frame = CGRectMake(marx, 0, scrW*0.5*scale, backimg.size.height);
          transImg.frame = CGRectMake(soundbkimg.frame.size.width - timg.size.width - 5,soundbkimg.frame.size.height/2-timg.size.height/2, timg.size.width, timg.size.height);
        [jTextV setup:
        CGRectMake( 10 , simg.size.height*1.2+2,  self.bounds.size.width - marx - 80, imgview.frame.size.height- simg.size.height*1.2-5)
    WithArticleString:[dvo.subTexts objectAtIndex:[dvo.selectedTag integerValue]]
        witharticleID:[NSNumber numberWithInteger:[dvo.did integerValue]]
          withWordDic:dic
         andViewWidth:imgview.frame.size.width-10
         withFontSize:17
     andTransFontSize:14
             delegate:self];
        
        
       
        
    }else{
        isMachine = NO;
        marx = scrW*0.75;
        if (showSendButton) {
            backimg = [UIImage imageNamed:@"whiteback.png"];
        }else{
            backimg = [UIImage imageNamed:@"greenback.png"];
        }
        UIImage *mimg = [UIImage imageNamed:@"myimg.png"];
        iconimg.image = mimg;
        iconimg.frame = CGRectMake(self.bounds.size.width - backimg.size.height-2 , 0, backimg.size.height, backimg.size.height);
        imgview.frame = CGRectMake(self.bounds.size.width - marx, 0, marx- backimg.size.height,backimg.size.height);
         soundbkimg.frame = CGRectMake(self.bounds.size.width - scrW*0.5*scale - backimg.size.height, 0,scrW*0.5*scale,backimg.size.height);
          transImg.frame = CGRectMake(5, soundbkimg.frame.size.height/2-timg.size.height/2, timg.size.width, timg.size.height);
        [jTextV setup:
         CGRectMake( 2 , simg.size.height*1.2+2,scrW*0.75-8, imgview.frame.size.height- simg.size.height*1.2-5)
    WithArticleString:[dvo.subTexts objectAtIndex:[dvo.selectedTag integerValue]]
        witharticleID:[NSNumber numberWithInteger:[dvo.did integerValue]]
          withWordDic:dic
         andViewWidth:scrW*0.75
         withFontSize:17
     andTransFontSize:14
             delegate:self];
      
    }
    soundimgs.hidden = YES;
    jTextV.hidden = YES;
    backimg = [backimg stretchableImageWithLeftCapWidth:floorf(backimg.size.width/2) topCapHeight:floorf(backimg.size.height/4*3)];
    imgview.image = backimg;
    [imgview addClickBlock:^(NSInteger tag) {
        [self soundControl];
    }];
    imgview.hidden = YES;
    NSLog(@"99:%@",NSStringFromCGRect(jTextV.frame));
    soundbkimg.image = backimg;
    
    if (showSendButton) {
        sendBtn.hidden = NO;
        sendimgView.hidden = NO;
        iconimg.hidden = YES;
        sendBtn.frame = CGRectMake(self.bounds.size.width/2+self.bounds.size.width/4-sendimg.size.width*2/2, soundbkimg.frame.size.height/2-sendimg.size.height*2/2 , sendimg.size.width*2, sendimg.size.height*2);
        imgview.frame = CGRectMake(5, imgview.frame.origin.y,imgview.frame.size.width,imgview.frame.size.height);
        jTextV.frame = CGRectMake(10, jTextV.frame.origin.y, jTextV.frame.size.width, jTextV.frame.size.height);
        transImg.frame = CGRectMake(soundbkimg.frame.size.width - timg.size.width - 5,soundbkimg.frame.size.height/2-timg.size.height/2, timg.size.width, timg.size.height);
    }else{
        sendBtn.hidden = YES;
        sendimgView.hidden = YES;
        iconimg.hidden = NO;
    }

}


-(void)viewSize:(CGSize)size AndTag:(NSInteger)tag andArticleID:(NSNumber *)aID andWordID:(NSNumber *)wID{
 size = CGSizeMake(size.width, size.height+simg.size.height*1.2);
    playertime_lb.frame = CGRectMake(15, soundbkimg.frame.size.height/2- 20/2, 30, 20);
    if (_changeBlock) {
        if (showButton) {
            self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, size.height);
            imgview.frame = CGRectMake( imgview.frame.origin.x, imgview.frame.origin.y,scrW * 0.75, size.height);
            soundbkimg.frame = CGRectMake( 5, 0, scrW * 0.7, backimg.size.height);
            soundimg.frame = CGRectMake(40,soundbkimg.frame.size.height/2- simg.size.height/2, simg.size.width, simg.size.width);
            soundimg.transform = CGAffineTransformMakeScale(1, -1);
            soundimgs.frame = CGRectMake(40, 5, simg.size.width*1.2, simg.size.width*1.2);
            soundimgs.transform = CGAffineTransformMakeScale(1, -1);
            lineView.frame = CGRectMake(15, soundimgs.frame.size.height + soundimgs.frame.origin.y+5, imgview.frame.size.width - 25, line.size.height);
            sendimgView.frame = CGRectMake(self.bounds.size.width-sendimg.size.width*1.5-15, soundbkimg.frame.size.height/2-sendimg.size.height*1.5/2 , sendimg.size.width*1.5, sendimg.size.height*1.5);
            jTextV.frame = CGRectMake(jTextV.frame.origin.x, jTextV.frame.origin.y, jTextV.frame.size.width, size.height);
            jTextV.layer.masksToBounds = YES;
            jTextV.layer.cornerRadius = 10;
           
                    _changeBlock(size);
        }else{
            self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, size.height);
            imgview.frame = CGRectMake(imgview.frame.origin.x, imgview.frame.origin.y,size.width+10, size.height);
            soundimg.frame = CGRectMake(40, soundbkimg.frame.size.height/2- simg.size.height*1.2/2, simg.size.width*1.2, simg.size.width*1.2);
            soundimg.transform = CGAffineTransformMakeScale(1, -1);
            soundimgs.frame = CGRectMake(40, 5, simg.size.width*1.2, simg.size.width*1.2);
            soundimgs.transform = CGAffineTransformMakeScale(1, -1);
            lineView.frame = CGRectMake(15, soundimgs.frame.size.height + soundimgs.frame.origin.y+5, imgview.frame.size.width - 25, line.size.height);
            
            if (isMachine == NO) {
                imgview.frame = CGRectMake(self.frame.size.width - scrW*0.75 - iconimg.frame.size.width, imgview.frame.origin.y,scrW*0.75, size.height);
                playertime_lb.frame = CGRectMake(soundbkimg.frame.size.width - simg.size.width*1.2-15, soundbkimg.frame.size.height/2- 20/2, 30, 20);
                soundimg.frame = CGRectMake(soundbkimg.frame.size.width - simg.size.width*1.2-40,soundbkimg.frame.size.height/2- simg.size.height/2, simg.size.width*1.2, simg.size.width*1.2);
                soundimg.transform = CGAffineTransformMakeScale(-1, 1);
                soundimgs.frame = CGRectMake(imgview.frame.size.width - simg.size.width*1.2-40,5, simg.size.width*1.2, simg.size.width*1.2);
                soundimgs.transform = CGAffineTransformMakeScale(-1, 1);
                lineView.frame = CGRectMake(10, soundimgs.frame.size.height + soundimgs.frame.origin.y+5, imgview.frame.size.width - 25, line.size.height);
            }
            jTextV.frame = CGRectMake(jTextV.frame.origin.x, jTextV.frame.origin.y, jTextV.frame.size.width, size.height);
             jTextV.layer.cornerRadius = 0;
            jTextV.layer.masksToBounds = NO;
        NSLog(@"+++++++%@",NSStringFromCGRect(jTextV.frame));
        _changeBlock(size);
        
    }
}
}
-(void)sendClick{
    if (sBlock) {
        sBlock(cellVO);
    }
}
-(void)sendClick:(UIButton *) button{
   
        NSLog(@"click=========================");
    if (button.tag == 10) {
        if (sBlock) {
            sBlock(cellVO);
        }
    }else{//trans
    }
    
    }
-(void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag{
    if (flag == YES) {
        auplayer = nil;
        isplay = NO;
        [soundimg stopAnimating];
        [soundimgs stopAnimating];
    }
}
@end
