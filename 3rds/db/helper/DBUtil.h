//
//  DBUtil.h
//  Chat
//
//  Created by ly on 15/11/13.
//  Copyright (c) 2015年 123. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DBUtil : NSObject
+(BOOL) saveVO:(NSArray *) beans;
+(NSMutableArray *) fetchClass:(Class) beanClass byDialogID:(NSString *) dialogid;
+(BOOL) deleteVO:(Class) beanClass byDialogID:(NSString *) dialogid subIds:(NSArray *) subids;
+(NSMutableArray *) fetchFriend;
+(void) cleanAll;
@end
