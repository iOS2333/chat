//
//  Bean.h
//  MF_sgenglish
//
//  Created by ly on 14/11/5.
//  Copyright (c) 2014年 mf. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LKDBHelper.h"

@interface Bean : NSObject
@end


//CET文章单词
@interface CETWordListVO : NSObject<NSCopying>
@property (strong,atomic)NSNumber *readNo;
@property (strong,atomic)NSString *word;
@property (strong,atomic)NSString *translation;
@property (strong,atomic)NSNumber *lit_type;
@property (strong,atomic)NSArray *picArr;
@property (strong,atomic)NSString *imgUrl;
@property (strong,atomic)NSString *soundUrl;
@property (strong,atomic)NSString *mnemonics;
@property (strong,atomic)NSNumber *level;
@property (strong,atomic)NSNumber *type;
@property (strong,atomic)NSNumber *frequency;
@property (strong,atomic)NSArray *imgUrls;
@property (strong,atomic) NSNumber *iserror;

@end

@interface DialogVO : NSObject<NSCopying>
@property (atomic,strong) NSString* dialogid;
@property(strong,atomic) NSString *did;
@property(strong,atomic) NSArray *subIds;
@property(strong,atomic) NSArray *subTexts;
@property(strong,atomic) NSArray *subScores;
@property (strong,atomic) NSArray *subAudios;
@property(strong,atomic) NSNumber *isAutoMachine;//YES机器//NO用户
@property (strong,atomic) NSNumber *type;//0文本,1加音频
@property(strong,atomic) NSNumber *selectedTag;
//@property(strong,atomic) NSNumber *selectedHeight;
//@property(strong,atomic) NSNumber *selectedX;
@property (strong,atomic) NSNumber *timerStamp;
@end



@interface FriendVO : NSObject
@property (strong,atomic) NSString *name;
@property (strong,atomic) NSString *user_id;
@property (strong,atomic) NSString *myicon;
@property (strong,atomic) NSString *peopleDetailimg;
@property (strong,atomic) NSString *peopleDetailContent;
@property (strong,atomic) NSString *content;
@property(strong,atomic) NSNumber *isAutoMachine;//YES机器//NO用户
@property (strong,atomic)NSNumber *sex;//0 男 1女
@property (strong,atomic) NSNumber *scroes;
@property (strong,atomic) NSNumber *age;
@property (strong,atomic) NSString *occ;
@property (strong,atomic) NSNumber *timerStamp;

@end

@interface DynamicVO : NSObject
@property (strong,atomic) NSString *dynamicId;
@property (strong,atomic) NSString *name;
@property (strong,atomic) NSString *content;
@property (strong,atomic) NSString *friendname;
@property (strong,atomic) NSString *friendicon;
@property (strong,atomic) NSString *time;
@property (strong,atomic) NSNumber *selectBtn;
@property (strong,atomic) NSNumber *zanNum;
@property BOOL isZan;

@end


@interface ChatGroupVO : NSObject
@property(nonatomic,strong) NSString *key;
@property (nonatomic,strong) NSMutableArray *numbers;
@end

