//
//  FriendCell.m
//  Chat
//
//  Created by jason on 15/11/10.
//  Copyright © 2015年 123. All rights reserved.
//

#import "FriendCell.h"
#import "Tools.h"

#define scrW [[UIScreen mainScreen] bounds].size.width
#define scrH [[UIScreen mainScreen] bounds].size.height

@interface FriendCell () {
    UIImageView *iv_icon;
    UILabel *lab_name;
    UILabel *lab_age;
    UILabel *lab_occ;
    UILabel *lab_value;
//    UIView *v_pink;
//    UIImageView *iv_xin;
    UIImageView *iv_age;
    UIImage *img_age;
}

@end

@implementation FriendCell

- (void)awakeFromNib {
    // Initialization code
    
    UIImage *img_icon = [UIImage imageNamed:@"kissme.png"];
     iv_icon = [[UIImageView alloc] initWithFrame:CGRectMake(10, (60-img_icon.size.height)/2, img_icon.size.width,img_icon.size.height)];
    [self addSubview:iv_icon];
    
    lab_name = [[UILabel alloc] initWithFrame:CGRectMake(iv_icon.frame.size.width+iv_icon.frame.origin.x+15, 5, 120, 20)];
    lab_name.backgroundColor = [UIColor clearColor];
    lab_name.textAlignment = NSTextAlignmentLeft;
    lab_name.textColor = [UIColor blackColor];
    lab_name.font = [UIFont boldSystemFontOfSize:12];
    lab_name.text = @"如花姐姐";
    [self addSubview:lab_name];
    
    img_age = [UIImage imageNamed:@"sex_lan.png"];
     iv_age = [[UIImageView alloc] initWithFrame:CGRectMake(lab_name.frame.origin.x, 25, img_age.size.width, img_age.size.height)];
    [self addSubview:iv_age];
    
    lab_age = [[UILabel alloc] initWithFrame:CGRectMake(15, 0, img_age.size.width-10, img_age.size.height)];
    lab_age.backgroundColor = [UIColor clearColor];
    lab_age.textAlignment = NSTextAlignmentLeft;
    lab_age.textColor = [UIColor whiteColor];
    lab_age.font = [UIFont systemFontOfSize:10];
    lab_age.text = @"22";
    [iv_age addSubview:lab_age];
    
    lab_occ = [[UILabel alloc] initWithFrame:CGRectMake(lab_name.frame.origin.x, iv_age.frame.size.height+iv_age.frame.origin.y, 160, 20)];
    lab_occ.backgroundColor = [UIColor clearColor];
    lab_occ.textAlignment = NSTextAlignmentLeft;
    lab_occ.textColor = [UIColor colorWithGray];
    lab_occ.font = [UIFont systemFontOfSize:12];
    lab_occ.text = @"音乐老师";
    [self addSubview:lab_occ];
    
//    UIImage *img_xin = [UIImage imageNamed:@"heart_off.png"];
//    iv_xin = [[UIImageView alloc] initWithFrame:CGRectMake(scrW-img_xin.size.width-15, (60-img_xin.size.height)/2, img_xin.size.width, img_xin.size.height)];
//    iv_xin.image = img_xin;
//    [self addSubview:iv_xin];
    
//    v_pink = [[UIView alloc] initWithFrame:iv_xin.frame];
//    v_pink.backgroundColor = [UIColor colorWithRed:247/255.0 green:198/255.0 blue:255/255.0 alpha:1];
//    [self addSubview:v_pink];
    
    UIImage *img_chat = [UIImage imageNamed:@"xinxin_new.png"];
    UIImageView *iv_chat = [[UIImageView alloc] initWithFrame:CGRectMake(scrW-img_chat.size.width-15, (60-img_chat.size.height)/2, img_chat.size.width, img_chat.size.height)];
    iv_chat.image = img_chat;
//    iv_chat.backgroundColor = [UIColor redColor];
    [self addSubview:iv_chat];
    
    lab_value = [[UILabel alloc] initWithFrame:CGRectMake(15, iv_chat.frame.size.height/2-10, img_chat.size.width, 20)];
    lab_value.backgroundColor = [UIColor clearColor];
    lab_value.textAlignment = NSTextAlignmentLeft;
    lab_value.textColor = [UIColor whiteColor];
    lab_value.font = [UIFont systemFontOfSize:13];
    lab_value.text = @"97%";
    [iv_chat addSubview:lab_value];
    
//    UIView *v_fen = [[UIView alloc] initWithFrame:CGRectMake(10, 60, scrW, 0.5)];
//    v_fen.backgroundColor = [UIColor colorWithHexString:@"d9d9d9"];
//    [self addSubview:v_fen];
}

- (void)addData:(FriendVO *)vo {
    lab_name.text = vo.name;
    iv_icon.image = [UIImage imageNamed:vo.myicon];
    if ([vo.sex integerValue] == 0) {
        img_age = [UIImage imageNamed:@"sex_lan.png"];
    }else{
        img_age = [UIImage imageNamed:@"sex_fen.png"];
    }
    iv_age.image = img_age;
    lab_age.text = [NSString stringWithFormat:@"%@",vo.age];
    lab_occ.text = vo.occ;
    if (vo.scroes == nil) {
        lab_value.text = @"0%";
    }else{
        lab_value.text = [NSString stringWithFormat:@"%@%@",vo.scroes,@"%"];
    }
//    NSInteger sc = [vo.scroes integerValue];
//    NSLog(@"%f=====",iv_xin.frame.size.height);
//    NSInteger hh = iv_xin.frame.size.height;
//    CGFloat mary = (sc/100.00)*hh;
//    v_pink.frame = CGRectMake(iv_xin.frame.origin.x, iv_xin.frame.origin.y+iv_xin.frame.size.height-mary, iv_xin.frame.size.width, mary);
    

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
