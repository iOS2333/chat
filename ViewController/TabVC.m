//
//  TabVC.m
//  
//
//  Created by 123 on 15/10/27.
//
//

#import "TabVC.h"
#define scrW [[UIScreen mainScreen] bounds].size.width
#define scrH [[UIScreen  mainScreen] bounds].size.height
@interface TabVC ()

@end

@implementation TabVC
-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    //设置白色字体的状态栏
      [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:YES];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor clearColor];
    FirstViewController *fvc = [[FirstViewController alloc] init];
    SecViewController *svc= [[SecViewController alloc] init];
    TriViewController *tvc = [[TriViewController alloc] init];
    FourViewController *fovc = [[FourViewController alloc] init];
    NSArray *namearr = @[@"消息",@"通讯录",@"发现",@"我"];
    NSArray *img = @[@"iconfont-xiaoxi.png",@"iconfont-tongxunlu.png",@"iconfont-faxian.png",@"iconfont-wo.png"];
    NSArray *selectimg = @[@"iconfont-xiaoxiselect.png",@"iconfont-tongxunluselect.png",@"iconfont-faxianselect.png",@"iconfont-woselect.png"];
    NSArray *vcarr = @[fvc,svc,tvc,fovc];
    NSMutableArray *m_arr = [NSMutableArray array];
    NSInteger i = 0;
    for (NSString *str in namearr) {
          UIViewController *vc = vcarr[i];
        UINavigationController *nvc = [[UINavigationController alloc]initWithRootViewController:vc];
        nvc.navigationBar.barTintColor = [UIColor colorWithHexString:@"2c2a31"];
        UITabBarItem *tb = [[UITabBarItem alloc] initWithTitle:str image:[[UIImage imageNamed:img[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:selectimg[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        nvc.tabBarItem = tb;
        UILabel *lb = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, scrW , 30)];
        lb.textAlignment = NSTextAlignmentCenter;
        lb.textColor = [UIColor whiteColor];
        lb.text = namearr[i];
        vc.navigationItem.titleView = lb;
        [m_arr addObject:nvc];
        
        i++;
    }
    
    self.viewControllers = m_arr;
    UILabel *lb = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, scrW, 30)];
    lb.textColor = [UIColor whiteColor];
    lb.textAlignment = NSTextAlignmentCenter;
    lb.text =@"消息";
    self.navigationItem.titleView = lb;
    self.tabBar.tintColor = [UIColor colorWithHexString:@"09bb07"];

}
-(void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item{
    NSLog(@"%@",item.title);
    UILabel *lb = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, scrW, 30)];
    lb.textColor = [UIColor whiteColor];
    lb.textAlignment = NSTextAlignmentCenter;
    lb.text = item.title;
    self.navigationItem.titleView = lb;
   
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
