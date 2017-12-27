//
//  ChatScorll.h
//  Chat
//
//  Created by ly on 15/10/28.
//  Copyright (c) 2015年 123. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Bean.h"
#import "ChatCell.h"
#define scrW [[UIScreen mainScreen] bounds].size.width
#define scrH [[UIScreen  mainScreen] bounds].size.height
extern NSMutableArray *viewArr;
@interface ChatScorll : UIScrollView

-(void) addDialog:(DialogVO *) dialog andVO:(FriendVO *)fvo withDic:(NSMutableDictionary *) dic withshowSendButton:(BOOL) showSendButton withClickBlock:(sendButtonClick) sendBlock withimgBlock:(imgButtonClick) imgsBlock;
-(void) removeAllDialog;
@end
