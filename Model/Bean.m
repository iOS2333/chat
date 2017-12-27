//
//  Bean.m
//  MF_sgenglish
//
//  Created by ly on 14/11/5.
//  Copyright (c) 2014年 mf. All rights reserved.
//

#import "Bean.h"
@implementation Bean



@end


@implementation CETWordListVO
//@property (strong,atomic)NSNumber *readNo;
//@property (strong,atomic)NSString *word;
//@property (strong,atomic)NSString *translation;
//@property (strong,atomic)NSString *imgUrl;
//@property (strong,atomic)NSString *soundUrl;
//@property (strong,atomic)NSString *mnemonics;
//@property (strong,atomic)NSNumber *level;
//@property (strong,atomic)NSNumber *type;
//@property (strong,atomic)NSNumber *frequency;
//@property (strong,atomic)NSArray *imgUrls;
//@property (strong,atomic) NSNumber *iserror;

-(id)copyWithZone:(NSZone *)zone{
    CETWordListVO *newvo = [[CETWordListVO alloc] init];
    newvo->_readNo = self->_readNo;
    newvo->_word = self->_word;
    newvo->_translation = self->_translation;
    newvo->_imgUrl = self->_imgUrl;
    newvo->_soundUrl = self->_soundUrl;
    newvo->_mnemonics = self->_mnemonics;
    newvo->_level = self->_level;
    newvo->_type = self->_type;
    newvo->_frequency = self->_frequency;
    newvo->_imgUrls = self->_imgUrls;
    newvo->_iserror = self->_iserror;
    return newvo;
}

@end

@implementation DialogVO
-(instancetype)init{
    self = [super init];
    if (self) {
        _isAutoMachine = [NSNumber numberWithBool:YES];
        _selectedTag = [NSNumber numberWithInteger:0];
    }
    return self;
}



-(id)copyWithZone:(NSZone *)zone{
    DialogVO *newvo = [[DialogVO alloc] init];
    newvo->_dialogid = self->_dialogid;
    newvo->_did = self->_did;
    newvo->_subIds = self->_subIds;
    newvo->_subTexts = self->_subTexts;
    newvo->_subScores = self->_subScores;
    newvo->_isAutoMachine = self->_isAutoMachine;
    newvo->_selectedTag = self->_selectedTag;
    newvo->_timerStamp = self->_timerStamp;
    return newvo;
}



+(NSString *)getTableName
{
    
    return [NSString stringWithFormat:@"%@_message",NSStringFromClass([DialogVO class])];
    
    //    return @"SecretMsgVO_message_83";
}

+(NSDictionary *) getColumnTypeByYourself{
    
    NSDictionary *dic = [NSMutableDictionary dictionaryWithCapacity:0];
//    [dic setValue:@"long" forKey:@"secretMsgNo"];
//    [dic setValue:@"long" forKey:@"friendNo"];
//    [dic setValue:@"long" forKey:@"senderNo"];
//    [dic setValue:@"long" forKey:@"receiverNo"];
//    [dic setValue:@"long" forKey:@"userNo"];
    return dic;
}
+(NSArray *)sqlNotToBindingPropertyValue{
    
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:0];
    [array addObject:@"sendImgPath"];
    return array;
}

+(BOOL)dbWillDelete:(NSObject *)entity{
    
//    NSLog(@"%@",NSStringFromClass([entity class]));
//    DialogVO *msg =(DialogVO *) entity;
//    
//    if (msg.sendImgPath) {
//        [[msg class] deleteDBImageWithName:msg.sendImgPath];
//    }
    
    
    return YES;
}

+(NSString *)getPrimaryKeyForDefine
{
    return @"dialogid";
}


+(void)initialize
{
    //remove unwant property
    //比如 getTableMapping 返回nil 的时候   会取全部属性  这时候 就可以 用这个方法  移除掉 不要的属性
    //    [self removePropertyWithColumnName:@"mynumber"];
    
    
    //simple set a column as "LKSQL_Mapping_UserCalculate"
    //根据 属性名  来启用自己计算
    //[self setUserCalculateForCN:@"error"];
    
    
    //根据 属性类型  来启用自己计算
    //[self setUserCalculateForPTN:@"NSDictionary"];
    
    //enable own calculations
    //[self setUserCalculateForCN:@"address"];
    
    //enable the column binding property name
    //    [self setTableColumnName:@"MyAge" bindingPropertyName:@"age"];
    //    [self setTableColumnName:@"MyDate" bindingPropertyName:@"date"];
}


@end





@implementation FriendVO

+(NSString *)getTableName
{
    
    return [NSString stringWithFormat:@"%@_message",NSStringFromClass([FriendVO class])];
    
    //    return @"SecretMsgVO_message_83";
}
+(NSString *)getPrimaryKeyForDefine
{
    return @"user_id";
}
+(BOOL)saveIsUpdateForDefine{
    return YES;
}


@end


@implementation DynamicVO
+(NSString *)getTableName
{
    
    return [NSString stringWithFormat:@"%@_message",NSStringFromClass([DynamicVO class])];
    
    //    return @"SecretMsgVO_message_83";
}
+(NSString *)getPrimaryKeyForDefine
{
    return @"dynamicId";
}
+(BOOL)saveIsUpdateForDefine{
    return YES;
}

@end

@implementation ChatGroupVO

@end

