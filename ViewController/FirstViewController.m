//
//  FirstViewController.m
//  
//
//  Created by 123 on 15/10/27.
//
//

#import "FirstViewController.h"
#import "PeopleCell.h"
#import "CharVC.h"
#import "AppDelegate.h"
#import "ShakeVC.h"
#define scrW [[UIScreen mainScreen] bounds].size.width
#define scrH [[UIScreen  mainScreen] bounds].size.height
@interface FirstViewController ()
{
    NSMutableArray *_dataArray;
    UITableView *_table;
}
@end

@implementation FirstViewController
-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    //设置白色字体的状态栏
     [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:YES];
     self.navigationController.navigationBarHidden = NO;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"%d",arc4random()%100+100);
    self.view.backgroundColor = [UIColor clearColor];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(add_newpeople:) name:@"newpeople" object:nil];
    _dataArray = [NSMutableArray arrayWithCapacity:0];
    FriendVO *shakevo = [[FriendVO alloc] init];
    shakevo.name = @"摇一摇看看谁对你感兴趣";
    shakevo.myicon =@"摇一摇.png";
    [_dataArray addObject:shakevo];
    NSLog(@"fetchFriend == %@",[DBUtil fetchFriend]);
    [_dataArray addObjectsFromArray: [DBUtil fetchFriend]];
    peopleCount = [NSNumber numberWithInteger:_dataArray.count - 1];
    
     
    
    _table = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height-50) style:UITableViewStylePlain];
    _table.delegate = self;
    _table.dataSource = self;
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
      _table.tableHeaderView = sousuo;
    _table.sectionHeaderHeight = img.size.height;
    [_table setTableFooterView:[[UIView alloc] init]];
    [self.view addSubview:_table];
}

-(void)add_newpeople:(NSNotification *) notify{
    FriendVO *fvo = [notify object];
    if (fvo) {
        [_dataArray addObject:fvo];
        peopleCount = [NSNumber numberWithInteger:_dataArray.count - 1];
        [_table reloadData];
    }
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    PeopleCell *cell = [tableView dequeueReusableCellWithIdentifier:@"people"];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"PeopleCell" owner:self options:nil] lastObject];
    }
    FriendVO *people = _dataArray[indexPath.row];
    if (indexPath.row == 0) {
        cell.ptime.text = @"";
        cell.peoplename.font = [UIFont systemFontOfSize:9];
    }else{
        
    }
    cell.peoplename.font = [UIFont systemFontOfSize:15];
        
    [cell customCellwithVO:people];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    PeopleCell *cell = (PeopleCell *)[tableView cellForRowAtIndexPath:indexPath];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
     FriendVO *people = _dataArray[indexPath.row];
    BOOL iscvc = NO;

    if (indexPath.row == 0) {
        ShakeVC *vc = [[ShakeVC alloc] init];
        
        [[(AppDelegate *)[[UIApplication sharedApplication] delegate] tb].navigationController pushViewController:vc animated:YES];
//        [self.navigationController pushViewController:vc animated:YES];
        return;
    }
    if (mvcDic.count) {
        UIViewController *vc = [mvcDic objectForKey:[NSString stringWithFormat:@"%zd",indexPath.row]];
        if ([vc isKindOfClass:[CharVC class]]&&vc != nil) {
            iscvc = YES;
            CharVC *svc = (CharVC *)vc;
            svc.people = people;
            svc.message = ^(NSArray *arr){
                cell.pmessage.text = [arr firstObject];
                NSNumber *dvo = [arr lastObject];
                
                    if ([dvo boolValue]) {
                        cell.messageimg.hidden = NO;
                        cell.messagelb.hidden = NO;
                    }else{
                        cell.messageimg.hidden = YES;
                        cell.messagelb.hidden = YES;
                    }
                    
        
            };
            [[(AppDelegate *)[[UIApplication sharedApplication] delegate] tb].navigationController pushViewController:svc animated:YES];
//            [self.navigationController pushViewController:vc animated:YES];

        }
    }
    
    
    if (iscvc == NO) {
        CharVC *vc = [[CharVC alloc]init];
        vc.people = people;
        vc.message = ^(NSArray *arr){
            cell.pmessage.text = [arr firstObject];
            NSNumber *dvo = [arr lastObject];
          
                if ([dvo boolValue]) {
                    cell.messageimg.hidden = NO;
                    cell.messagelb.hidden = NO;
                }else{
                    cell.messageimg.hidden = YES;
                    cell.messagelb.hidden = YES;
                }
 
          
            
        };
        [[(AppDelegate *)[[UIApplication sharedApplication] delegate] tb].navigationController pushViewController:vc animated:YES];
//        [self.navigationController pushViewController:vc animated:YES];

    }
   }
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArray.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 70;
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
