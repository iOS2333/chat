//
//  SecViewController.m
//  
//
//  Created by 123 on 15/10/27.
//
//

#import "SecViewController.h"
#import "FriendCell.h"
#import "Tools.h"
#import "CircleFriendsVC.h"
#import "Bean.h"
#import "ChatInfoVC.h"
#import "DBUtil.h"
#import "AppDelegate.h"

#define scrW [[UIScreen mainScreen] bounds].size.width
#define scrH [[UIScreen  mainScreen] bounds].size.height


@interface SecViewController () {
    UITableView *_tb;
    NSMutableArray *dataArr;
    NSMutableArray *nameArr;
    NSMutableArray *nameArr1;
    NSMutableArray *n_Arr;
    NSArray *newArr;
    NSArray *newArr1;
   
}

@end

@implementation SecViewController

-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    //设置白色字体的状态栏
      [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:YES];
      self.navigationController.navigationBarHidden = NO;
    
    if (!dataArr.count) {
        NSMutableArray *totalArr = [NSMutableArray arrayWithCapacity:0];
        totalArr = [DBUtil fetchClass:[FriendVO class] byDialogID:nil];
      
        for (NSInteger i = 0; i < totalArr.count; i++) {
            
            FriendVO *fvo = [totalArr objectAtIndex:i];
            NSLog(@"%ld=====",(long)[fvo.scroes integerValue]);
            if ([fvo.scroes integerValue] > 0) {
                [dataArr addObject:fvo];
                [nameArr addObject:fvo.name];
//                newArr = [nameArr sortedArrayUsingSelector:@selector(compare:)];

                
            }
        }
        [_tb reloadData];
    }
    
    [self initViews];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    dataArr = [NSMutableArray arrayWithCapacity:0];
    nameArr = [NSMutableArray arrayWithCapacity:0];
    nameArr1 = [NSMutableArray arrayWithCapacity:0];
    n_Arr = [NSMutableArray arrayWithCapacity:0];
    NSMutableArray *totalArr = [NSMutableArray arrayWithCapacity:0];
    totalArr = [DBUtil fetchClass:[FriendVO class] byDialogID:nil];
    
    
//    newArr = [[NSArray alloc] init];
//    newArr1 = [[NSArray alloc] init];
//    for (NSInteger i = 0; i < totalArr.count; i++) {
//        
//        FriendVO *fvo = [totalArr objectAtIndex:i];
//        NSLog(@"%ld=====",(long)[fvo.scroes integerValue]);
//        
//        if ([fvo.scroes integerValue] > 0) {
//            [dataArr addObject:fvo];
//            NSString *str = [fvo.name  substringWithRange:NSMakeRange(0, 1)];
//            [nameArr addObject:str];
//            newArr = [nameArr sortedArrayUsingSelector:@selector(compare:)];
////            newArr = []
//            [nameArr1 addObject:fvo.name];
//            newArr1 = [nameArr1 sortedArrayUsingSelector:@selector(compare:)];
//
//        }
//    }
//    
//    NSLog(@"%@ ====== ",newArr);
//    
//    NSLog(@"%@ =========",nameArr);
    
    
    NSMutableArray *names = [NSMutableArray arrayWithCapacity:0];
    NSMutableArray *lasts = [NSMutableArray arrayWithCapacity:0];
    for (NSInteger i = 0; i<totalArr.count; i++) {
        FriendVO *fvo = [totalArr objectAtIndex:i];
        NSString *subName = [[fvo.name  substringWithRange:NSMakeRange(0, 1)] uppercaseString];
        if ([names containsObject:subName]) {
            NSInteger index = [names indexOfObject:subName];
            ChatGroupVO *gvo = [lasts objectAtIndex:index];
            NSMutableArray *tmp = [NSMutableArray arrayWithCapacity:0];
            [tmp addObjectsFromArray:gvo.numbers];
            [tmp addObject:fvo];
            gvo.numbers = tmp;
        }else{
            [names addObject:subName];
            ChatGroupVO *gvo = [[ChatGroupVO alloc] init];
            gvo.key = subName;
            gvo.numbers = [NSMutableArray arrayWithCapacity:0];
            [gvo.numbers addObject:fvo];
            [lasts addObject:gvo];
            
        }
        


    }
    
    
    [dataArr addObjectsFromArray:lasts];
    
    NSArray *aray = [dataArr sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        ChatGroupVO *g1 = (ChatGroupVO *)obj1;
                ChatGroupVO *g2 = (ChatGroupVO *)obj2;
        return [g1.key compare:g2.key] !=  NSOrderedAscending;
    }];
    
    [dataArr removeAllObjects];
    [dataArr addObjectsFromArray:aray];
    
    [self initViews];
    
}


- (void)initViews {

    
    _tb = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, self.view.bounds.size.width, self.view.bounds.size.height-50) style:UITableViewStylePlain];
    _tb.delegate = self;
    _tb.dataSource = self;
//    _tb.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tb.backgroundColor = [UIColor colorWithHexString:@"efeff4"];
    UIImage *img = [UIImage imageNamed:@"ss_new.png"];
    img = [img stretchableImageWithLeftCapWidth:floorf(img.size.width/2) topCapHeight:floorf(img.size.height/2)];
    UIImageView *sousuo =[[UIImageView alloc] initWithFrame:CGRectMake(0, 0,  scrW, img.size.height)];
    sousuo.image = img;
    UILabel *sslb = [[UILabel alloc] initWithFrame:CGRectMake(scrW/2-30, img.size.height/2 - 15, 60, 30)];
    sslb.text = @"搜索";
    sslb.textAlignment = NSTextAlignmentCenter;
    sslb.font = [UIFont systemFontOfSize:13];
    sslb.textColor = [UIColor colorWithHexString:@"8e8e93"];
    [sousuo addSubview:sslb];
    _tb.tableHeaderView = sousuo;
    _tb.sectionHeaderHeight = img.size.height;
    [_tb setTableFooterView:[[UIView alloc] init]];
    [self.view addSubview:_tb];

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    
    FriendVO *fvo = [[(ChatGroupVO *)[dataArr objectAtIndex:indexPath.section] numbers] objectAtIndex:indexPath.row];
    //[dataArr objectAtIndex:indexPath.row];
    static NSString *friend_cell = @"cell";
    FriendCell *cell = [tableView dequeueReusableCellWithIdentifier:friend_cell];
    cell.backgroundColor = [UIColor whiteColor];
    if (cell == nil) {
        cell = [[FriendCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:friend_cell];
        
        [cell awakeFromNib];
        
    }


    [cell addData:fvo];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[(ChatGroupVO *)[dataArr objectAtIndex:section] numbers] count];
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}



//- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
//    
//    NSLog(@"shezhi l av djnnsdvnsdfknsdnfndsf");
//    return newArr[section];
//}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{

    ChatGroupVO *gvo = [dataArr objectAtIndex:section];
    UILabel *l = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, 16)];
    l.backgroundColor = [UIColor colorWithHexString:@"efeff4"];
    l.textAlignment = NSTextAlignmentLeft;
    l.textColor = [UIColor colorWithHexString:@"999999"];
    l.text = [NSString stringWithFormat:@"  %@",gvo.key];

    return l;
}


-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 16.0;
}

//-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
//    
//    UIView *header_v = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, 10)];
//    header_v.backgroundColor = [UIColor colorWithHexString:@"efeff4"];
//    
////    UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 40, 10)];
////    lab.backgroundColor = [UIColor clearColor];
////    lab.textAlignment = NSTextAlignmentLeft;
////    lab.textColor = [UIColor colorWithGray];
////    lab.font = [UIFont boldSystemFontOfSize:16];
////    lab.text = nameArr[section];
////    [header_v addSubview:lab];
//    
//    return header_v;
//}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    FriendVO *fvo = [[(ChatGroupVO *)[dataArr objectAtIndex:indexPath.section] numbers] objectAtIndex:indexPath.row];
        ChatInfoVC *vc = [[ChatInfoVC alloc] init];
        vc.isFrist = [NSNumber numberWithInteger:2];
        vc.chat_people = fvo;
         [[(AppDelegate *)[[UIApplication sharedApplication] delegate] tb].navigationController pushViewController:vc animated:YES];
        
//    if (indexPath.row == 0) {
//        ChatInfoVC *vc = [[ChatInfoVC alloc] init];
//        vc.isFrist = [NSNumber numberWithInteger:1];
//        vc.chat_id = fvo;
//        [self.navigationController pushViewController:vc animated:YES];
//    }else if (indexPath.row == 1) {
//    }else {
//    }

}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [dataArr count];
}



//- (void)btn_click:(UIButton *)sender {
//    CircleFriendsVC *vc = [[CircleFriendsVC alloc] init];
//    [self.navigationController pushViewController:vc animated:YES];
//}

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
