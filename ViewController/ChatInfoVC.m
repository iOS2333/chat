//
//  ChatInfoVC.m
//  Chat
//
//  Created by jason on 15/11/13.
//  Copyright © 2015年 123. All rights reserved.
//

#import "ChatInfoVC.h"
#import "CharVC.h"
#import "Tools.h"
#import "Util.h"
#import "PeopleDetailView.h"
#define scrW [[UIScreen mainScreen] bounds].size.width
#define scrH [[UIScreen  mainScreen] bounds].size.height

@interface ChatInfoVC () {
   UIView *navigationview;
    UIView *bkView;
    UIView *lbbkView;
    UIView *detailbkView;
}
@end

@implementation ChatInfoVC
-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    //设置白色字体的状态栏
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:YES];
    self.navigationController.navigationBarHidden = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithHexString:@"efeff4"];
    [self customNA];
    [self initView];
    
}
-(void)initView{
    CGFloat may = navigationview.frame.size.height;
    may += 30;
    
    
    bkView = [[UIView alloc] initWithFrame:CGRectMake(0, may, scrW, 100)];
    bkView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:bkView];
    may += bkView.frame.size.height;
    may += 30;
    [self initbkView];
    
    lbbkView = [[UIView alloc] initWithFrame:CGRectMake(0, may, scrW, 50)];
    lbbkView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:lbbkView];
    may += lbbkView.frame.size.height;
    may += 30;
    [self initlbbkView];
    
    detailbkView = [[UIView alloc] initWithFrame:CGRectMake(0, may, scrW, scrH *0.3)];
    detailbkView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:detailbkView];
    may += detailbkView.frame.size.height;
    may += 36;
    [self initdetailbkView];
    
    NSArray *imgarr = @[@"chat_liao.png",@"shipin.png"];
    for (NSInteger i = 0; i<2; i++) {
        UIImage *send = [UIImage imageNamed:imgarr[i]];
        UIImageView *sendimg = [[UIImageView alloc] initWithFrame:CGRectMake(scrW/2 - send.size.width/2, may, send.size.width, send.size.height)];
        sendimg.image = send;
        sendimg.tag = 10+i;
        [sendimg addClickBlock:^(NSInteger tag) {
            if (tag == 10) {
                [self click];
            }
        }];
        [self.view addSubview:sendimg];
        may += send.size.height;
        may+= 20;
    }
    
}
- (void)initbkView{
    CGFloat mx = 10;
    CGFloat my = 10;
    UIImage *iconimg = [UIImage imageNamed:self.chat_people.myicon];
    UIImageView *img = [[UIImageView alloc] initWithFrame:CGRectMake(mx, my, 80, 80)];
    img.image = iconimg;
    [bkView addSubview:img];
    mx += 80;
    mx += 10;
    
    
    UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(mx, my, 150, 30)];
    nameLabel.text = self.chat_people.name;
    nameLabel.textAlignment = NSTextAlignmentLeft;
    [bkView addSubview:nameLabel];
    my += nameLabel.frame.size.height;
    my += 5;
    
    UIImage *sex;
    if ([self.chat_people.sex integerValue] == 0) {
        sex = [UIImage imageNamed:@"sex_lan.png"];
    }else{
        sex = [UIImage imageNamed:@"sex_fen.png"];
    }
    UIImageView *sex_img = [[UIImageView alloc] initWithFrame:CGRectMake(mx, my, sex.size.width*1.2, sex.size.height*1.2)];
    sex_img.image = sex;
    [bkView addSubview:sex_img];
    UILabel *age_lb = [[UILabel alloc] initWithFrame:CGRectMake(18, 1, sex.size.width, sex.size.height)];
    age_lb.text = [NSString stringWithFormat:@"%@",self.chat_people.age];
    age_lb.backgroundColor = [UIColor clearColor];
    age_lb.textAlignment = NSTextAlignmentLeft;
    age_lb.textColor = [UIColor whiteColor];
    age_lb.font = [UIFont systemFontOfSize:13];
    [sex_img addSubview:age_lb];
    
    my += sex.size.height;
     my += 5;
    
    UILabel *occ_lb = [[UILabel alloc] initWithFrame:CGRectMake(mx, my, 100, 30)];
    occ_lb.text = self.chat_people.occ;
    occ_lb.textColor = [UIColor colorWithHexString:@"7a7e83"];
    occ_lb.textAlignment = NSTextAlignmentLeft;
    occ_lb.font = [UIFont systemFontOfSize:13];
    [bkView addSubview:occ_lb];
    
    
    
}
- (void)initlbbkView{
    
    UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(10, 0 , 50, lbbkView.frame.size.height)];
    lab.text = @"标签";
    lab.textColor = [UIColor colorWithHexString:@"353535"];
    lab.textAlignment = NSTextAlignmentLeft;
    [lbbkView addSubview:lab];
    
    UILabel *lb = [[UILabel alloc] initWithFrame:CGRectMake(10 + lab.frame.size.height+30 , 0 , 50, lbbkView.frame.size.height)];
    lb.text = @"meten";
    lb.textAlignment = NSTextAlignmentLeft;
    lb.font = [UIFont systemFontOfSize:16];
    lb.textColor = [UIColor colorWithHexString:@"02bb00"];
    [lbbkView addSubview:lb];
    UIImage *backimg = [UIImage imageNamed:@"jiantou.png"];
    UIImageView *back = [[UIImageView alloc] initWithFrame:CGRectMake(scrW - backimg.size.width - 15, lbbkView.frame.size.height/2-backimg.size.height/2, backimg.size.width, backimg.size.height)];
    back.image = backimg;
    [lbbkView addSubview:back];
    
}
- (void)initdetailbkView{
    CGFloat may = 0;
    CGFloat max = 10;
    UILabel *dlb = [[UILabel alloc] initWithFrame:CGRectMake(max, 0, scrW - 20, 50)];
    dlb.text = @"地区               吉林 吉林";
    dlb.textColor = [UIColor colorWithHexString:@"353535"];
    dlb.textAlignment = NSTextAlignmentLeft;
    [detailbkView addSubview:dlb];
    may += dlb.frame.size.height;
    UIImage *line = [UIImage imageNamed:@"line_new.png"];
    line = [line stretchableImageWithLeftCapWidth:floorf(line.size.width/2) topCapHeight:floorf(line.size.height/2)];
    UIImageView *lineView = [[UIImageView alloc] initWithFrame:CGRectMake(max,may, scrW - max, line.size.height)];
    lineView.image = line;
    [detailbkView addSubview:lineView];
    may += line.size.height;
    may += 35;
    
    
    UILabel *geren = [[UILabel alloc] initWithFrame:CGRectMake(max, may, 100, 30)];
    geren.text = @"个人相册";
     geren.textColor = [UIColor colorWithHexString:@"353535"];
    geren.textAlignment = NSTextAlignmentLeft;
    [detailbkView addSubview:geren];
    

    NSArray *imgArr = @[@"tu_1.png",@"tu_2.png"];
    UIImage *imgs = [UIImage imageNamed:imgArr[0]];
    UIImage *backimg = [UIImage imageNamed:@"jiantou.png"];
    UIImageView *back = [[UIImageView alloc] initWithFrame:CGRectMake(scrW - backimg.size.width - 15,may-20 + imgs.size.height/2-backimg.size.height/2, backimg.size.width, backimg.size.height)];
    back.image = backimg;
    [detailbkView addSubview:back];
    
    for (NSInteger i = 0; i<2; i++) {
        UIImage *img = [UIImage imageNamed:imgArr[i]];
        UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(geren.frame.size.width +i*(imgs.size.width+10), may-20, imgs.size.width, imgs.size.height)];
        imgView.image = img;
        [detailbkView addSubview:imgView];
        if (i == 1) {
            may += img.size.height;
            may += 5;
        }
        
    }
    UIImage *line1 = [UIImage imageNamed:@"line_new.png"];
    line1 = [line1 stretchableImageWithLeftCapWidth:floorf(line1.size.width/2) topCapHeight:floorf(line1.size.height/2)];
    UIImageView *lineView1 = [[UIImageView alloc] initWithFrame:CGRectMake(max,may, scrW - max, line1.size.height)];
    lineView1.image = line1;
    [detailbkView addSubview:lineView1];
    
    
    
    may += line1.size.height;
    
    UILabel *more = [[UILabel alloc] initWithFrame:CGRectMake(max, may, scrW - 20, detailbkView.frame.size.height - may)];
    more.text = @"更多";
    more.textColor = [UIColor colorWithHexString:@"353535"];
    more.textAlignment = NSTextAlignmentLeft;
    [detailbkView addSubview:more];

    UIImage *backimg1 = [UIImage imageNamed:@"jiantou.png"];
    UIImageView *back1 = [[UIImageView alloc] initWithFrame:CGRectMake(scrW - backimg1.size.width - 15,may + more.frame.size.height/2-backimg.size.height/2, backimg1.size.width, backimg1.size.height)];
    back1.image = backimg1;
    [detailbkView addSubview:back1];
  
    UIImageView *imgClick = [[UIImageView alloc] initWithFrame:CGRectMake(max, more.frame.origin.y, scrW - max, 30)];
    imgClick.userInteractionEnabled = YES;
    [imgClick addClickBlock:^(NSInteger tag) {
        [self customPeopleDetail:self.chat_people];
    }];
    [detailbkView addSubview:imgClick];
  
}
- (void)customPeopleDetail:(FriendVO *)peoplevo{
    
    PeopleDetailView *pview = [[PeopleDetailView alloc] initWithFrame:self.view.frame];
    [pview customContentWithname:peoplevo.name PeopleDetail:peoplevo.peopleDetailContent Img:peoplevo.peopleDetailimg];
    [self.view addSubview:pview];
    
    
}

-(void)click {
    
    NSLog(@"点击了");
    CharVC *vc = [[CharVC alloc] init];
    vc.people = self.chat_people;
    vc.isChatInfo = TRUE;
    [self.navigationController pushViewController:vc animated:YES];
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
    [btn setTitle:@"返回" forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:14];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [navigationview addSubview:btn];
    [btn addTarget:self action:@selector(ItemCLick) forControlEvents:UIControlEventTouchUpInside];
    UILabel *lb = [[UILabel alloc] initWithFrame:CGRectMake(navigationview.frame.size.width/2 - 50, 20+(navigationview.frame.size.height -20)/2-20, 200, 40)];
    lb.text = @"详细资料";
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
