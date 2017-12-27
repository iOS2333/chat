//
//  DBUtil.m
//  Chat
//
//  Created by ly on 15/11/13.
//  Copyright (c) 2015年 123. All rights reserved.
//

#import "DBUtil.h"
#import "LKDBHelper.h"
#import "Bean.h"



@implementation DBUtil
+(BOOL) saveVO:(NSArray *) beans{

    BOOL success = TRUE;
    if (beans && beans.count>0) {
        for (id bean in beans) {
            LKDBHelper *helper = [[bean class] getUsingLKDBHelper];
            if ([[bean class] saveIsUpdateForDefine] && [[bean class] getPrimaryKeyForDefine] != nil) {
                [[self class] deleteVO:[bean class] byDialogID:[bean valueForKey:[[bean class] getPrimaryKeyForDefine]] subIds:nil];
            }
            success =            [helper insertWhenNotExists:bean];
        }
    }
    return success;
}

+(NSMutableArray *) fetchClass:(Class) beanClass byDialogID:(NSString *) dialogid{
    if (!beanClass) {
        return nil;
    }
    LKDBHelper *helper = [beanClass getUsingLKDBHelper];
    
    NSMutableString *sql = [[NSMutableString alloc] initWithString:@"select * from @t "];
    if (dialogid) {
        NSString *privateKey = [beanClass getPrimaryKeyForDefine];
        if (privateKey) {
                    [sql appendString:[NSString stringWithFormat:@" where %@='%@'",privateKey,dialogid]];
        }

    }
   return  [helper searchWithSQL:sql toClass:beanClass];
}

+(BOOL) deleteVO:(Class) beanClass byDialogID:(NSString *) dialogid subIds:(NSArray *) subids{
    if (!beanClass) {
        return FALSE;
    }
    if (!dialogid) {
        return FALSE;
    }

    LKDBHelper *helper = [beanClass getUsingLKDBHelper];
    NSMutableString *sql = [[NSMutableString alloc] initWithString:@""];
    if (dialogid) {
        NSString *privateKey = [beanClass getPrimaryKeyForDefine];
        if (privateKey) {
            [sql appendString:[NSString stringWithFormat:@" %@='%@' ",privateKey,dialogid]];
        }
        
    }
    if (subids && subids.count>0) {
        NSMutableString *ids = [[NSMutableString alloc] initWithString:@" ("];
        for (NSInteger i = 0; i<subids.count; i++) {
            NSString *s = [subids objectAtIndex:i];
            [ids appendString:@"'"];
            [ids appendString:s];
            [ids appendString:@"'"];
                if (i != subids.count-1)
                [ids appendString:@","];else
                [ids appendString:@") "];
        }
        [sql appendString:[NSString stringWithFormat:@" and did in %@ ",ids]];
    }

    
    return   [helper delete_by_where:sql model:[[beanClass alloc] init]];
}


+(NSMutableArray *) fetchFriend {
    LKDBHelper *helper = [[FriendVO class] getUsingLKDBHelper];
    
    NSMutableString *sql = [[NSMutableString alloc] initWithString:@"select * from @t "];
    NSMutableArray* rtn =  [helper searchWithSQL:sql toClass:[FriendVO class]];
    if (rtn && rtn.count>0) {
        for (FriendVO *fvo in rtn) {
            NSString *sq = [NSString stringWithFormat:@"select *from %@ where dialogid='%@' order by timerStamp desc limit 0, 1",[[DialogVO class] getTableName],fvo.user_id];
            LKDBHelper *fhelper = [[DialogVO class] getUsingLKDBHelper];
            NSMutableArray *farray = [fhelper searchWithSQL:sq toClass:[DialogVO class]];
            if (farray && farray.count==1) {
                DialogVO *dvo = [farray objectAtIndex:0];
                if (dvo.selectedTag) {
                    NSInteger index = [dvo.selectedTag integerValue];
                    if (dvo.subTexts && dvo.subTexts.count>index) {
                        NSString *c = [dvo.subTexts objectAtIndex:index];
                        fvo.content = c;
                        fvo.isAutoMachine = dvo.isAutoMachine;
                    }
                    
                }
            }
        }
    }
    return rtn;
}

+(void) cleanAll{

    LKDBHelper *helper = [[FriendVO class] getUsingLKDBHelper];
    [helper dropAllTable];
}
@end
