//
//  JTexView.h
//  
//
//  Created by 123 on 15/10/27.
//
//

#import <UIKit/UIKit.h>
#import "UITextView+Extras.h"
#import <AVFoundation/AVPlayer.h>
#import <AVFoundation/AVAudioPlayer.h>
#import <AVFoundation/AVAudioSession.h>
#import "Bean.h"
@protocol JTextViewDelegate <NSObject>
-(void)viewSize:(CGSize)size AndTag:(NSInteger)tag andArticleID:(NSNumber *)aID andWordID:(NSNumber *)wID;
@end
@interface JTextView : UIView<AVAudioPlayerDelegate>



- (void)setup:(CGRect)frame
            WithArticleString:(NSString *)string
                witharticleID:(NSNumber *)readNO
                  withWordDic:(NSDictionary *)wordDic
                 andViewWidth:(CGFloat)width
                 withFontSize:(CGFloat)fontSize
             andTransFontSize:(CGFloat)TfontSize
                     delegate:(id<JTextViewDelegate>)delegate;
+(CGFloat) heightForString:(NSString *)value fontSize:(CGFloat)fontSize andWidth:(CGFloat)width;
-(void)changeViewsHight;
- (void)getwordIDs:(NSArray *)wordids_arr withWords:(NSArray *)word_arr;

+ (NSString *)formatString:(NSString *)scource;


@end
