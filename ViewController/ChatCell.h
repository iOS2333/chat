//
//  ChatCell.h
//  Chat
//
//  Created by ly on 15/10/28.
//  Copyright (c) 2015年 123. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Bean.h"
#import "JTexView.h"
#import <AudioToolbox/AudioToolbox.h>
#import "Tools.h"
extern AVAudioPlayer *auplayer;
extern NSNumber *playID;

typedef void (^cellChange)(CGSize size);
typedef void (^sendButtonClick)(id bean);
typedef void (^imgButtonClick)(id bean);
typedef void (^stopButtonClick)(id bean);


@interface ChatCell : UIView<JTextViewDelegate>

@property(nonatomic,readwrite,copy) cellChange changeBlock;
-(void) config_data:(DialogVO *) dvo andVO:(FriendVO *)ffvo withDic:(NSDictionary *) dic withshowSendButton:(BOOL) showSendButton withClickBlock:(sendButtonClick) sendBlock withimgBlock:(imgButtonClick) imgBlock with:(stopButtonClick) stop;
@end
