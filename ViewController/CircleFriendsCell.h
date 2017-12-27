//
//  CircleFriendsCell.h
//  Chat
//
//  Created by jason on 15/11/10.
//  Copyright © 2015年 123. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Bean.h"
typedef  void (^btnCkick)();
@interface CircleFriendsCell : UITableViewCell
@property (nonatomic,readwrite,copy) btnCkick block;
@property (strong,nonatomic)UIButton *btn;
@property (strong,nonatomic)UIImageView *iv_xs;

- (void)addData:(DynamicVO *)fvo withblock:(btnCkick)btnBlock;

@end
