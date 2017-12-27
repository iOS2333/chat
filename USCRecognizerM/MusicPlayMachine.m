//
//  MusicPlayMachine.m
//  PrictiseDemo2
//
//  Created by jason on 14-11-2.
//  Copyright (c) 2014年 jason. All rights reserved.
//

#import "MusicPlayMachine.h"

static MusicPlayMachine *musicMachine;
//static AVAudioPlayer *player;

@implementation MusicPlayMachine
{
//    AVAudioPlayer *_player;
}

+ (id)shareMusicM
{
    @synchronized (self)
    {
        if (!musicMachine)
        {
            musicMachine = [[MusicPlayMachine alloc] init];
        }
    }
    return musicMachine;
}

- (void)playWithData:(NSData *)musicData
{
    //提高声音的质量 AVAudioSessionCategoryPlayback是喇叭模式
    [[AVAudioSession sharedInstance] setCategory: AVAudioSessionCategoryPlayback error: nil];
    _player = [[AVAudioPlayer alloc] initWithData:musicData error:Nil];
    _player.delegate = self;
    _player.volume = 10.0;
    [_player prepareToPlay];
    [_player play];
}

- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag
{
    if (self.delegate)
    {
        [self.delegate finishPlay];
    }
}
- (void)destoryPlay
{
    if (_player)
    {
        [_player stop];
        _player = nil;
    }
}

@end
