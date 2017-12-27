//
//  PeopleDetailView.m
//  
//
//  Created by 123 on 15/11/27.
//
//

#import "PeopleDetailView.h"
#import "Tools.h"
#define scrW [[UIScreen mainScreen] bounds].size.width
#define scrH [[UIScreen  mainScreen] bounds].size.height
@interface PeopleDetailView ()
{
    UIImageView *iconimg;
    UILabel *namelabel;
    UILabel *detailLabel;
    UIImageView *bkimg;
}
@end


@implementation PeopleDetailView
- (void)customContentWithname:(NSString *)name
                 PeopleDetail:(NSString *)people
                          Img:(NSString *)imgname{
    
    
    self.backgroundColor = [UIColor clearColor];
    UIView *bkview = [[UIView alloc] initWithFrame:self.frame];
    bkview.backgroundColor = [UIColor blackColor];
    bkview.alpha = 0.5;
    [self addSubview:bkview];
    
    UIImage *icon = [UIImage imageNamed:imgname];
    UIImage *img_bottom = [UIImage imageNamed:@"backviewimg.png"];
    float mary = (scrH -(icon.size.height+img_bottom.size.height))/2;
    iconimg = [[UIImageView alloc] initWithFrame:CGRectMake(self.frame.size.width/2 - icon.size.width/2, mary, icon.size.width, icon.size.height)];
    iconimg.image = icon;
    [self addSubview:iconimg];
    
    UIImageView *iv_bottom = [[UIImageView alloc] initWithFrame:CGRectMake(iconimg.frame.origin.x+0.1, iconimg.frame.origin.y+iconimg.frame.size.height, img_bottom.size.width, img_bottom.size.height)];
    iv_bottom.image = img_bottom;
    iv_bottom.userInteractionEnabled = YES;
    [self addSubview:iv_bottom];
    
    namelabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 180, 30)];
    namelabel.text = name;
    namelabel.font = [UIFont systemFontOfSize:14];
    namelabel.textColor = [UIColor colorWithHexString:@"fc8db9"];
    [iv_bottom addSubview:namelabel];
    
    CGFloat my = namelabel.frame.size.height + namelabel.frame.origin.y;
    detailLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, my+2, iconimg.frame.size.width - 20, 100)];
    detailLabel.numberOfLines = 0;
    detailLabel.font = [UIFont systemFontOfSize:12];
    detailLabel.text = people;
    detailLabel.textColor = [UIColor colorWithHexString:@"5a5a5a"];
    [iv_bottom addSubview:detailLabel];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, iconimg.frame.size.height - 48, iconimg.frame.size.width, 30);
    [iv_bottom addSubview:btn];
    iconimg.userInteractionEnabled = YES;
    [btn setTitle:@"关闭" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor colorWithHexString:@"6a98ba"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    

}
- (void)btnClick{
    [self removeFromSuperview];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
