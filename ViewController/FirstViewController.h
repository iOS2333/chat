//
//  FirstViewController.h
//  
//
//  Created by 123 on 15/10/27.
//
//

#import <UIKit/UIKit.h>
extern NSMutableDictionary *mvcDic;
extern NSMutableArray *icon;
extern NSMutableArray *name_arr;
extern NSMutableArray *occ_arr;
extern NSMutableArray *peopleicon;
extern NSMutableArray *peopleContent;
extern NSNumber *peopleCount;
@interface FirstViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

@end
