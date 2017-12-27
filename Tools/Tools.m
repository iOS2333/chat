//
//  Tools.m
//  
//
//  Created by 123 on 15/10/29.
//
//

#import "Tools.h"

@implementation Tools


@end

@implementation UIColor(HEXCOLOR)
+ (UIColor *) colorWith_newGreen{
    return [UIColor colorWithHexString:@"#26c7db"];
}
+ (UIColor *) colorWithCorrect{
    return [UIColor colorWithHexString:@"#48e071"];
}
+ (UIColor *) colorWithError{
    return [UIColor colorWithHexString:@"#da5161"];
}
+ (UIColor *) colorWithBubble{
    return [UIColor colorWithHexString:@"#f8f8f8"];
}
+ (UIColor *) colorWithLine{
    return [UIColor colorWithHexString:@"#dcdcdc"];
}
+ (UIColor *) colorWithNav{
    return [UIColor colorWithHexString:@"#c9c9c9"];
}
+ (UIColor *) colorWithBlue{
    
    return [UIColor colorWithHexString:@"#00a0e9"];
}
+ (UIColor *) colorWithBlack{
    return [UIColor colorWithHexString:@"#4a4a4a"];
}

+ (UIColor *) colorWithGray{
    return [UIColor colorWithHexString:@"#a4a4a4"];
}
+ (UIColor *) colorWithGreen{
    return [UIColor colorWithHexString:@"#27aba9"];
}

+ (UIColor *) colorWithGreen_new{
    return [UIColor colorWithHexString:@"#5cd4e3"];
}

+ (UIColor *) colorWithGrayness{
    return [UIColor colorWithHexString:@"#9f9f9f"];
}



+ (UIColor *) colorWithHexString: (NSString *)color alpha:(float) alpha{
    NSString *cString = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 characters
    if ([cString length] < 6) {
        return [UIColor clearColor];
    }
    
    // strip 0X if it appears
    if ([cString hasPrefix:@"0X"])
        cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"])
        cString = [cString substringFromIndex:1];
    if ([cString length] != 6)
        return [UIColor clearColor];
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    
    //r
    NSString *rString = [cString substringWithRange:range];
    
    //g
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    
    //b
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f) green:((float) g / 255.0f) blue:((float) b / 255.0f) alpha:alpha];
}

+ (UIColor *) colorWithHexString: (NSString *)color
{
    NSString *cString = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 characters
    if ([cString length] < 6) {
        return [UIColor clearColor];
    }
    
    // strip 0X if it appears
    if ([cString hasPrefix:@"0X"])
        cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"])
        cString = [cString substringFromIndex:1];
    if ([cString length] != 6)
        return [UIColor clearColor];
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    
    //r
    NSString *rString = [cString substringWithRange:range];
    
    //g
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    
    //b
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f) green:((float) g / 255.0f) blue:((float) b / 255.0f) alpha:1.0f];
}

@end

