//
//  CharVC.h
//  Chat
//
//  Created by ly on 15/10/27.
//  Copyright (c) 2015年 123. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Tools.h"
#import "ChatInfoVC.h"
#import "TabVC.h"
#import "ChatData.h"
extern NSMutableDictionary *mvcDic;
extern NSDictionary *chatDataDic;
extern AVAudioPlayer *auplayer;
extern  NSMutableArray *viewArr;
typedef void (^newmessage)(NSArray *name_arr);
@interface CharVC : UIViewController
@property (strong,atomic)FriendVO *people;
@property (copy,nonatomic) newmessage message;

@property BOOL isChatInfo;

@end
