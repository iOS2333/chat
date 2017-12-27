//
//  ShakeVC.m
//  Chat
//
//  Created by 123 on 15/11/13.
//  Copyright © 2015年 123. All rights reserved.
//
#import "Util.h"
#import "ShakeVC.h"
#import "Tools.h"
#import "CharVC.h"
#import "Util.h"
#import "PeopleDetailView.h"
#define scrW [[UIScreen mainScreen] bounds].size.width
#define scrH [[UIScreen  mainScreen] bounds].size.height
@interface ShakeVC ()
{
    NSTimer *_timer;
    UIView *navigationview;
    SystemSoundID  soundID;
    UIImageView *imgDown;
    UIImageView *imgUp;
    CGFloat my;
    UIButton *sbtn;
    UIButton *bbtn;
    UIView *shake_View;
    UIImageView *shake_p;
    UIView *newFriendView;
    UIImageView *newFriendHeader;
    UILabel *labName;
    FriendVO *yFriend;
    
}
@end

@implementation ShakeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
    [self customNA];
    [self customShakeUI];
    
    
      // 设置允许摇一摇功能
    [UIApplication sharedApplication].applicationSupportsShakeToEdit = YES;
    // 并让自己成为第一响应者
    [self becomeFirstResponder];
}
-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    //设置白色字体的状态栏
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:YES];
    self.navigationController.navigationBarHidden = YES;
}
- (void)customShakeUI{
    shake_View = [[UIView alloc] initWithFrame:CGRectMake(0, navigationview.frame.size.height, scrW, scrH-navigationview.frame.size.height)];
    [self.view addSubview:shake_View];
    UIImage *backimg = [UIImage imageNamed:@"bks.jpg"];
    UIImageView *back_shake = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0,shake_View.frame.size.width, shake_View.frame.size.height)];
    back_shake.image = backimg;
    [shake_View addSubview:back_shake];
     UIImage *backimg1 = [UIImage imageNamed:@"bg_shake_di.png"];
    UIImageView *back_s = [[UIImageView alloc] initWithFrame:CGRectMake(0, back_shake.frame.size.height - backimg1.size.height,scrW,backimg1.size.height*2)];
    back_s.image = backimg1;
    [shake_View addSubview:back_s];
    UIImage *shake_xin = [UIImage imageNamed:@"shake_center.png"];
    UIImageView *shake_x = [[UIImageView alloc] initWithFrame:CGRectMake(scrW/2-shake_xin.size.width*1.2/2, scrH/2-shake_xin.size.height*1.5,shake_xin.size.width*1.2,  shake_xin.size.height*1.2)];
    shake_x.image = shake_xin;
    [shake_View addSubview:shake_x];
  
    UIImage *shake_phone = [UIImage imageNamed:@"shake_phone.png"];
    shake_p = [[UIImageView alloc] initWithFrame:CGRectMake(shake_xin.size.width*1.2/2-shake_phone.size.width/2,shake_xin.size.height*1.4/2-shake_phone.size.height/2,shake_phone.size.width,shake_phone.size.height)];
    shake_p.image = shake_phone;
    [shake_x addSubview:shake_p];
    [self shake];
    _timer = [NSTimer scheduledTimerWithTimeInterval:2.5 target:self selector:@selector(shake) userInfo:nil repeats:YES];
   
//    [shake_p.layer removeAnimationForKey:@"ani"];
     UIImage *shake_zi = [UIImage imageNamed:@"shake_zi.png"];
    UIImageView *shake_z = [[UIImageView alloc] initWithFrame:CGRectMake(scrW/2-shake_zi.size.width*1.5/2, back_s.frame.origin.y - shake_zi.size.height*3,shake_zi.size.width*1.5,  shake_zi.size.height*1.5)];
    shake_z.image = shake_zi;
    [shake_View addSubview:shake_z];
    
    
}
- (void)shake{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];//创建核心动画//transform.scale是缩放
    animation.fromValue = [NSNumber numberWithFloat:-M_PI/36];//动画初始//@1.5是代表直接将数字转化为对象类型
    animation.toValue = [NSNumber numberWithFloat:M_PI/36];//动画末值
    animation.duration = 0.1;//一次动画时间
    animation.repeatCount = 5;//循环播放次数
    animation.autoreverses = YES;//动画方式返回
    animation.fillMode = kCAFillModeForwards;
    [shake_p.layer addAnimation:animation forKey:@"ani"];//开始动画

}
#pragma mark - 摇一摇相关方法
// 摇一摇开始摇动
- (void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    NSLog(@"开始摇动");
   
    return;
}

// 摇一摇取消摇动
- (void)motionCancelled:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    NSLog(@"取消摇动");
    return;
}

// 摇一摇摇动结束
- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    if (event.subtype == UIEventSubtypeMotionShake) { // 判断是否是摇动结束
        NSString *path = [[NSBundle mainBundle] pathForResource:@"glass" ofType:@"wav"];
        AudioServicesCreateSystemSoundID((__bridge CFURLRef)[NSURL fileURLWithPath:path], &soundID);
        
        AudioServicesPlaySystemSound (soundID);

        NSLog(@"摇动结束");
        [shake_View removeFromSuperview];
        [self showNewFriend];
    }
    return;
}
- (void)btnClick:(UIButton *)sender{
    
    [self hiddenNewFriend];
    
     if(sender.tag == 11){
        if (yFriend) {
            [DBUtil saveVO:@[yFriend]];
            [[NSNotificationCenter  defaultCenter] postNotificationName:@"newpeople" object:yFriend];
            
            }
        [self.navigationController popViewControllerAnimated:YES];
     }else{
         [self customShakeUI];
     }
}
- (void)customNA{
    navigationview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 64)];
    [self.view addSubview:navigationview];
    navigationview.backgroundColor = [UIColor colorWithHexString:@"2c2a31"];;
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(5,22 , 60, 40)];
    [btn setTitle:@"返回" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [navigationview addSubview:btn];
    [btn addTarget:self action:@selector(ItemCLick) forControlEvents:UIControlEventTouchUpInside];
    UILabel *lb = [[UILabel alloc] initWithFrame:CGRectMake(navigationview.frame.size.width/2 - 30, 20+(navigationview.frame.size.height -20)/2-20, 60, 40)];
    lb.text =@"摇一摇";
    lb.font = [UIFont boldSystemFontOfSize:17];
    lb.textColor = [UIColor whiteColor];
    [navigationview addSubview:lb];
    
}

- (void)ItemCLick{
   
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void) showNewFriend{
    
    [self get_new_friend];

    if (newFriendView==nil) {
        UIImage *img = [UIImage imageNamed:@"bks.jpg"];
        newFriendView = [[UIView alloc] initWithFrame:CGRectMake(0, navigationview.frame.size.height, self.view.bounds.size.width, self.view.bounds.size.height-navigationview.frame.size.height)];
        newFriendView.backgroundColor = [UIColor colorWithPatternImage:img];
        newFriendHeader = [[UIImageView alloc] initWithFrame:CGRectMake((self.view.bounds.size.width-80)/2, 120, 80, 80)];
        
        [newFriendView addSubview:newFriendHeader];
        [newFriendHeader addClickBlock:^(NSInteger tag) {
            [self customPeopleDetail:yFriend];
        }];
        CGFloat msy = newFriendHeader.frame.origin.y + newFriendHeader.frame.size.height;
        labName = [[UILabel alloc] initWithFrame:CGRectMake(0,msy+20, self.view.bounds.size.width, 50)];
        labName.backgroundColor = [UIColor clearColor];
        labName.textColor = [UIColor whiteColor];
        labName.font = [UIFont boldSystemFontOfSize:20];
        labName.textAlignment = NSTextAlignmentCenter;
        [newFriendView addSubview:labName];
        
        UIImage *btnimg = [UIImage imageNamed:@"bt_diamondshake.png"];
        sbtn = [UIButton buttonWithType:UIButtonTypeCustom];
        sbtn.frame = CGRectMake(scrW/4 - btnimg.size.width/2,scrH/2,btnimg.size.width,btnimg.size.height);
        [sbtn setTitle:@"重摇" forState:UIControlStateNormal];
        sbtn.titleLabel.font = [UIFont systemFontOfSize:18];
        [sbtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
         sbtn.tag = 10;
        
        sbtn.layer.masksToBounds = YES;
        sbtn.layer.cornerRadius = 5;
         sbtn.backgroundColor = __RGB(0x94b6da);
        
        
        [newFriendView addSubview:sbtn];
        [sbtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        bbtn = [UIButton buttonWithType:UIButtonTypeCustom];
        bbtn.frame = CGRectMake(scrW/4 - btnimg.size.width/2+scrW/2,scrH/2,btnimg.size.width,btnimg.size.height);
        [bbtn setTitle:@"添加" forState:UIControlStateNormal];
        bbtn.titleLabel.font = [UIFont systemFontOfSize:18];
        [bbtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        bbtn.tag = 11;
        
        bbtn.layer.masksToBounds = YES;
        bbtn.layer.cornerRadius = 5;
        bbtn.backgroundColor = __RGB(0x94b6da);
        
        [newFriendView addSubview:bbtn];
        [bbtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.view addSubview:newFriendView];

    }
    
    newFriendHeader.image = [UIImage imageNamed:yFriend.myicon];
    labName.text  = yFriend.name;
    
            newFriendView.hidden = NO;

}

-(void) hiddenNewFriend{

    newFriendView.hidden = YES;
}

- (void)customPeopleDetail:(FriendVO *)peoplevo{
    PeopleDetailView *pview = [[PeopleDetailView alloc] initWithFrame:self.view.frame];
    [pview customContentWithname:peoplevo.name PeopleDetail:peoplevo.peopleDetailContent Img:peoplevo.peopleDetailimg];
    [self.view addSubview:pview];
}

-(void) get_new_friend{
    if ([peopleCount integerValue]<6) {
        FriendVO *newfriend = [[FriendVO alloc] init];
        newfriend.name = [name_arr  objectAtIndex:[peopleCount integerValue]];
        newfriend.user_id = [NSString stringWithFormat:@"%zd",200+[peopleCount integerValue]];
        newfriend.myicon = [icon  objectAtIndex:[peopleCount integerValue]];
        newfriend.occ = [occ_arr   objectAtIndex:[peopleCount integerValue]];
        newfriend.peopleDetailimg = [peopleicon  objectAtIndex:[peopleCount integerValue]];
        newfriend.peopleDetailContent = [peopleContent   objectAtIndex:[peopleCount integerValue]];
        yFriend = newfriend;
       ;
    }else{
        UIAlertView *alert = [[UIAlertView alloc ] initWithTitle:ALERT_TITLE message:@"您摇的太厉害,请明天再试" delegate:self cancelButtonTitle:ALERT_CANCEL otherButtonTitles:nil, nil];
        [alert show];
         [self.navigationController popViewControllerAnimated:YES];
    }
   
   }
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
