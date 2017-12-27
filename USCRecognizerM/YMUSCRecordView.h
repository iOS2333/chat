//
//  YMUSCRecordView.h
//  Practice
//
//  Created by jason on 14-11-5.
//  Copyright (c) 2014年 jason. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "YMUSCRecordView.h"
#import "JSONKit.h"
#import "MusicPlayMachine.h"
#import "SCSiriWaveformView.h"
#import "USCRecognizer.h"
typedef void (^audioFinishBlock)();

@protocol uscAgainPlayDelegate <NSObject>
- (void)uscAgainPlay;
//- (void) only_again_play;
- (void)uscPassPlay;
//-(void) setRedText:(NSArray *) reds;

//-(void) oper_to_next;

-(void) usc_show_right_wrong:(BOOL) isRight;
-(void) usc_play_right_wrong:(BOOL) isRight;
- (void) usc_resultwithindex:(NSInteger)index;
//-(void) play_again_then_to_next;
@end

@interface YMUSCRecordView : UIImageView<USCRecognizerDelegate,playerDelegate,UIAlertViewDelegate,AVAudioPlayerDelegate,SCSiriWaveformViewDelegate>
{
    UIImageView *_recordBarImg;
    NSTimer *_timer;
    int _duration;
    
    NSString *_typeStr;
    AVAudioPlayer *_player;
}
@property(nonatomic,assign)id delegate;

- (id)initWithFrame:(CGRect)frame andType:(NSString *)typeStr;
//- (void)recordBeginWithStr:(NSString *)recordStr;
- (void)recordBeginWithStr:(NSString *)recordStr andDuration:(int)duration;

- (void)stopRecord;
-(void) setInfo:(NSString *) info;
-(void) stop;
-(void) stop_teminal;
-(BOOL) get_usc_state;
-(void) stop_audio;
-(void) start_only;


@end