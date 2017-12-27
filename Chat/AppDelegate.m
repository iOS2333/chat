//
//  AppDelegate.m
//  Chat
//
//  Created by 123 on 15/10/27.
//  Copyright (c) 2015年 123. All rights reserved.
//

#import "AppDelegate.h"
#import "TabVC.h"
#import "Util.h"
#import "SexViewController.h"
#import "ChatData.h"
NSMutableDictionary *mvcDic;
NSDictionary *chatDataDic;
NSMutableArray *icon;
NSMutableArray *name_arr;
NSMutableArray *occ_arr;
NSMutableArray *peopleicon;
NSMutableArray *peopleContent;
NSNumber *peopleCount;
AVAudioPlayer *auplayer;
NSNumber *playID;
NSMutableArray *viewArr;

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    //设置白色字体的状态栏
    
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:YES];
    
    playID = [NSNumber numberWithInteger:0];
    viewArr = [NSMutableArray array];
    icon =[NSMutableArray arrayWithArray:@[@"Bondd.png",@"Maxd.png",@"Blackd.png",@"Beckhamd.png",@"Beard.png",@"Oprahd.png"]];
    name_arr =[NSMutableArray arrayWithArray:@[@"James Bond",@"Max Black",@"Adam Levine",@"Victoria Beckham",@"Bear Grylls",@"Oprah Winfrey"]];
    occ_arr = [NSMutableArray arrayWithArray:@[@"侦探", @"企业家",@"音乐老师",@"教师",@"探险家",@"医生"]];
    peopleicon = [NSMutableArray arrayWithArray:@[@"Bond.png",@"Max.png",@"Black.png",@"Beckham.png",@"Bear.png",@"Oprah.png"]];
    peopleContent = [NSMutableArray arrayWithArray:@[@"James Bond, code 007. A spy of British, he has a Aston Matin as ride. James is not only an excellent spy but also an attrctive gentalman.",
                                                     @"One of the heroines of the Two Broke Girls. She runs a cake shop with her friend Coraline. Max is always very practical and she has a sharp tongue. Coraline is more idealized and she is a very good saleswoman.",
                                                     @"Lead singer of the rock band Maroon 5. Sugar is the theme song of the latest album V. The MV of the song is full of originalities. The whole band suddenly appears on the wedding ceremonies and sing the song Sugar. Adam’s wife is Behati Prinsloo, a super model.  ",
                                                     @"The wife of football star David Beckham. They have three sons and a little daughter Harper. She was a singer before and later a designer, in 2006 she built her own brand, DVB",
                                                     @"A British adventurer, writer and television presenter.Grylls is also involved in a number of wilderness survival television series in the UK and US.",
                                                     @"A famous hostess. She is the first black billionaire. The most program of her was the Oprah Winfrey Show which stopped in 2006."]];
    peopleCount = [NSNumber numberWithInteger:1];
    //initData
//    [DBUtil cleanAll];
//    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"__initdb"];
    if ([[NSUserDefaults standardUserDefaults] objectForKey:@"__initdb"] == nil) {
        [self initData];
        [[NSUserDefaults standardUserDefaults] setObject:@"0" forKey:@"__initdb"];
    }
    
    mvcDic = [NSMutableDictionary dictionary];

    _tb = [[TabVC alloc] init];
    _nav = [[UINavigationController alloc] initWithRootViewController:_tb];
   _nav.navigationBar.barTintColor = [UIColor colorWithHexString:@"2c2a31"];
  
    if ([[NSUserDefaults standardUserDefaults] objectForKey:@"__initSex"] == nil) {
        SexViewController *vc = [[SexViewController alloc] init];
        self.window.rootViewController = vc;
    }else{
        NSString *sex = [[NSUserDefaults standardUserDefaults] objectForKey:@"__initSex"];
      chatDataDic = [ChatData readchatdatawithSex:[NSNumber numberWithInteger:[sex integerValue]]];
        
        self.window.rootViewController = _nav;
    }
     [self.window makeKeyAndVisible];

    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    NSLog(@"4");
    [[NSNotificationCenter defaultCenter] postNotificationName:@"savevo" object:nil];
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    NSLog(@"1");
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    NSLog(@"2");
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    NSLog(@"3");
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}
- (void)initData{
    
    for (NSInteger i = 0; i<5; i++) {
        FriendVO *people = [[FriendVO alloc] init];
        people.name = [name_arr objectAtIndex:(i)];;
        people.myicon = [icon objectAtIndex:(i)];
        people.user_id = [NSString stringWithFormat:@"%zd",i+200];
        people.age = [NSNumber numberWithInteger:20+i];
        people.occ = [occ_arr objectAtIndex:i];
        people.peopleDetailimg = peopleicon[i];
        people.peopleDetailContent = peopleContent[i];
        if (i %2 == 0){
            people.sex = [NSNumber numberWithInteger:0];//男
        }else{
              people.sex = [NSNumber numberWithInteger:1];//女
        }
       [DBUtil saveVO:@[people]];
    }
    
    
    for (NSInteger j = 0; j < 6; j++) {
        DynamicVO *dynamic = [[DynamicVO alloc] init];
            dynamic.name = @"Jerffy";
            dynamic.friendname = name_arr[j];
            dynamic.dynamicId = [NSString stringWithFormat:@"%zd",j+60];
            dynamic.friendicon = icon[j];
            dynamic.content = @"这男的就发生的合肥结构的,施工方的说法是更好撒黄瓜腹股沟俄语区办不成，不合适的发广告业务前后期为公司萨卡卡布操场飙车三八块的开发第三方第三方华安大师傅老师老地方和沙拉的老师家地方海事局";
            dynamic.time = @"2天前";
            dynamic.isZan = FALSE;
        [DBUtil saveVO:@[dynamic]];
    }

}
@end
