//
//  FourViewController.m
//
//
//  Created by 123 on 15/10/27.
//
//

#import "FourViewController.h"
#import "DBUtil.h"
#import "Bean.h"
#import "Tools.h"

#define scrW [[UIScreen mainScreen] bounds].size.width
#define scrH [[UIScreen  mainScreen] bounds].size.height


@interface FourViewController (){
    
    UITableView *_tb;
    NSArray *imgArr;
    NSArray *imgArr0;
    NSArray *imgArr1;
    NSArray *imgArr2;
    NSArray *imgArr3;
    NSArray *titleArr;
    NSArray *titleArr0;
    NSArray *titleArr1;
    NSArray *titleArr2;
    NSArray *titleArr3;
    
}

@end

@implementation FourViewController


-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    //设置白色字体的状态栏
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:YES];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBarHidden = NO;
    
    self.view.backgroundColor = [UIColor colorWithHexString:@"efeff4"];
    
    [self initViews];
}


- (void)initViews {
    
    imgArr0 = @[@""];
    imgArr1 = @[@"xiaoce.png",@"shoucang.png",@"qianbao.png",@"kabao.png"];
    imgArr2 = @[@"biaoqing.png"];
    imgArr3 = @[@"setting.png"];
    imgArr = @[imgArr0,imgArr1,imgArr2,imgArr3];
    
    titleArr0 = @[@""];
    titleArr1 = @[@"相册",@"收藏",@"钱包",@"卡包"];
    titleArr2 = @[@"表情"];
    titleArr3 = @[@"设置"];
    titleArr = @[titleArr0,titleArr1,titleArr2,titleArr3];
    
    
    _tb = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, scrW, scrH-49) style:UITableViewStyleGrouped];
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
        
        if (indexPath.section == 0) {
            
            UIImage *img_me = [UIImage imageNamed:@"myicon.png"];
            UIImageView *iv_me = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, img_me.size.width, img_me.size.height)];
            iv_me.image = img_me;
            [cell addSubview:iv_me];
            
            UILabel *lab_name = [[UILabel alloc] initWithFrame:CGRectMake(iv_me.frame.origin.x+iv_me.frame.size.width+10, 18, 180, 20)];
            lab_name.backgroundColor = [UIColor clearColor];
            lab_name.textAlignment = NSTextAlignmentLeft;
            lab_name.textColor = [UIColor blackColor];
            lab_name.font = [UIFont systemFontOfSize:14];
            lab_name.tag = 61;
            [cell addSubview:lab_name];
            
            UILabel *lab_wx = [[UILabel alloc] initWithFrame:CGRectMake(lab_name.frame.origin.x, lab_name.frame.origin.y+lab_name.frame.size.height+10, scrW-100, 20)];
            lab_wx.backgroundColor = [UIColor clearColor];
            lab_wx.textAlignment = NSTextAlignmentLeft;
            lab_wx.textColor = [UIColor blackColor];
            lab_wx.font = [UIFont systemFontOfSize:14];
            lab_wx.tag = 62;
            [cell addSubview:lab_wx];
            
            UIImage *img_jt = [UIImage imageNamed:@"jiantou.png"];
            UIImageView *iv_jt = [[UIImageView alloc] initWithFrame:CGRectMake(scrW-img_jt.size.width-10, (85-img_jt.size.height)/2, img_jt.size.width, img_jt.size.height)];
            iv_jt.image = img_jt;
            [cell addSubview:iv_jt];
            
            
            UIView *v1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, scrW, 0.5)];
            v1.tag = 63;
            [cell addSubview:v1];
            
            UIView *v2 = [[UIView alloc] initWithFrame:CGRectMake(0, 85, scrW, 0.5)];
            v2.tag = 64;
            [cell addSubview:v2];
            
        }else {
            
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
        
    }
    
    if (indexPath.section == 0) {
        
        UILabel *lab_n = (UILabel *)[cell viewWithTag:61];
        lab_n.text = @"隔壁老王";
        
        UILabel *lab_w = (UILabel *)[cell viewWithTag:62];
        lab_w.text = @"微信号：1234243243";
        
        UIView *v_fen1 = (UIView *)[cell viewWithTag:63];
        v_fen1.backgroundColor = [UIColor colorWithHexString:@"d9d9d9"];
        
        UIView *v_fen2 = (UIView *)[cell viewWithTag:64];
        v_fen2.backgroundColor = [UIColor colorWithHexString:@"d9d9d9"];
        
        
        
    }else{
        UIImageView *iv = (UIImageView *)[cell viewWithTag:50];
        iv.image = [UIImage imageNamed:(imgArr[indexPath.section])[indexPath.row]];
        iv.contentMode = UIViewContentModeScaleAspectFit;
        
        UILabel *lab = (UILabel *)[cell viewWithTag:51];
        lab.text = (titleArr[indexPath.section])[indexPath.row];
        
        if (indexPath.section == 1 && indexPath.row != 3) {
            UIView *v_fen = (UIView *)[cell viewWithTag:52];
            v_fen.backgroundColor = [UIColor colorWithHexString:@"d9d9d9"];
            
        }
        
        if (indexPath.section == 1) {
            if (indexPath.row == 0) {
                UIView *v_fen1 = (UIView *)[cell viewWithTag:53];
                v_fen1.backgroundColor = [UIColor colorWithHexString:@"d9d9d9"];
            }else
                if (indexPath.row == 3) {
                    UIView *v_fen2 = (UIView *)[cell viewWithTag:54];
                    v_fen2.backgroundColor = [UIColor colorWithHexString:@"d9d9d9"];
                }
            
        }else{
            
            UIView *v_fen1 = (UIView *)[cell viewWithTag:53];
            v_fen1.backgroundColor = [UIColor colorWithHexString:@"d9d9d9"];
            
            UIView *v_fen2 = (UIView *)[cell viewWithTag:54];
            v_fen2.backgroundColor = [UIColor colorWithHexString:@"d9d9d9"];
            
        }
        
    }
    
    
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return titleArr.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [(NSArray *)titleArr[section] count];
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        return 85;
    }else {
        return 45;
    }
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    UIView *header_v = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, 20)];
    header_v.backgroundColor = [UIColor colorWithHexString:@"efeff4"];
    return header_v;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 15.0;
    }else {
        return 2.0;
    }
    
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell * cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.backgroundColor = [UIColor whiteColor];
    
    
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
