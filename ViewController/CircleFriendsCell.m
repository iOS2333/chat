//
//  CircleFriendsCell.m
//  Chat
//
//  Created by jason on 15/11/10.
//  Copyright © 2015年 123. All rights reserved.
//

#import "CircleFriendsCell.h"
#import "Tools.h"

#define scrW [[UIScreen mainScreen] bounds].size.width
#define scrH [[UIScreen  mainScreen] bounds].size.height

@interface CircleFriendsCell () {
    UIImageView *iv_icon;
    UILabel *lab_name;
    UILabel *lab_time;
    UILabel *lab_zan;
    UILabel *lab_con;
    FriendVO *ffvo;
    UIView *v_fen;
    UIImageView *iv_kun;
    NSNumber *zanSelectNum;
    
}

@end


@implementation CircleFriendsCell

- (void)awakeFromNib {
    // Initialization code
            
//    UIImage *img_icon = [UIImage imageNamed:@"kissme.png"];
    
    iv_icon = [[UIImageView alloc] initWithFrame:CGRectMake(10, 0, 42, 42)];
    [self addSubview:iv_icon];
    
    lab_name = [[UILabel alloc] initWithFrame:CGRectMake(iv_icon.frame.size.width+iv_icon.frame.origin.x+10, 0, 180, 20)];
    lab_name.backgroundColor = [UIColor clearColor];
    lab_name.textAlignment = NSTextAlignmentLeft;
    lab_name.textColor = [UIColor colorWithHexString:@"576b95"];
    lab_name.font = [UIFont systemFontOfSize:16];
    lab_name.text = @"米雅";
    [self addSubview:lab_name];
    
    lab_con = [[UILabel alloc] initWithFrame:CGRectMake(lab_name.frame.origin.x, lab_name.frame.origin.y+lab_name.frame.size.height+5, scrW-(lab_name.frame.origin.x+10), 140)];
    lab_con.backgroundColor = [UIColor clearColor];
    lab_con.textAlignment = NSTextAlignmentLeft;
    lab_con.textColor = [UIColor blackColor];
    lab_con.font = [UIFont systemFontOfSize:16];
    lab_con.numberOfLines = 0;
    [self addSubview:lab_con];
    
    
    lab_time = [[UILabel alloc] initWithFrame:CGRectMake(lab_name.frame.origin.x, lab_con.frame.origin.y+lab_con.frame.size.height+30, 100, 20)];
    lab_time.backgroundColor = [UIColor clearColor];
    lab_time.textAlignment = NSTextAlignmentLeft;
    lab_time.textColor = [UIColor colorWithGray];
    lab_time.font = [UIFont systemFontOfSize:12];
    lab_time.text = @"10天前";
    [self addSubview:lab_time];
    
    UIImage *img_zan = [UIImage imageNamed:@"cir_pinlun.png"];
    _btn = [UIButton buttonWithType:UIButtonTypeCustom];
    _btn.frame = CGRectMake(scrW-(img_zan.size.width+30), lab_time.frame.origin.y, img_zan.size.width, img_zan.size.height);
    [_btn setBackgroundImage:img_zan forState:UIControlStateNormal];
    [_btn addTarget:self action:@selector(btn_click:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_btn];
    
    UIImage *img_xs = [UIImage imageNamed:@"cir_beijin.png"];
    _iv_xs = [[UIImageView alloc] initWithFrame:CGRectMake(lab_time.frame.origin.x-5, lab_time.frame.origin.y+lab_time.frame.size.height, img_xs.size.width+5, img_xs.size.height+5)];
    _iv_xs.image = img_xs;
    [self addSubview:_iv_xs];
    
    UIImage *img_xin = [UIImage imageNamed:@"i_heart.png"];
    UIImageView *iv_xin = [[UIImageView alloc] initWithFrame:CGRectMake(5, 7, img_xin.size.height+5, img_xin.size.height+5)];
    iv_xin.image = img_xin;
    [_iv_xs addSubview:iv_xin];
    
    lab_zan = [[UILabel alloc] initWithFrame:CGRectMake(iv_xin.frame.origin.x+iv_xin.frame.size.width+2, 0, 100, img_xs.size.height-5)];
    lab_zan.backgroundColor = [UIColor clearColor];
    lab_zan.textAlignment = NSTextAlignmentLeft;
    lab_zan.textColor = [UIColor colorWithRed:105/255.0 green:118/255.0 blue:143/255.0 alpha:1];
    lab_zan.font = [UIFont systemFontOfSize:12];
    lab_zan.text = @"如花姐姐";
    [_iv_xs addSubview:lab_zan];
    _iv_xs.hidden = YES;
    
    v_fen = [[UIView alloc] initWithFrame:CGRectZero];
    v_fen.backgroundColor = [UIColor colorWithHexString:@"dfdfdd"];
    [self addSubview:v_fen];
    
}


- (void)addData:(DynamicVO *)fvo withblock:(btnCkick)btnBlock {
    if (btnBlock) {
        _block = btnBlock;
    }
    
    UIImage *img_xs = [UIImage imageNamed:@"Cir_huiseKun.png"];
    UIImage *img_zan = [UIImage imageNamed:@"cir_pinlun.png"];
    
    lab_name.text = fvo.friendname;
    lab_zan.text = fvo.name;
    lab_con.text = fvo.content;
    iv_icon.image = [UIImage imageNamed:fvo.friendicon];
    CGSize size = [lab_con sizeThatFits:CGSizeMake(lab_con.frame.size.width, MAXFLOAT)];
//    CGSize size = [fvo.content sizeWithFont:[UIFont systemFontOfSize:16] constrainedToSize:CGSizeMake(scrW, MAXFLOAT) lineBreakMode:NSLineBreakByWordWrapping];
    lab_con.frame = CGRectMake(lab_name.frame.origin.x, lab_name.frame.origin.y+lab_name.frame.size.height+5, scrW-(lab_name.frame.origin.x+10), size.height);
    lab_time.frame = CGRectMake(lab_name.frame.origin.x, lab_con.frame.origin.y+size.height+20, 100, 20);
    _btn.frame = CGRectMake(scrW-(img_zan.size.width+20), lab_time.frame.origin.y+2, img_zan.size.width, img_zan.size.height);
    _iv_xs.frame = CGRectMake(lab_time.frame.origin.x-5, lab_time.frame.origin.y+lab_time.frame.size.height, (_btn.frame.origin.x+_btn.frame.size.width)-lab_time.frame.origin.x+3, img_xs.size.height+5);
    v_fen.frame = CGRectMake(0, _iv_xs.frame.origin.y+_iv_xs.frame.size.height+10, scrW, 0.5);
    
    
}


- (void)btn_click:(UIButton *)sender {

    UIImage *img_kun = [UIImage imageNamed:@"zanAndPinglun.png"];
    iv_kun = [[UIImageView alloc] initWithFrame:CGRectMake(_btn.frame.origin.x-img_kun.size.width-2, _btn.frame.origin.y-img_kun.size.height/4+5, img_kun.size.width, img_kun.size.height)];
    iv_kun.image = img_kun;
    iv_kun.userInteractionEnabled = YES;
    [self addSubview:iv_kun];

    for (NSInteger i = 0; i < 2; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.backgroundColor = [UIColor clearColor];
        button.frame = CGRectMake((iv_kun.frame.size.width/2)*i, 0, iv_kun.frame.size.width/2, iv_kun.frame.size.height);
        button.tag = i+67;
        [button addTarget:self action:@selector(button_click:) forControlEvents:UIControlEventTouchUpInside];
        [iv_kun addSubview:button];
    }
}

- (void)button_click:(UIButton *)sender {
    if (sender.tag == 67) {
//        _btn.hidden = YES;
        _iv_xs.hidden = NO;
        [iv_kun removeFromSuperview];
        if (_block) {
            _block ();
        }
        
    }else {
        [iv_kun removeFromSuperview];
    }
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
