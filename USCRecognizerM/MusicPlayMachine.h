//
//  MusicPlayMachine.h
//  PrictiseDemo2
//
//  Created by jason on 14-11-2.
//  Copyright (c) 2014年 jason. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <AVFoundation/AVFoundation.h>
#import <AudioToolbox/AudioToolbox.h>

@protocol playerDelegate <NSObject>
- (void)finishPlay;
@end


@interface MusicPlayMachine : NSObject<AVAudioPlayerDelegate>
@property(nonatomic,strong)id delegate;
@property(nonatomic,retain)AVAudioPlayer *player;

+ (id)shareMusicM;
- (void)playWithData:(NSData *)musicData;
- (void)destoryPlay;

@end
