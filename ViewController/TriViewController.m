//
//  TriViewController.m
//  
//
//  Created by 123 on 15/10/27.
//
//

#import "TriViewController.h"
#import "JTexView.h"
#import "Tools.h"
#import "CircleFriendsVC.h"
#import "AppDelegate.h"

#define scrW [[UIScreen mainScreen] bounds].size.width
#define scrH [[UIScreen  mainScreen] bounds].size.height


@interface TriViewController ()<JTextViewDelegate> {

    UITableView *_tb;
    NSArray *imgArr;
    NSArray *imgArr1;
    NSArray *imgArr2;
    NSArray *imgArr3;
    NSArray *imgArr4;
    NSArray *titleArr;
    NSArray *titleArr1;
    NSArray *titleArr2;
    NSArray *titleArr3;
    NSArray *titleArr4;
}

@end

@implementation TriViewController

-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    //设置白色字体的状态栏
     [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:YES];
    self.navigationController.navigationBarHidden = NO;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    
    

    self.view.backgroundColor = [UIColor colorWithHexString:@"efeff4"];
    [self initviews];
}


- (void) initviews {
    
    imgArr1 = @[@"pengyouquan.png"];
    imgArr2 = @[@"saoyisao.png",@"yaoyiyao.png"];
    imgArr3 = @[@"fujin.png",@"piaoliup.png"];
    imgArr4 = @[@"shop.png",@"game.png"];
    imgArr = @[imgArr1,imgArr2,imgArr3,imgArr4];
    
    titleArr1 = @[@"朋友圈"];
    titleArr2 = @[@"扫一扫",@"摇一摇"];
    titleArr3 = @[@"附近的人",@"漂流瓶"];
    titleArr4 = @[@"购物",@"游戏"];
    titleArr = @[titleArr1,titleArr2,titleArr3,titleArr4];
    

    
    _tb = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, scrW, scrH- 64) style:UITableViewStyleGrouped];
    _tb.backgroundColor = [UIColor whiteColor];
    _tb.dataSource = self;
    _tb.delegate = self;

    _tb.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tb.backgroundColor = [UIColor colorWithHexString:@"efeff4"];

    [self.view addSubview:_tb];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *find_id = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:find_id];
    cell.backgroundColor = [UIColor whiteColor];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:find_id];
        
        UIImageView *iv_icon = [[UIImageView alloc] initWithFrame:CGRectMake(20, 12, 21, 21)];
        iv_icon.tag = 50;
        [cell addSubview:iv_icon];
        
        UILabel *lab_title = [[UILabel alloc] initWithFrame:CGRectMake(iv_icon.frame.size.width+iv_icon.frame.origin.x+10, 13, 160, 20)];
        lab_title.backgroundColor = [UIColor clearColor];
        lab_title.tag = 51;
        lab_title.textAlignment = NSTextAlignmentLeft;
        lab_title.textColor = [UIColor blackColor];
        lab_title.font = [UIFont systemFontOfSize:14];
        [cell addSubview:lab_title];
        
        UIImage *img_k = [UIImage imageNamed:@"jiantou.png"];
        UIImageView *iv_k = [[UIImageView alloc] initWithFrame:CGRectMake(scrW-img_k.size.width-10, 22.5-img_k.size.height/2, img_k.size.width, img_k.size.height)];
        iv_k.image = img_k;
        [cell addSubview:iv_k];
        
        UIView *v = [[UIView alloc] initWithFrame:CGRectMake(20, 44.5, scrW-20, 0.5)];
        v.tag = 52;
        [cell addSubview:v];
        
        UIView *v1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, scrW, 0.5)];
        v1.tag = 53;
        [cell addSubview:v1];
        
        UIView *v2 = [[UIView alloc] initWithFrame:CGRectMake(0, 45, scrW, 0.5)];
        v2.tag = 54;
        [cell addSubview:v2];
        
    }
    
    UIImageView *iv = (UIImageView *)[cell viewWithTag:50];
    iv.image = [UIImage imageNamed:(imgArr[indexPath.section])[indexPath.row]];
    iv.contentMode = UIViewContentModeScaleAspectFit;
    
    UILabel *lab = (UILabel *)[cell viewWithTag:51];
    lab.text = (titleArr[indexPath.section])[indexPath.row];
    
    if (indexPath.section != 0  && indexPath.row == 0) {
        UIView *v1 = (UIView *)[cell viewWithTag:52];
        v1.backgroundColor = [UIColor colorWithHexString:@"d9d9d9"];
    }

    if (indexPath.section == 0) {
        UIView *v_fen1 = (UIView *)[cell viewWithTag:53];
        v_fen1.backgroundColor = [UIColor colorWithHexString:@"d9d9d9"];
        
        UIView *v_fen2 = (UIView *)[cell viewWithTag:54];
        v_fen2.backgroundColor = [UIColor colorWithHexString:@"d9d9d9"];
    }else{
        if (indexPath.row == 0) {
            UIView *v_fen1 = (UIView *)[cell viewWithTag:53];
            v_fen1.backgroundColor = [UIColor colorWithHexString:@"d9d9d9"];
        }else {
            UIView *v_fen2 = (UIView *)[cell viewWithTag:54];
            v_fen2.backgroundColor = [UIColor colorWithHexString:@"d9d9d9"];
        }
    }
    
    
    
    
    return cell;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [(NSArray *)titleArr[section] count];
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 15.0;
    }else {
        return 2.0;
    }
 
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 45;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{

    UIView *header_v = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, 20)];
    header_v.backgroundColor = [UIColor colorWithHexString:@"efeff4"];
    return header_v;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return titleArr.count;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell * cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.backgroundColor = [UIColor whiteColor];
    
    if (indexPath.section == 0) {
        CircleFriendsVC *vc = [[CircleFriendsVC alloc] init];
//        [self.navigationController pushViewController:vc animated:YES];
        [[(AppDelegate *)[[UIApplication sharedApplication] delegate] tb].navigationController pushViewController:vc animated:YES];
    }

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
