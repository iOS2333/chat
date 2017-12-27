//
//  Util.h
//  Chat
//
//  Created by ly on 15/10/29.
//  Copyright (c) 2015年 123. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


#define __RGB(__rgb) [UIColor colorWithRed:((float)((__rgb & 0xFF0000) >> 16))/255.0 green:((float)((__rgb & 0xFF00) >> 8))/255.0 blue:((float)(__rgb & 0xFF))/255.0 alpha:1.0f]
typedef enum SYS{ //数值不能改变
    SYSVAR_VOICE_NUMBER = 0,
    SYSVAR_WIFI_AUTO,
    SYSVAR_3G,
    SYSVAR_WIFI_NOTIFYME
    
}SYSVAR;

@interface Util : NSObject
+(NSNumber *) get_sys_status:(SYSVAR) key;
+(BOOL)isMobileNumber:(NSString *)mobileNum;
+(NSString *) audio_change_mobile:(NSString *) str;
+(NSString *) gen_mobile:(NSString *) mobileNumber;
@end

typedef void (^imageViewBlock)(NSInteger tag);
typedef void (^addFinishBlock)(NSInteger tag);
@interface NSString(addCatalog)

-(NSString *) addString:(NSString *) stringValue;

-(NSString *) addBool:(BOOL) boolValue;
-(NSString *) addInt:(int) intValue;
-(NSString *) addDouble:(double) doubleValue;

@end
@interface UIView(ClickBlock)
-(void)addClickBlock:(imageViewBlock)block;
@end
@interface NSObject (CategoryNSObject)

- (id) associateValue:(id)value withKey:(NSString *)aKey;
- (id) associatedValueForKey:(NSString *)aKey;

@end
@interface NSString(TOTIMESTAMP)
-(NSNumber *)toTimeStampFormat;
@end
@interface NSDate(TOSTRING)
+(NSNumber *) currentTimeStamp;
@end
