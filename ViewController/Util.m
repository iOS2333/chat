//
//  Util.m
//  Chat
//
//  Created by ly on 15/10/29.
//  Copyright (c) 2015年 123. All rights reserved.
//

#import "Util.h"

@implementation Util

+(NSNumber *) get_sys_status:(SYSVAR) key{
    
    return (NSNumber *)[[NSUserDefaults standardUserDefaults] objectForKey:[NSString stringWithFormat:@"%d",key]];
}
+(BOOL)isMobileNumber:(NSString *)mobileNum
{
    NSString * MOBILE = @"^1(3[0-9]|5[0-35-9]|8[025-9])\\d{8}$";
    NSString * CM = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[278])\\d)\\d{7}$";
    NSString * CU = @"^1(3[0-2]|5[256]|8[56])\\d{8}$";
    NSString * CT = @"^1((33|53|8[09])[0-9]|349)\\d{7}$";
    // NSString * PHS = @"^0(10|2[0-5789]|\\d{3})\\d{7,8}$";
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    if (([regextestmobile evaluateWithObject:mobileNum] == YES)
        || ([regextestcm evaluateWithObject:mobileNum] == YES)
        || ([regextestct evaluateWithObject:mobileNum] == YES)
        || ([regextestcu evaluateWithObject:mobileNum] == YES))
    {
        return YES;
    }
    else
    {
        return NO;
    }
    
    //    if (mobileNum == nil || mobileNum.length != 11) {
    //        return NO;
    //    }
    //    return YES;
}


+(NSString *) audio_change_mobile:(NSString *) str{
    
    if (str == nil) {
        return @"";
    }
    
    if (str.length<11) {
        return str;
    }
    
    NSMutableArray *array ;
    for (int i = 0; i<str.length-10; i++) {
        NSString *subs = [str substringWithRange:NSMakeRange(i, 11)];
        NSLog(@"%@",subs);
        if ([self isMobileNumber:subs]) {
            if (array == nil) {
                array = [NSMutableArray arrayWithCapacity:0];
            }
            [array addObject:subs];
        }
    }
    
    if (array) {
        NSMutableArray *change_array = [NSMutableArray arrayWithCapacity:0];
        
        for (NSString * sub in array) {
            NSString *newstring = [self gen_mobile:sub];
            str = [str stringByReplacingOccurrencesOfString:sub withString:newstring];
        }
        
    }
    
    return str;
}

+(NSString *) gen_mobile:(NSString *) mobileNumber{
    NSString *rtnString=@"";
    for (int i = 0; i<mobileNumber.length; i++) {
        NSString *sub = [mobileNumber substringWithRange:NSMakeRange(i, 1)];
        rtnString = [rtnString addString:sub];
        if (i != (mobileNumber.length-1)) {
            rtnString = [rtnString addString:@"-"];
        }
    }
    NSLog(@"%@",rtnString);
    return rtnString;
}
@end

@implementation NSString(addCatalog)
-(NSString *) addString:(NSString *) stringValue{
    return     [self stringByAppendingString:stringValue];
    
}
-(NSString *) addBool:(BOOL) boolValue{
    return  [self stringByAppendingString:[NSString stringWithFormat:@"%@",boolValue ? @"true" :@"false"]];
}
-(NSString *) addInt:(int) intValue{
    return [self stringByAppendingString:[NSString stringWithFormat:@"%d",intValue]];
}
-(NSString *) addDouble:(double) doubleValue{
    return  [self stringByAppendingString:[NSString stringWithFormat:@"%f",doubleValue]];
}


@end
@implementation UIView(ClickBlock)

-(void)addClickBlock:(imageViewBlock)block{
    [self associateValue:block withKey:@"block"];
    self.userInteractionEnabled = YES;
    UITapGestureRecognizer *res = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickme)];
    [self addGestureRecognizer:res];
}
-(void) clickme{
    imageViewBlock block = [self associatedValueForKey:@"block"];
    if (block) {
        block(self.tag);
    }
}

@end






#import <objc/runtime.h>

@implementation NSObject (CategoryNSObject)

#pragma mark Associated Methods:

- (id) associateValue:(id)value withKey:(NSString *)aKey {
    
    objc_setAssociatedObject( self, (__bridge void *)aKey, value, OBJC_ASSOCIATION_RETAIN );
    return self;
}

- (id) associatedValueForKey:(NSString *)aKey {
    
    return objc_getAssociatedObject( self, (__bridge void *)aKey );
}


@end
@implementation NSDate(TOSTRING)
+(NSNumber *) currentTimeStamp{
    
    NSDate *cd = [NSDate date];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];//yyyy-MM-dd HH:mm:ss
    formatter.timeZone = [NSTimeZone timeZoneWithName:@"shanghai"];
    
    NSString *str = [formatter stringFromDate:cd];
    
    NSLog(@"currtime:%@",str);
    
    return [str toTimeStampFormat];
    
    
}
@end
@implementation NSString(TOTIMESTAMP)
-(NSNumber *)toTimeStampFormat{
    
    //    NSString *formatMystr = [[[self stringByReplacingOccurrencesOfString:@"年" withString:@"-"] stringByReplacingOccurrencesOfString:@"月" withString:@"-"] stringByReplacingOccurrencesOfString:@"日" withString:@""];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    formatter.timeZone = [NSTimeZone timeZoneWithName:@"shanghai"];
    NSDate *mydate = [formatter dateFromString:self];
    long lg = [[NSNumber numberWithDouble:[mydate timeIntervalSince1970]] longValue];
    NSString *ss = [NSString stringWithFormat:@"%ld",lg];
    NSNumber *rtnn = [NSNumber numberWithLongLong:[ss longLongValue]];
    return rtnn;
}
@end