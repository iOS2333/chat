//
//  SexViewController.m
//  
//
//  Created by 123 on 15/11/27.
//
//

#import "SexViewController.h"
#import "AppDelegate.h"
#import "Tools.h"
#import "ChatData.h"
#define scrW [[UIScreen mainScreen] bounds].size.width
#define scrH [[UIScreen  mainScreen] bounds].size.height
@interface SexViewController ()

@end

@implementation SexViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UILabel *lb = [[UILabel alloc] initWithFrame:CGRectMake(0, scrH/2-100, scrW, 30)];
    lb.textColor = [UIColor blackColor];
    lb.text = @"请选择您的性别";
    lb.textAlignment = NSTextAlignmentCenter;
    lb.font = [UIFont boldSystemFontOfSize:20];
    [self.view addSubview:lb];
    NSArray *sex_arr = @[@"nan.png",@"nv.png"];
    for (NSInteger i = 0; i<2; i++) {
        UIButton *btn  = [UIButton buttonWithType:UIButtonTypeCustom];
        UIImage *iconimg = [UIImage imageNamed:sex_arr[i]];
        btn.frame = CGRectMake((scrW/4 - iconimg.size.width/2)+scrW/2*i, scrH/2 - iconimg.size.height/2, iconimg.size.width, iconimg.size.height);
        [btn setImage:iconimg forState:UIControlStateNormal];
        btn.tag = 10+i;
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
        UILabel *sex_lb = [[UILabel alloc] initWithFrame:CGRectMake((scrW/4 - 12)+scrW/2*i, btn.frame.origin.y+iconimg.size.height, 30, 30)];
        if (i == 0) {
            sex_lb.text = @"男";
            sex_lb.textColor = [UIColor colorWithHexString:@"81aaf5"];
        }else{
            sex_lb.text = @"女";
             sex_lb.textColor = [UIColor colorWithHexString:@"f899bf"];
        }
        sex_lb.textAlignment = NSTextAlignmentCenter;
        [self.view addSubview:sex_lb];
    }
}
- (void)btnClick:(UIButton *)sender{
    if (sender.tag == 10) {//nan
         [[NSUserDefaults standardUserDefaults] setObject:@"0" forKey:@"__initSex"];
        chatDataDic = [ChatData readchatdatawithSex:[NSNumber numberWithInteger:0]];
    }else{
         [[NSUserDefaults standardUserDefaults] setObject:@"1" forKey:@"__initSex"];
         chatDataDic = [ChatData readchatdatawithSex:[NSNumber numberWithInteger:1]];
    }
    [UIApplication sharedApplication].keyWindow.rootViewController =  [(AppDelegate *)[[UIApplication sharedApplication] delegate] nav];
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
