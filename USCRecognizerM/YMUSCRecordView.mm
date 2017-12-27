////
////  YMUSCRecordView.m
////  Practice
////
////  Created by jason on 14-11-5.
////  Copyright (c) 2014年 jason. All rights reserved.
////
//
//#import "USCRecordView.h"
//
//#define AUDIO_HARD 45
//#define AUDIO_MIDDLE 35
//#define AUDIO_EASY 25
//
//@implementation USCRecordView
//{
//    float selfW,selfH;
//    float _scaleNum;
//    UIImageView *mikeImgV,*scoreFaceImgV;
//    UILabel *infoLabel;
// 
//    USCRecognizer *recognizer;
//    BOOL isRecording;
//}
//-(void) setInfo:(NSString *) info{
//    infoLabel.text = info;
//}
//- (id)initWithFrame:(CGRect)frame
//{
//    self = [super initWithFrame:frame];
//    if (self)
//    {
//        selfW = frame.size.width;
//        selfH = frame.size.height;
//        
//        _scaleNum = widWithView(self)/screen_wid;
//        
//        [self setBackgroundColor:[UIColor clearColor]];
//        self.userInteractionEnabled = YES;
//        UIImageView *recordBarImg = [[UIImageView alloc] initWithFrame:CGRectMake((selfW-159*_scaleNum)/2.0, 70, 159*_scaleNum, 6)];
//        [recordBarImg setImage:[UIImage imageNamed:@"recordBar.png"]];
//        _recordBarImg = recordBarImg;
//        [self addSubview:recordBarImg];
//        
////        mikeImgV = [[UIImageView alloc] initWithFrame:CGRectMake((selfW-23*_scaleNum)/2.0, 20, 23*_scaleNum, 33*_scaleNum)];
////        [mikeImgV setImage:[UIImage imageNamed:@"mike1.png"]];
////        [self addSubview:mikeImgV];
//        
//        mikeImgV = [[UIImageView alloc] initWithFrame:CGRectMake(20, 20, 23*_scaleNum, 33*_scaleNum)];
//        [mikeImgV setImage:[UIImage imageNamed:@"mike1.png"]];
//        [self addSubview:mikeImgV];
//        
//        infoLabel = [[UILabel alloc] initWithFrame:CGRectMake(20+(23*_scaleNum)+20, 20, selfW-(20+(23*_scaleNum)+20), 33*_scaleNum)];
//        infoLabel.backgroundColor = [UIColor clearColor];
//        infoLabel.font = [UIFont systemFontOfSize:14];
//        infoLabel.text = @"准备录音...";
//        [self addSubview:infoLabel];
//        
//        scoreFaceImgV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 25*_scaleNum, 25*_scaleNum)];
//        [scoreFaceImgV setImage:[UIImage imageNamed:@"recordScore1.png"]];
//        [self addSubview:scoreFaceImgV];
//        [scoreFaceImgV setHidden:YES];
//        // 请用真机测试，暂不支持模拟器
////        recognizer = [[USCRecognizer alloc] init];
////        recognizer.delegate = self;
//    }
//    return self;
//}
//- (id)initWithFrame:(CGRect)frame andType:(NSString *)typeStr
//{
//    _typeStr = typeStr;
//    self = [self initWithFrame:frame];
//    return self;
//}
//
//#pragma mark -----------playMachine.delegate
//- (void)finishPlay
//{
//    [self stopAnimating];
////    [[NSNotificationCenter defaultCenter] postNotificationName:@"blueFinishPlay" object:nil];
//}
//
//
//- (void)recordBeginWithStr:(NSString *)recordStr andDuration:(int)duration
//{
//    [[AVAudioSession sharedInstance] setCategory: AVAudioSessionCategoryPlayback error: nil];
//    _player = [[AVAudioPlayer alloc] initWithData:[NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"beep" ofType:@"wav"]] error:Nil];
//    _player.volume = 10.0;
//    [_player prepareToPlay];
//    [_player play];
//
//    [scoreFaceImgV setHidden:YES];
//    if (recognizer)
//    {
//        [recognizer stop];
//        recognizer = nil;
//    }
//    recognizer = [[USCRecognizer alloc] init];
//    recognizer.delegate = self;
//    recognizer.oralText = recordStr;
////    [recognizer setVadFrontTimeout:15 BackTimeout:15];
//    [recognizer start];
////    [self setInfo:@"请对准话筒录音..."];
//
//    
//    _duration = duration;
//    //调用start方法后，播放初始化的等待动画
//    isRecording = YES;
//    
////    _timer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(jilushijian) userInfo:nil repeats:YES];
////    [_timer fire];
//}
//static int timerNum = 1;
//- (void)jilushijian
//{
//    if (timerNum >= _duration)
//    {
//        [_timer invalidate];
//        _timer = nil;
//        timerNum =  1;
//        [recognizer stop];
//        [mikeImgV setImage:[UIImage imageNamed:@"mike1.png"]];
//    }
//    timerNum++;
//}
//
//#pragma mark ---------------------云之声方法回调
///*
// 录音初始化完成回调方法
// */
//- (void)onBeginOral
//{
//    //录音初始化完成，关闭初始化动画
//    NSLog(@"录音开始");
////    [recognizer start];
//    [self setInfo:@"请对准话筒录音..."];
//
//}
//
////结果回调
//- (void)onResult:(NSString *)result isLast:(BOOL)isLast
//{
//    
//    NSLog(@"录音结果回调%@",result);
//    
//    [self setInfo:@"结果返回中..."];
//
//    
//    if (result.length>0)
//    {
//        NSDictionary *resultDic = [result objectFromJSONString];
//        float scoreNum = [[[[resultDic objectForKey:@"lines"] objectAtIndex:0] objectForKey:@"score"] floatValue];
//        int scoreResult = 1;
//        if (scoreNum == 0)
//        {
//            [self setScoreWithNum:1];
//            scoreResult = 1;
//        }
//        else
//        {
//            [self setScoreWithNum:((int)scoreNum)/20];
//            float recordLevel = [[Util get_sys_status:SYSVAR_VOICE_NUMBER] floatValue];
//            if (recordLevel>=0.7)        //难
//            {
//                    scoreResult = ((int)scoreNum)/AUDIO_HARD;
//            }
//            else
//                if (recordLevel <0.7 && recordLevel>0.3)        //中
//                {
//                    scoreResult = ((int)scoreNum)/AUDIO_MIDDLE;
//                }
//            else                                   //易
//            {
//                scoreResult = ((int)scoreNum)/AUDIO_EASY;
//            }
//        }
//        
//        if (scoreResult > 1)           //测试通过
//        {
//            [recognizer stop];
//
//
//            [self stopRecord];
////                        [self playAudio:YES];
//            
//
//            static SystemSoundID soundIDTest = 0;
//            NSString * path = [[NSBundle mainBundle] pathForResource:@"right" ofType:@"mp3"];
//            if (path)
//            {
//                AudioServicesCreateSystemSoundID( (__bridge CFURLRef)[NSURL fileURLWithPath:path], &soundIDTest );
//            }
//            AudioServicesPlaySystemSound( soundIDTest );
//            
//            [self.delegate performSelector:@selector(uscPassPlay) withObject:nil afterDelay:0];
//            if (_delegate) {
//                [_delegate setRedText:nil];
//            }
//            [self performSelector:@selector(cutToNext) withObject:nil afterDelay:2.0];
//        }
//        else                            //测试不通过,重新播放
//        {
//            
//            
//            NSArray *lines = [resultDic objectForKey:@"lines"];
//            NSArray *words = [[lines objectAtIndex:0] objectForKey:@"words"];
//            NSMutableArray *deleteArray = [NSMutableArray arrayWithCapacity:0];
//            NSMutableArray *words_muti = [NSMutableArray arrayWithArray:words];
//            NSMutableArray *reds_words = [NSMutableArray arrayWithCapacity:0];
//            for (int w = 0; w<[words count]; w++) {
//                NSDictionary *dic = [words objectAtIndex:w];
//                if ([[dic objectForKey:@"text"] isEqualToString:@"sil"]) {
//                    [deleteArray addObject:dic];
//                }
//            }
//            [words_muti removeObjectsInArray:deleteArray];
//            
//             float recordLevel = [[Util get_sys_status:SYSVAR_VOICE_NUMBER] floatValue];
//            int stanterdNum = 0;
//            if (recordLevel>=0.7) {
//                stanterdNum = AUDIO_HARD;
//            }else if(recordLevel<=0.3){
//                stanterdNum = AUDIO_EASY;
//            }else{
//            stanterdNum = AUDIO_MIDDLE;
//            }
//            
//            float last_num = stanterdNum*1.0/[words_muti count];
//            
//            NSLog(@"平均分:%f",last_num);
//            for (int m = 0; m<[words_muti count]; m++) {
//                NSDictionary *dic = [words_muti objectAtIndex:m];
//                float score = [[dic objectForKey:@"score"] floatValue];
//                if (score<last_num) {
//                    NSString *text = [dic objectForKey:@"text"];
//                    [reds_words addObject:text];
//                }
//            }
//            
//            if ([reds_words count]>0) {
//                //post
//                if (_delegate) {
//                    [_delegate setRedText:reds_words];
//                }
//            }
//            
//            
//            static SystemSoundID soundIDTest = 1;
//
//            
//            NSString * path = [[NSBundle mainBundle] pathForResource:@"wrong" ofType:@"mp3"];
//            if (path)
//            {
//                AudioServicesCreateSystemSoundID( (__bridge CFURLRef)[NSURL fileURLWithPath:path], &soundIDTest );
//            }
//            AudioServicesPlaySystemSound( soundIDTest );
//            
//                        [recognizer stop];
//            
//
//            
//            
//            
//            [_delegate performSelector:@selector(uscAgainPlay) withObject:nil afterDelay:2.0];
//        }
//    }
//    [scoreFaceImgV setHidden:NO];
//}
//- (void)cutToNext
//{
////    [[NSNotificationCenter defaultCenter] postNotificationName:@"cutToNextTitle" object:nil];
//    [self.delegate oper_to_next];
//}
////结束回调
//- (void)onEndOral:(NSError *)error
//{
//    isRecording = NO;
//    NSLog(@"结束回调%@",error);
//    
//    if (error)
//    {
//        [recognizer stop];
//        [recognizer start];
//    }
//}
//
////声音大小回调
//- (void)onUpdateVolume:(int)volume
//{
////    progressView.progress = (volume / 100.0);
//    NSLog(@"声音大小回调%d",volume);
////    if (volume<30)
////    {
////        [mikeImgV setImage:[UIImage imageNamed:@"mike1.png"]];
////    }
////        else
////    if (volume<45)
////    {
////        [mikeImgV setImage:[UIImage imageNamed:@"mike2.png"]];
////    }
////        else
////    if (volume<60)
////    {
////        [mikeImgV setImage:[UIImage imageNamed:@"mike3.png"]];
////    }
////        else
////    {
////        [mikeImgV setImage:[UIImage imageNamed:@"mike4.png"]];
////    }
//}
//
////VAD超时回调
//- (void)onVADTimeout
//{
//    NSLog(@"超时回调");
////    [recognizer stop];
////    [recognizer start];
////    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"回调超时" message:@"" delegate:self cancelButtonTitle:@"重新测试" otherButtonTitles:@"跳过", nil];
////    [alert show];
//    
//    
//    if (_delegate) {
//        [_delegate setRedText:nil];
//    }
//    
//    static SystemSoundID soundIDTest = 1;
//    
//    
//    NSString * path = [[NSBundle mainBundle] pathForResource:@"wrong" ofType:@"mp3"];
//    if (path)
//    {
//        AudioServicesCreateSystemSoundID( (__bridge CFURLRef)[NSURL fileURLWithPath:path], &soundIDTest );
//    }
//    AudioServicesPlaySystemSound( soundIDTest );
//    
//    [recognizer stop];
//    
//    
//    
//    
//    
//    [_delegate performSelector:@selector(uscAgainPlay) withObject:nil afterDelay:2.0];
//}
//- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
//{
//    if (buttonIndex==0)
//    {
//        [recognizer start];
//    }
//    else
//    {
//        [self performSelector:@selector(cutToNext) withObject:nil afterDelay:1];
//    }
//}
//
//
//static NSMutableData *dataTest = [[NSMutableData alloc]init];
//- (void)onRecordingBuffer:(NSData *)recordingData
//{
//    if (dataTest==nil)
//    {
//        
//    }
//}
//
//#pragma mark -----------重置/设置分数级显示
//- (void)setScoreWithNum:(int)scoreNum
//{
//    [scoreFaceImgV setHidden:NO];
//    
//    NSString *imgStr = [NSString stringWithFormat:@"recordScore%d.png",scoreNum];
//    [scoreFaceImgV setImage:[UIImage imageNamed:imgStr]];
//    
//    float progressBar_X = _recordBarImg.frame.origin.x;
//    float progressBar_W = _recordBarImg.frame.size.width;
//    float progressBar_CH = _recordBarImg.center.y;
//    [scoreFaceImgV setCenter:CGPointMake(progressBar_X+progressBar_W*(scoreNum-0.5)/4.0, progressBar_CH)];
//}
//
//- (void)stopRecord
//{
//    [recognizer stop];
//    recognizer = nil;
//}
//
//
//-(void) playAudio:(BOOL) right{
//    NSError* err;
//    if (right) {
//        
//        AVAudioPlayer *player = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"right" ofType:@"mp3"]] error:&err];
//        
//        player.volume = 1.0;
//        [player prepareToPlay];
//        [player play];
//    }
//    else{
//        
//        AVAudioPlayer *player = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"wrong" ofType:@"mp3"]] error:&err];
//        player.volume = 1.0;
//        [player prepareToPlay];
//        [player play];
//    }
//    
//}
///*
//// Only override drawRect: if you perform custom drawing.
//// An empty implementation adversely affects performance during animation.
//- (void)drawRect:(CGRect)rect {
//    // Drawing code
//}
//*/
//
//@end











//
//  USCRecordView.m
//  Practice
//
//  Created by jason on 14-11-5.
//  Copyright (c) 2014年 jason. All rights reserved.
//

#import "YMUSCRecordView.h"
#import "SCSiriWaveformView.h"
#import "Util.h"

#define AUDIO_HARD 70
#define AUDIO_MIDDLE 50
#define AUDIO_EASY 30

@implementation YMUSCRecordView
{
    float selfW,selfH;
    float _scaleNum;
    UIImageView *mikeImgV,*scoreFaceImgV;
    UILabel *infoLabel;
    
    USCRecognizer *recognizer;
    BOOL isRecording;
    
    BOOL tostop;
    
    SCSiriWaveformView *siri;
//    RecvStarView *startv;
    
    UIView *errorView;
    UIView *continueView;
    
    float audio_big;
}
-(float)get_level{
    return audio_big;
}
-(void) setInfo:(NSString *) info{
    infoLabel.text = info;
}
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        selfW = frame.size.width;
        selfH = frame.size.height;
        
//        _scaleNum = widWithView(self)/screen_wid;
        
        [self setBackgroundColor:[UIColor clearColor]];
        self.userInteractionEnabled = YES;
//        UIImageView *recordBarImg = [[UIImageView alloc] initWithFrame:CGRectMake((selfW-159*_scaleNum)/2.0, 70, 159*_scaleNum, 6)];
//        [recordBarImg setImage:[UIImage imageNamed:@"recordBar.png"]];
//        _recordBarImg = recordBarImg;
//        [self addSubview:recordBarImg];
//        
//        //        mikeImgV = [[UIImageView alloc] initWithFrame:CGRectMake((selfW-23*_scaleNum)/2.0, 20, 23*_scaleNum, 33*_scaleNum)];
//        //        [mikeImgV setImage:[UIImage imageNamed:@"mike1.png"]];
//        //        [self addSubview:mikeImgV];
//        
//        mikeImgV = [[UIImageView alloc] initWithFrame:CGRectMake(20+50, 20, 23*_scaleNum, 33*_scaleNum)];
//        [mikeImgV setImage:[UIImage imageNamed:@"mike1.png"]];
//        [self addSubview:mikeImgV];
//        
//        infoLabel = [[UILabel alloc] initWithFrame:CGRectMake(20+(23*_scaleNum)+20+50, 20, selfW-(20+(23*_scaleNum)+20), 33*_scaleNum)];
//        infoLabel.backgroundColor = [UIColor clearColor];
//        infoLabel.font = [UIFont systemFontOfSize:14];
//        infoLabel.text = @"准备录音...";
//        [self addSubview:infoLabel];
//        
//        scoreFaceImgV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 25*_scaleNum, 25*_scaleNum)];
//        [scoreFaceImgV setImage:[UIImage imageNamed:@"recordScore1.png"]];
//        [self addSubview:scoreFaceImgV];
//        [scoreFaceImgV setHidden:YES];
        
        siri = [[SCSiriWaveformView alloc] initWithFrame:CGRectMake(0, self.bounds.size.height-60, self.bounds.size.width, self.bounds.size.height)];
        siri.delegate = self
        ;
        [siri start];
        [self addSubview:siri];
        siri.hidden = YES;
        
//        startv = [[RecvStarView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height)];
//        [self addSubview:startv];
//        startv.hidden = YES;
        
        
        
        // 请用真机测试，暂不支持模拟器
        recognizer = [[USCRecognizer alloc] init];
        NSLog(@"version:%@",[USCRecognizer version]);
        recognizer.delegate = self;
        [recognizer setVadFrontTimeout:3000 backTimeout:1000];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame andType:(NSString *)typeStr
{
    _typeStr = typeStr;
    self = [self initWithFrame:frame];
    return self;
}

#pragma mark -----------playMachine.delegate
- (void)finishPlay
{
    [self stopAnimating];
    //    [[NSNotificationCenter defaultCenter] postNotificationName:@"blueFinishPlay" object:nil];
}


- (void)recordBeginWithStr:(NSString *)recordStr andDuration:(int)duration
{

    if (tostop) {
        if (_player) {
            [_player stop];
        }
        return;
    }
    
    
    
    isRecording = YES;

    [self play_audio:^{
        dispatch_async(dispatch_get_main_queue(), ^{
            

        [scoreFaceImgV setHidden:YES];
            
            
            
         
        NSString *sss = [Util audio_change_mobile:recordStr];
        recognizer.oralText = sss;
        recognizer.oralTask = @"G";
            if (recognizer == nil) {
                recognizer = [[USCRecognizer alloc] init];
                NSLog(@"version:%@",[USCRecognizer version]);
                recognizer.delegate = self;
                [recognizer setVadFrontTimeout:3000 backTimeout:1000];
                
                
                            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.7 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                                        [recognizer start];
                            });
            }else{
                        [recognizer start];
            }
            
//            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//                        [recognizer start];
//            });

//        [self setInfo:@"请对准话筒录音..."];
            siri.hidden = NO;
//            startv.hidden = YES;
        
        
        _duration = duration;

            
                    });
    }];
    
    

}



static int timerNum = 1;
- (void)jilushijian
{
    if (timerNum >= _duration)
    {
        [_timer invalidate];
        _timer = nil;
        timerNum =  1;
        [recognizer stop];
        [mikeImgV setImage:[UIImage imageNamed:@"mike1.png"]];
    }
    timerNum++;
}

#pragma mark ---------------------云之声方法回调
/*
 录音初始化完成回调方法
 */
- (void)onBeginOral
{
    //录音初始化完成，关闭初始化动画
    NSLog(@"初始化完成");
    
}

//结果回调
- (void)onResult:(NSString *)result isLast:(BOOL)isLast
{
    
    NSLog(@"json结果:%@%@",result,isLast?@"一个":@"半个");

    if (tostop) {
        return;
    }
    
    NSLog(@"录音结果回调%@",result);
    
    [self setInfo:@"结果返回中..."];
//    siri.hidden = YES;
//    startv.hidden = NO;
    
    
    if (result.length>0)
    {
        NSDictionary *resultDic = [result objectFromJSONString];
        NSArray *array = [resultDic objectForKey:@"lines"];
         int scoreResult = 1;
        float scoreNum = 0;
         BOOL issucces = NO;
        for (NSInteger i = 0; i<array.count; i++) {
           
        scoreNum = [[array[i] objectForKey:@"score"] floatValue];
            if (scoreNum/0.600 >= 60)
            {
                issucces = YES;
                if (self.delegate) {
                    [self.delegate usc_resultwithindex:i];
                    [self.delegate usc_play_right_wrong:YES];
                  
                }
                break;
            }
        }
        if (issucces == NO) {
            if (self.delegate) {
                [self.delegate usc_play_right_wrong:NO];
                
            }
        }
    
      
    }
    else{

        if (self.delegate) {
            [self.delegate usc_play_right_wrong:NO];
          
        }

         }
}

//结束回调
- (void)onEndOral:(NSError *)error
{
    isRecording = NO;
    NSLog(@"结束回调%@",error);
    
    
    
    
    
    
    if (error)
    {
        
        NSLog(@"结束回调出错%@",error);
        
        [recognizer stop];
        if (tostop) {
            return;
        }
        
        NSInteger error_code = error.code;
        NSLog(@"错误码:%zd",error_code);
        if(true){
            if(self.delegate){
                [self.delegate usc_play_right_wrong:NO];
               
            }
        }else
        if (error_code == -5306) {
            NSLog(@"授权失败");
            tostop = TRUE;
            
            __weak YMUSCRecordView *wself = self;
            
//            [UIAlertView alertViewWithTitle:@"提示" message:@"麦克风授权失败\r\n请在 设置->隐私->麦克风 中设置" cancelButtonTitle:@"设置" otherButtonTitles:nil
//                                  onDismiss:^(int buttonIndex) {
//
//            } onCancel:^{
////                [wself createContinueView];
//                
//                
//                NSURL *url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
//                [[UIApplication sharedApplication] openURL:url];
//                
//            }];
            
            return;
        }
        else
        if (error_code == -10001 || error_code == -61001 || error_code == -70002) {
            NSLog(@"网络");
            tostop = TRUE;
            
            __weak YMUSCRecordView *wself = self;
            
//            [UIAlertView alertViewWithTitle:@"提示" message:@"无法连接网络\r\n请在 设置 中设置" cancelButtonTitle:@"设置" otherButtonTitles:nil
//                                  onDismiss:^(int buttonIndex) {
//                                      
//                                  } onCancel:^{
////                                      [wself createContinueView];
//                                      
//                                      
//                                      NSURL *url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
//                                      [[UIApplication sharedApplication] openURL:url];
//                                      
//                                  }];
            
            return;
        }
        else{
            if(self.delegate){
                [self.delegate usc_play_right_wrong:NO];
               
            }
        }
        
        
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
            if (_delegate) {
                [_delegate performSelector:@selector(uscAgainPlay) withObject:nil afterDelay:0.1];
            }

            
        });
        


    }
}

//声音大小回调
- (void)onUpdateVolume:(int)volume
{
    if (tostop) {
        return;
    }
    //    progressView.progress = (volume / 100.0);
    NSLog(@"声音大小回调%d",volume);
    
    if (volume<35) {
        audio_big = 0.0;
    }else{
        audio_big = volume/100.0;
    }
}

//VAD超时回调
- (void)onVADTimeout
{
    NSLog(@"超时回调");
    [recognizer stop];
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex==0)
    {
        [recognizer start];
    }
    else
    {
        [self performSelector:@selector(cutToNext) withObject:nil afterDelay:1];
    }
}


static NSMutableData *dataTest = [[NSMutableData alloc]init];
//- (void)onRecordingBuffer:(NSData *)recordingData
//{
//    NSLog(@"Record........data");
//    if (dataTest==nil)
//    {
//        
//    }
//}

#pragma mark -----------重置/设置分数级显示
//- (void)setScoreWithNum:(int)scoreNum
//{
//    [scoreFaceImgV setHidden:NO];
//    
//    NSString *imgStr = [NSString stringWithFormat:@"recordScore%d.png",scoreNum];
//    [scoreFaceImgV setImage:[UIImage imageNamed:imgStr]];
//    
//    float progressBar_X = _recordBarImg.frame.origin.x;
//    float progressBar_W = _recordBarImg.frame.size.width;
//    float progressBar_CH = _recordBarImg.center.y;
//    [scoreFaceImgV setCenter:CGPointMake(progressBar_X+progressBar_W*(scoreNum-0.5)/4.0, progressBar_CH)];
//}

- (void)stopRecord
{
    [recognizer cancel];
//    recognizer = nil;
}
-(void) stop{
     siri.hidden = YES;
    [self stopRecord];
    tostop = TRUE;
}
-(void) stop_teminal{
    [_player stop];
    [self stopRecord];
    tostop = TRUE;
}
-(void) stop_audio{
    if (_player) {
        [_player stop];
    }
}
-(void) start_only{
    tostop = FALSE;
}

-(void) playAudio:(BOOL) right{
    NSError* err;
    if (right) {
        
        AVAudioPlayer *player = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"right" ofType:@"mp3"]] error:&err];
        
        player.volume = 1.0;
        [player prepareToPlay];
        [player play];
    }
    else{
        
        AVAudioPlayer *player = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"wrong" ofType:@"mp3"]] error:&err];
        player.volume = 1.0;
        [player prepareToPlay];
        [player play];
    }
    
}

-(BOOL) get_usc_state{
    return isRecording;
}

-(void) play_audio:(audioFinishBlock) block{
//    NSError* err;
//    [[AVAudioSession sharedInstance] setCategory: AVAudioSessionCategoryPlayback error: nil];
//    _player = [[AVAudioPlayer alloc] initWithData:[NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"beep" ofType:@"mp3"]] error:&err];
//    _player.delegate = self;
//    _player.volume = 1.0;
//    [_player prepareToPlay];
//    [_player associateValue:[block copy] withKey:@"__block"];
//    [_player play];
    
    AVAudioSession *avSession = [AVAudioSession sharedInstance];
    
    if ([avSession respondsToSelector:@selector(requestRecordPermission:)]) {
        
        [avSession requestRecordPermission:^(BOOL available) {
            
            if (available) {
                //completionHandler
                block();
            }
            else
            {
                dispatch_async(dispatch_get_main_queue(), ^{
                    [[[UIAlertView alloc] initWithTitle:@"无法录音" message:@"请在“设置-隐私-麦克风”选项中允许xx访问你的麦克风" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil] show];
                });
            }
        }];
        
    }
}
//- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer*)player2 successfully:(BOOL)flag{
//    if ([_player associatedValueForKey:@"__block"] != nil) {
//        audioFinishBlock bb= [player2 associatedValueForKey:@"__block"];
//        dispatch_async(dispatch_get_main_queue(), ^{
//            bb();
//        });
//        
//    }
//    NSLog(@"ok........finish");    //播放结束时执行的动作
//}
- (void)audioPlayerDecodeErrorDidOccur:(AVAudioPlayer*)player error:(NSError *)error{
    NSLog(@"error............");    //解码错误执行的动作
}
- (void)audioPlayerBeginInteruption:(AVAudioPlayer*)player{
    NSLog(@"");    //处理中断的代码
}
- (void)audioPlayerEndInteruption:(AVAudioPlayer*)player{
    NSLog(@"");    //处理中断结束的代码
}
/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

-(void) createErrorView{
    
    if (siri) {
        [siri stop];
        [siri removeFromSuperview];
    }

    float yyy = 10;
//    if (iPhone4) {
//        yyy += 20;
//    }
    errorView = [[UIView alloc] initWithFrame:CGRectMake(30, yyy, self.bounds.size.width-30*2, 50)];
    errorView.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.4];
    errorView.layer.masksToBounds = YES;
    errorView.layer.cornerRadius = 10;
    
    UILabel *l = [[UILabel alloc] initWithFrame:errorView.bounds];
    l.backgroundColor = [UIColor clearColor];
    l.textColor = [UIColor whiteColor];
    l.font = [UIFont systemFontOfSize:14];
    l.textAlignment = NSTextAlignmentCenter;
    l.numberOfLines = 0;
    l.lineBreakMode = NSLineBreakByCharWrapping;
    l.text = @"麦克风授权失败\r\n请在 设置->隐私->麦克风 中设置";
    [errorView addSubview:l];
    [self addSubview:errorView];

    [self performSelector:@selector(removeError) withObject:nil afterDelay:2];
}

-(void) removeError{

    [errorView removeFromSuperview];
}


-(void) createContinueView{
    
    __weak YMUSCRecordView *wself = self;
    if (siri) {
        [siri stop];
        [siri removeFromSuperview];
    }
    
    float yyy = 10;
//    if (iPhone4) {
//        yyy += 20;
//    }
    if (continueView) {
        continueView.hidden = NO;
        return;
    }
    continueView = [[UIView alloc] initWithFrame:CGRectMake(30, yyy, self.bounds.size.width-30*2, 50)];
    continueView.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.4];
    continueView.layer.masksToBounds = YES;
    continueView.layer.cornerRadius = 10;
    
    UILabel *l = [[UILabel alloc] initWithFrame:continueView.bounds];
    l.backgroundColor = [UIColor clearColor];
    l.textColor = [UIColor whiteColor];
    l.font = [UIFont systemFontOfSize:14];
    l.textAlignment = NSTextAlignmentCenter;
    l.numberOfLines = 0;
    l.lineBreakMode = NSLineBreakByCharWrapping;
    l.text = @"继续";
    [l addClickBlock:^(NSInteger tag) {
//        if (wself.delegate) {
//                [wself.delegate only_again_play];
//        }
        
        continueView.hidden = YES;
    }];
    [continueView addSubview:l];
    [self addSubview:continueView];
    
}

@end

