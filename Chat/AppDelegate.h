//
//  AppDelegate.h
//  Chat
//
//  Created by 123 on 15/10/27.
//  Copyright (c) 2015年 123. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TabVC.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (nonatomic,strong) TabVC *tb;
@property (nonatomic,strong) UINavigationController *nav;
@end

