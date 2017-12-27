//
//  CircleFriendsVC.m
//  Chat
//
//  Created by jason on 15/11/10.
//  Copyright © 2015年 123. All rights reserved.
//

#import "CircleFriendsVC.h"
#import "CircleFriendsCell.h"
#import "Bean.h"
#import "DBUtil.h"
#import "Tools.h"

#define scrW [[UIScreen mainScreen] bounds].size.width
#define scrH [[UIScreen  mainScreen] bounds].size.height

@interface CircleFriendsVC () {
    UITableView *_tb;
    NSMutableArray *friendArr;
    UIView *navigationview;

    NSString *name;
    
    NSNumber *zanSelectNum;
    
}

@end

@implementation CircleFriendsVC

-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    //设置白色字体的状态栏
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:YES];
    self.navigationController.navigationBarHidden = YES;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    self.view.backgroundColor =
    
    
    friendArr = [NSMutableArray arrayWithCapacity:0];
    friendArr = [DBUtil fetchClass:[DynamicVO class] byDialogID:nil];
    
    for (NSInteger i = 0; i < [friendArr count]; i++) {
         DynamicVO *fvo = [friendArr objectAtIndex:i];
        name = fvo.name;
    }
    
    [self initViews];
    
    [self customNA];
    
}

- (void)customNA{
    navigationview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 64)];
    [self.view addSubview:navigationview];
    navigationview.backgroundColor = [UIColor colorWithHexString:@"2c2a31"];
    
    UIImage *backimg = [UIImage imageNamed:@"jiantou.png"];
    UIImageView *back = [[UIImageView alloc] initWithFrame:CGRectMake(7, 20+22-backimg.size.height/2, backimg.size.width, backimg.size.height)];
    back.image = backimg;
    back.transform = CGAffineTransformMakeScale(-1, 1);
    [navigationview addSubview:back];
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(5,22 , 60, 40)];
    [btn setTitle:@"发现" forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:14];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [navigationview addSubview:btn];
    [btn addTarget:self action:@selector(ItemCLick) forControlEvents:UIControlEventTouchUpInside];
    UILabel *lb = [[UILabel alloc] initWithFrame:CGRectMake(navigationview.frame.size.width/2 - 20, 20+(navigationview.frame.size.height -20)/2-20, 100, 40)];
    lb.text = @"朋友圈";
    lb.font = [UIFont boldSystemFontOfSize:15];
    lb.textColor = [UIColor whiteColor];
    [navigationview addSubview:lb];
    
    UIImage *img_ca = [UIImage imageNamed:@"cir_camera.png"];
    UIImageView *iv_ca = [[UIImageView alloc] initWithFrame:CGRectMake(scrW-img_ca.size.width-10, lb.frame.origin.y+12, img_ca.size.width, img_ca.size.height)];
    iv_ca.image = img_ca;
    [navigationview addSubview:iv_ca];
    
}

- (void)initViews {

    _tb = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, scrW, scrH)];
    _tb.delegate = self;
    _tb.dataSource = self;
    _tb.separatorStyle = UITableViewCellSeparatorStyleNone;
//    _tb.backgroundColor = [UIColor colorWithRed:130/255.0 green:130/255.0 blue:127/255.0 alpha:1];
    
    UIView *v_bj = [[UIView alloc] initWithFrame:CGRectMake(0, 0, scrW, 380)];
    v_bj.backgroundColor = [UIColor whiteColor];
    
    UIImage *img_bj = [UIImage imageNamed:@"new_cir_bj.png"];
    UIImageView *iv_bj = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, scrW, img_bj.size.height)];
    iv_bj.image = img_bj;
    [v_bj addSubview:iv_bj];
    
    UIImage *img_icon_bj = [UIImage imageNamed:@"cir_icon_bj.png"];
    UIImageView *iv_icon_bj = [[UIImageView alloc] initWithFrame:CGRectMake(scrW - img_icon_bj.size.width-10, 268, img_icon_bj.size.width, img_icon_bj.size.height)];
    iv_icon_bj.image = img_icon_bj;
    [v_bj addSubview:iv_icon_bj];
    
    UIImage *img_iocn = [UIImage imageNamed:@"cir_icon.png"];
    UIImageView *iv_iocn = [[UIImageView alloc] initWithFrame:CGRectMake((iv_icon_bj.frame.size.width-img_iocn.size.width)/2, (iv_icon_bj.frame.size.height - img_iocn.size.height)/2, img_iocn.size.width, img_iocn.size.height)];
    iv_iocn.image = img_iocn;
    [iv_icon_bj addSubview:iv_iocn];
    
    UILabel *lab_name = [[UILabel alloc] initWithFrame:CGRectMake(iv_icon_bj.frame.origin.x-160, iv_bj.frame.size.height-40, 140, 20)];
    lab_name.backgroundColor = [UIColor clearColor];
    lab_name.textAlignment = NSTextAlignmentRight;
    lab_name.textColor = [UIColor whiteColor];
    lab_name.font = [UIFont boldSystemFontOfSize:18];
    lab_name.text = name;
    [v_bj addSubview:lab_name];

    _tb.tableHeaderView = v_bj;
    _tb.sectionHeaderHeight = v_bj.frame.size.height;
    [_tb setTableFooterView:[[UIView alloc] init]];
    [self.view addSubview:_tb];
    
    
}

- (void)ItemCLick{
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DynamicVO *fvo = [friendArr objectAtIndex:indexPath.row];
    static NSString *circle_friend_cell = @"cell";
    CircleFriendsCell *cell = [tableView dequeueReusableCellWithIdentifier:circle_friend_cell];
    if (cell == nil) {
        
 
            cell = [[CircleFriendsCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:circle_friend_cell];
        cell.backgroundColor = [UIColor whiteColor];
            //让cell不可点击
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            [cell awakeFromNib];
        
    }
    if (!fvo.isZan) {
       
//        cell.btn.hidden = NO;
        cell.iv_xs.hidden = YES;
    }else{
//        cell.btn.hidden = YES;
        cell.iv_xs.hidden = NO;
        fvo.isZan = TRUE;
    }
        
    [cell addData:fvo withblock:^() {
        
            fvo.isZan = TRUE;

            [DBUtil saveVO:@[fvo]];
    }];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return friendArr.count;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CGFloat height;
        DynamicVO *fvo = [friendArr objectAtIndex:indexPath.row];
        CGSize sizeH = [fvo.content sizeWithFont:[UIFont systemFontOfSize:16] constrainedToSize:CGSizeMake(scrW, 20000.0f) lineBreakMode:NSLineBreakByWordWrapping];
        if (sizeH.height > 30) {
            height = sizeH.height+145;
        }else {
            height = 145;
        }
    
    return height;

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"anniu == %zd",indexPath.row);
    

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
