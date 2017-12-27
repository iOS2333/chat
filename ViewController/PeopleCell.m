//
//  PeopleCell.m
//  Chat
//
//  Created by 123 on 15/10/30.
//  Copyright © 2015年 123. All rights reserved.
//

#import "PeopleCell.h"
#import "Util.h"
#import "JTexView.h"
@implementation PeopleCell

- (void)awakeFromNib {
    // Initialization code
    _messageimg.hidden = YES;
    _messagelb.hidden = YES;
}
- (void)customCellwithVO:(FriendVO *)vo{
    
    _peopleimg.image = [UIImage imageNamed:vo.myicon];
    _peoplename.text = vo.name;
    
    NSString *str = [JTextView  formatString:vo.content];
      _pmessage.text = str;

}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
