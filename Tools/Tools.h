//
//  Tools.h
//  
//
//  Created by 123 on 15/10/29.
//
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "JTexView.h"
#import "DBUtil.h"
@interface Tools : NSObject

@end

@interface UIColor(HEXCOLOR)
+ (UIColor *) colorWithHexString: (NSString *)color;
+ (UIColor *) colorWithHexString: (NSString *)color alpha:(float) alpha;
+ (UIColor *) colorWithGray;
+ (UIColor *) colorWithGreen;
+ (UIColor *) colorWithGreen_new;
+ (UIColor *) colorWithBlack;
+ (UIColor *) colorWithBlue;
+ (UIColor *) colorWithNav;
+ (UIColor *) colorWithLine;
+ (UIColor *) colorWithBubble;
+ (UIColor *) colorWithCorrect;
+ (UIColor *) colorWithError;
+ (UIColor *) colorWith_newGreen;
@end
