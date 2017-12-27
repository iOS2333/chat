//
//  PeopleCell.h
//  Chat
//
//  Created by 123 on 15/10/30.
//  Copyright © 2015年 123. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Bean.h"
@interface PeopleCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *peopleimg;
@property (weak, nonatomic) IBOutlet UILabel *peoplename;
@property (weak, nonatomic) IBOutlet UILabel *pmessage;
@property (weak, nonatomic) IBOutlet UILabel *ptime;
@property (weak, nonatomic) IBOutlet UIImageView *messageimg;
@property (weak, nonatomic) IBOutlet UILabel *messagelb;

- (void)customCellwithVO:(FriendVO *)vo;
@end
