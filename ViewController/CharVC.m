//
//  CharVC.m
//  Chat
//
//  Created by ly on 15/10/27.
//  Copyright (c) 2015年 123. All rights reserved.
//

#import "CharVC.h"

#import "ChatScorll.h"
#import "Util.h"
#import "DBUtil.h"
#import "PeopleDetailView.h"

@interface CharVC ()<UIAlertViewDelegate>
{
    NSMutableDictionary *_sourceWords;
    NSMutableArray *_sourceTexts;
    
    ChatScorll *_mainScroll;
    
    UIView *_bottomV;
    ChatScorll *bottomScroll;
    BOOL issendClick;
    UIImageView *stateView;
    NSMutableArray *_processingTexts;
    UIView *navigationview;
    BOOL first ;

    UIImageView *iv_fen;
    UIImageView *sc_v;
    
    NSInteger time;
    NSInteger totalScore;
    NSMutableArray *chatArr;
    UIAlertView *alert_s;
    UIAlertView *alert_w;
    NSMutableArray *_resultText;
}
@end

@implementation CharVC
-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    //设置白色字体的状态栏
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:YES];
      self.navigationController.navigationBarHidden = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
   
    first = TRUE;
    _resultText = [NSMutableArray array];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self customNA];
    chatArr = [NSMutableArray array];
    NSArray *arr_p = [DBUtil fetchClass:[FriendVO class] byDialogID:self.people.user_id];
    FriendVO *fvo = [arr_p lastObject];
    totalScore = [fvo.scroes integerValue];
      [DBUtil deleteVO:[FriendVO class] byDialogID:self.people.user_id subIds:@[]];
    [self setupData];
    [self setupViews];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(savevo) name:@"savevo" object:nil];
//    self.navigationItem.title = @"消息";
//    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
//     self.navigationController.navigationBar.titleTextAttributes = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:15],NSFontAttributeName,[UIColor whiteColor],NSForegroundColorAttributeName, nil];
//    self.navigationController.navigationBar.barTintColor = [UIColor colorWithHexString:@"26c6da"];
//    self.navigationItem.hidesBackButton = YES;
//    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStyleBordered target:self action:@selector(ItemCLick)];
    UIImage *xinback = [UIImage imageNamed:@"tuoyuanhei.png"];
    UIButton *xinbtn = [UIButton buttonWithType:UIButtonTypeCustom];
    xinbtn.frame = CGRectMake(self.view.frame.size.width - xinback.size.width, 64-xinback.size.height/2, xinback.size.width, xinback.size.height);
    xinbtn.userInteractionEnabled = NO;
//    [xinbtn setImage:xinimg forState:UIControlStateNormal];
    [xinbtn setBackgroundImage:xinback forState:UIControlStateNormal];
    [self.view addSubview:xinbtn];
    
    UIImage *xinimg = [UIImage imageNamed:@"xin_bai.png"];
    iv_fen = [[UIImageView alloc] initWithFrame:CGRectMake(xinbtn.frame.size.width/2-xinimg.size.width/2+1, 18, xinimg.size.width, xinimg.size.height)];
    iv_fen.image = xinimg;
    [xinbtn addSubview:iv_fen];
    
    sc_v = [[UIImageView alloc] initWithFrame:CGRectMake(iv_fen.frame.origin.x, iv_fen.frame.origin.y+iv_fen.frame.size.height, iv_fen.frame.size.width-2, 0)];
    CGFloat newH = (iv_fen.frame.size.height-2)/30.00;
    
    CGFloat hh = totalScore *newH;
    
    if (totalScore < 0) {
        sc_v.frame = CGRectMake(iv_fen.frame.origin.x, iv_fen.frame.origin.y+iv_fen.frame.size.height-4, iv_fen.frame.size.width, 0);
        totalScore = 0;
    }else {
        sc_v.frame = CGRectMake(iv_fen.frame.origin.x, iv_fen.frame.origin.y+iv_fen.frame.size.height-hh-4, iv_fen.frame.size.width, hh);
    }
//    sc_v.image = [UIImage imageNamed:@"xin_new.png"];
    sc_v.backgroundColor = [UIColor colorWithRed:247/255.0 green:198/255.0 blue:255/255.0 alpha:1];
    sc_v.layer.masksToBounds = YES;
    sc_v.layer.cornerRadius = 2;
    [xinbtn addSubview:sc_v];

    UIImage *img_bj = [UIImage imageNamed:@"xintop_new.png"];
    UIImageView *iv_bj = [[UIImageView alloc] initWithFrame:CGRectMake(xinbtn.frame.origin.x, 64-img_bj.size.height/2, img_bj.size.width, img_bj.size.height)];
//    iv_bj.backgroundColor = [UIColor clearColor];
    iv_bj.image = img_bj;
    [self.view addSubview:iv_bj];
}
- (void)savevo{
    [DBUtil saveVO:@[self.people]];
}
- (void)customNA{
    navigationview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 64)];
    [self.view addSubview:navigationview];
    navigationview.backgroundColor = [UIColor colorWithHexString:@"2c2a31"];

    UIImage *backimg = [UIImage imageNamed:@"jiantou.png"];
    UIImageView *back = [[UIImageView alloc] initWithFrame:CGRectMake(7, 20+22-backimg.size.height/2, backimg.size.width, backimg.size.height)];
    back.image = backimg;
     back.transform = CGAffineTransformMakeScale(-1, 1);
    [navigationview addSubview:back];
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(5,22 , 60, 40)];
    [btn setTitle:@"返回" forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:14];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [navigationview addSubview:btn];
    [btn addTarget:self action:@selector(ItemCLick) forControlEvents:UIControlEventTouchUpInside];
    UILabel *lb = [[UILabel alloc] initWithFrame:CGRectMake(navigationview.frame.size.width/2 - 50, 20+(navigationview.frame.size.height -20)/2-20, 200, 40)];
    lb.text = self.people.name;
    lb.font = [UIFont boldSystemFontOfSize:15];
    lb.textColor = [UIColor whiteColor];
    [navigationview addSubview:lb];
    
}
-(void) setupData{

    _sourceWords = [NSMutableDictionary dictionaryWithDictionary:[ChatData chattranslation]];
    _sourceTexts = [NSMutableArray arrayWithCapacity:0];
    _processingTexts = [NSMutableArray arrayWithCapacity:0];
    
    NSDictionary *pDic;
    if (chatDataDic) {
     pDic = [chatDataDic objectForKey:self.people.user_id];
        
    }
  
    NSArray *question_arr = [pDic objectForKey:@"question"];
    NSArray *answer_arr = [pDic objectForKey:@"answer"];
  
  
    NSInteger questionCount = 0;
    NSInteger answerCount = 0;
    for (NSInteger i = 0; i<question_arr.count + answer_arr.count; i++) {
       
            DialogVO *dvo = [[DialogVO alloc] init];
            dvo.dialogid = self.people.user_id;
            dvo.did = [NSString stringWithFormat:@"%zd",i];
            NSMutableArray *ids = [NSMutableArray arrayWithCapacity:0];
            NSMutableArray *texts = [NSMutableArray arrayWithCapacity:0];
            NSMutableArray *scores = [NSMutableArray arrayWithCapacity:0];
            NSNumber *_score;
            for (NSInteger j = 0; j<3; j++) {
                NSString*_id = [NSString stringWithFormat:@"%zd%zd",i,j];
                NSString*_text;
                [ids addObject:_id];
                if (i%2 == 0) {
                    
                    _text = question_arr[questionCount];
                    
                }else{
                    NSArray *an_arr = [answer_arr[answerCount] objectForKey:[NSString stringWithFormat:@"%zd",j]];
                    _text  = [an_arr firstObject];
                    _score = [an_arr lastObject];
                    if (_score) {
                        [scores addObject:_score];

                    }
            }
                if (_text) {
                   [texts addObject:_text];
                }
                
            }
            
            
            
            dvo.subIds = ids;
            dvo.subTexts = texts;
            dvo.subScores = scores;
            
            dvo.isAutoMachine = [NSNumber numberWithBool:i%2==0?true:false];
            if (i%2 == 0) {
                questionCount ++;
            }else{
                answerCount ++;
            }
         if (i< question_arr.count + answer_arr.count - 4) {
            [_sourceTexts addObject:dvo];
 
        }else{
            [_resultText addObject:dvo];
        }
        
    }
  
    
    
//    BOOL succ = [DBUtil saveVO:_sourceTexts];
//    
//    NSMutableArray *arr = [DBUtil fetchClass:[DialogVO class] byDialogID:@"1"];
//    NSLog(@"");
//    
//    [_processingTexts addObjectsFromArray:_sourceTexts];
}

- (void)ItemCLick{

    if (self.isChatInfo) {
        [self.navigationController popViewControllerAnimated:YES];
    }else {
        
        [mvcDic setValue:self forKey:self.people.user_id];
        self.people.scroes =[NSNumber numberWithInteger:totalScore];
        self.people.timerStamp = [NSDate currentTimeStamp];
        [DBUtil saveVO:@[self.people]];
        
        for (UIViewController *vc in self.navigationController.viewControllers) {
            if ([vc  isKindOfClass:[TabVC  class]]) {
                [self.navigationController popToViewController:vc animated:YES];
            }
        }


    }
    
    
}

-(void) setupViews{
    
    _mainScroll = [[ChatScorll alloc] initWithFrame:CGRectMake(0, 66, self.view.bounds.size.width, self.view.bounds.size.height-30-66)];
    _mainScroll.backgroundColor = [UIColor colorWithHexString:@"ebebeb"];
    [self.view addSubview:_mainScroll];
    
    NSArray *arr = [DBUtil fetchClass:[DialogVO class] byDialogID:self.people.user_id];
    NSMutableArray *id_arr = [NSMutableArray array] ;
//    for (int i = 0; i<2; i++) {
//        DialogVO *dvo = [arr objectAtIndex:i];
//        [id_arr addObject:dvo.did];
//    }
//
    
     DialogVO *dvo = [arr lastObject];
    NSLog(@"");
    if (arr.count) {
        [_processingTexts addObjectsFromArray:arr];
    }
   
    //chat
    for (NSInteger i = 0; i<_processingTexts.count; i++) {
        DialogVO *dv = [_processingTexts objectAtIndex:i];
        [_mainScroll addDialog:dv andVO:self.people withDic:_sourceWords withshowSendButton:NO withClickBlock:^(id bean) {
            
        }withimgBlock:^(id bean) {
             [self customPeopleDetail:self.people];
        }];
    }
    
    CGFloat mx = 0;
    //bottom
    _bottomV = [[UIView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height-50, self.view.bounds.size.width, 50+300)];
    _bottomV.backgroundColor = [UIColor colorWithHexString:@"f5f5f7"];
    [self.view addSubview:_bottomV];
    bottomScroll = [[ChatScorll alloc] initWithFrame:CGRectMake(0, 50, _bottomV.frame.size.width, 300)];
    bottomScroll.backgroundColor = [UIColor colorWithHexString:@"e2e2e2"];
    [_bottomV addSubview:bottomScroll];

    UIImage *helpimg = [UIImage imageNamed:@"help.png"];
    UIImageView *helpimgView =[[UIImageView alloc] initWithFrame:CGRectMake(2, 25- helpimg.size.height/2, helpimg.size.width, helpimg.size.height)];
    helpimgView.image = helpimg;
    [_bottomV addSubview:helpimgView];
    mx = helpimgView.frame.origin.x + helpimgView.frame.size.width;
    mx += 10;
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *stateimg = [UIImage imageNamed:@"stateback.png"];
    stateView = [[UIImageView alloc] initWithFrame:CGRectMake(_bottomV.frame.size.width - stateimg.size.width-10, 25- stateimg.size.height/2, stateimg.size.width, stateimg.size.height)];

    [stateView addClickBlock:^(NSInteger tag) {
        [self toSay];
    }];

    stateView.image = stateimg;
    [_bottomV addSubview:stateView];
    btn.frame = CGRectMake(mx, 25-15, _bottomV.frame.size.width- mx - 20 - stateimg.size.width, 30);
    [btn setTitle:@"说点什么" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal]; 
    [btn setBackgroundImage:[UIImage imageNamed:@"chatback.png"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(toSay) forControlEvents:UIControlEventTouchUpInside];
    [_bottomV addSubview:btn];
    
    
    [self add_data_to_bottom];
    if(dvo){
        if (_sourceTexts.count<=_processingTexts.count) {
            if (self.isChatInfo == FALSE) {

            if (totalScore > 60) {
                alert_s = [[UIAlertView alloc] initWithTitle:@"提示" message:@"恭喜你,成功完成聊天" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
                [alert_s show];
                
            }
                
            }
        }
    }else{
        [self next_what_to_do];
    }
    

    

  


    
}

-(void) add_data_to_bottom{
    if (_sourceTexts.count>_processingTexts.count) {
        DialogVO *dvo = [_sourceTexts objectAtIndex:_processingTexts.count];
        if (![dvo.isAutoMachine boolValue]) {
            for (NSInteger i = 0; i<dvo.subTexts.count; i++) {
                NSLog(@"dvo.subScores == %@",dvo);
                DialogVO *copyvo = [dvo copy];
                copyvo.selectedTag = [NSNumber numberWithInteger:i];
                [bottomScroll addDialog:copyvo andVO:self.people withDic:_sourceWords withshowSendButton:YES withClickBlock:^(id bean) {
                    dispatch_async(dispatch_get_main_queue(), ^{
                        issendClick = YES;
                        [self toSay];
                        DialogVO *ddvo = (DialogVO *) bean;
                       [DBUtil saveVO:@[ddvo]];
                        NSLog(@" ddvo.subScores == %@, ddvo.subTexts == %@, ddvo.subIDs == %@",[ddvo.subScores objectAtIndex:[ddvo.selectedTag integerValue]],[ddvo.subTexts objectAtIndex:[ddvo.selectedTag integerValue]],[ddvo.subIds objectAtIndex:[ddvo.selectedTag integerValue]]);
                        
                        NSInteger h = [[ddvo.subScores objectAtIndex:[ddvo.selectedTag integerValue]] integerValue];
                        CGFloat newH = (iv_fen.frame.size.height-2)/30.00;
                        
                        totalScore += h;
                        CGFloat hh = totalScore *newH;
                        
                        if (totalScore < 0) {
                            sc_v.frame = CGRectMake(iv_fen.frame.origin.x, iv_fen.frame.origin.y+iv_fen.frame.size.height-4, iv_fen.frame.size.width, 0);
                            totalScore = 0;
                        }else {
                            sc_v.frame = CGRectMake(iv_fen.frame.origin.x, iv_fen.frame.origin.y+iv_fen.frame.size.height-hh-4, iv_fen.frame.size.width, hh);
                        }
            
                        NSLog(@" totalScore =============================== %ld",(long)totalScore);
                        
                        UIImage *img_chat;
                        if (h == 3) {
                            img_chat = [UIImage imageNamed:@"great.png"];
                            time = 2;
                        }else
                            if (h == 2) {
                                img_chat = [UIImage imageNamed:@"good.png"];
                                time = 5;
                            }else {
                                img_chat = [UIImage imageNamed:@"bad.png"];
                                time = 10;
                            }
                        NSString *name = [JTextView formatString:[ddvo.subTexts objectAtIndex:[ddvo.selectedTag integerValue]]];
                        if (_message) {
                            _message(@[name,ddvo.isAutoMachine]);
                        }

                        UIImageView *iv_chat = [[UIImageView alloc] initWithFrame:CGRectMake(self.view.bounds.size.width/2-img_chat.size.width/2, self.view.bounds.size.height-150, img_chat.size.width, img_chat.size.height)];
                        iv_chat.image = img_chat;
                        [self.view addSubview:iv_chat];
                        

                        [_processingTexts addObject:ddvo];
                        [_mainScroll addDialog:ddvo andVO:self.people withDic:_sourceWords withshowSendButton:NO withClickBlock:^(id bean) {
                            
                        }withimgBlock:^(id bean) {
                             [self customPeopleDetail:self.people];
                        }];
                        
                        [bottomScroll removeAllDialog];
                        __weak CharVC *wself = self;
                        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                            dispatch_async(dispatch_get_main_queue(), ^{
                                
                                CharVC *sself = wself;
                                [sself chatPictureAnimationTips:iv_chat];
                            });
                        });
                        
                        [self next_what_to_do];
                    });

                }withimgBlock:^(id bean) {
                    
                }];
                
                [UIView animateWithDuration:0.3 animations:^{
                
                }];
            }
        }
    }else{
        [bottomScroll removeAllDialog];
    }
}

-(void) notifyBottom{
    [UIView animateWithDuration:0.3 animations:^{
        if (_bottomV.frame.origin.y+_bottomV.frame.size.height>self.view.frame.size.height) {
            _bottomV.frame = CGRectMake(_bottomV.frame.origin.x, _bottomV.frame.origin.y-300, _bottomV.frame.size.width, _bottomV.frame.size.height);
            stateView.transform = CGAffineTransformMakeScale(1, -1);
            
        }else{
            
            _bottomV.frame = CGRectMake(_bottomV.frame.origin.x, _bottomV.frame.origin.y+300, _bottomV.frame.size.width, _bottomV.frame.size.height);
           
            stateView.transform = CGAffineTransformMakeScale(-1, 1);
        }
    }];

}

-(void) toSay{
    [self notifyBottom];
}
- (void)customPeopleDetail:(FriendVO *)peoplevo{
    
    ChatInfoVC *vc = [[ChatInfoVC alloc] init];
    vc.isFrist = [NSNumber numberWithInteger:2];
    vc.chat_people = peoplevo;
    [self.navigationController pushViewController:vc animated:YES];

    
}

-(void) next_what_to_do{
    
//    if (first) {
//        time = 1.0;
//    }
     if (_sourceTexts.count<=_processingTexts.count) {
         time = 1.0;
     }
    NSLog(@"time == %zd",time);
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(time * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        first = FALSE;
        if (_sourceTexts.count>_processingTexts.count ) {
            DialogVO *dvo = [_sourceTexts objectAtIndex:_processingTexts.count];
            dvo.timerStamp = [NSDate currentTimeStamp];
            [DBUtil saveVO:@[dvo]];
                NSString *name = [JTextView formatString:[dvo.subTexts lastObject]];
                if (_message) {
                    _message(@[name,dvo.isAutoMachine]);
                }
                [_processingTexts addObject:dvo];
                [_mainScroll addDialog:dvo andVO:self.people withDic:_sourceWords withshowSendButton:NO withClickBlock:^(id bean) {
                }withimgBlock:^(id bean) {
                    [self customPeopleDetail:self.people];
                }];
                [self add_data_to_bottom];
            

        }else{
            NSLog(@"totalScore == %zd",totalScore);
        
            if (totalScore > 20) {
                DialogVO *successdvo = _resultText[0];
                 [DBUtil saveVO:@[successdvo]];
                [_mainScroll addDialog:successdvo andVO:self.people withDic:_sourceWords withshowSendButton:NO withClickBlock:^(id bean) {
                }withimgBlock:^(id bean) {
                    
                    [self customPeopleDetail:self.people];
                }];
                DialogVO *success = _resultText[1];
                [DBUtil saveVO:@[success]];
               [bottomScroll addDialog:success andVO:self.people withDic:_sourceWords withshowSendButton:YES withClickBlock:^(id bean) {
    
                   if (self.isChatInfo == FALSE) {
                       alert_s = [[UIAlertView alloc] initWithTitle:@"提示" message:@"恭喜你,成功完成聊天" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
                       [alert_s show];
                       
                   }
               } withimgBlock:^(id bean) {
                   
               }];
            }else{
                DialogVO *faildvo = _resultText[2];
                [DBUtil saveVO:@[faildvo]];
                [_mainScroll addDialog:faildvo andVO:self.people withDic:_sourceWords withshowSendButton:NO withClickBlock:^(id bean) {
                }withimgBlock:^(id bean) {
                    [self customPeopleDetail:self.people];
                }];
                DialogVO *fail = _resultText[3];
                [DBUtil saveVO:@[fail]];
                [bottomScroll addDialog:fail andVO:self.people withDic:_sourceWords withshowSendButton:YES withClickBlock:^(id bean) {
                    if (self.isChatInfo == FALSE) {
                        alert_w = [[UIAlertView alloc] initWithTitle:@"提示" message:@"聊天失败" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
                        [alert_w show];
                        [DBUtil deleteVO:[DialogVO class] byDialogID:self.people.user_id subIds:nil];
                        if (_message) {
                            _message(nil);
                        }
                        
                    }
                } withimgBlock:^(id bean) {
                    
                }];
            }
            
            }


    });
    
}
-(void)reset_view
{
    if (_mainScroll) {
        [_mainScroll removeFromSuperview];
    }
    if (_bottomV) {
        [_bottomV removeFromSuperview];
    }
    
}
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (alertView == alert_s) {
        ChatInfoVC *vc = [[ChatInfoVC alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
        self.people.scroes =[NSNumber numberWithInteger:totalScore];
        
        self.people.timerStamp = [NSDate currentTimeStamp];
        [DBUtil saveVO:@[self.people]];
    }else{
        [self.navigationController popViewControllerAnimated:YES];
    }
    NSLog(@"%zd",buttonIndex);
}
//聊天图片动画提示
- (void)chatPictureAnimationTips:(UIImageView *) iv_chat {
    
//    UIImage *img_chat = [UIImage imageNamed:@"xinxing.png"];
//    UIImageView *iv_chat = [[UIImageView alloc] initWithFrame:CGRectMake(self.view.bounds.size.width/2-img_chat.size.width/2, self.view.bounds.size.height-150, img_chat.size.width, img_chat.size.height)];
//    iv_chat.image = img_chat;
//    [self.view addSubview:iv_chat];

    [UIView animateWithDuration:0.1 animations:^{
        //先放大两倍
        iv_chat.transform = CGAffineTransformMakeScale(2.0, 2.0);
        
    }];
    
    [UIView animateWithDuration:0.2 delay:0.2 options:UIViewAnimationOptionCurveLinear animations:^{
        //创建核心动画
        CAKeyframeAnimation *keyAnima = [CAKeyframeAnimation animation];
        
        //告诉系统执行什么动画。
        keyAnima.keyPath = @"transform.rotation";
        
        //(-M_PI_4 /90.0 * 5)表示-30度 。
        keyAnima.values = @[@(-M_PI_4 /90.0 * 20),@(M_PI_4 /90.0 * 20),@(-M_PI_4 /90.0 * 20),@(M_PI_4 /90.0)];
        
        //执行完之后不删除动画
        keyAnima.removedOnCompletion = NO;
        //执行完之后保存最新的状态
        keyAnima.fillMode = kCAFillModeForwards;
        
        //动画执行时间
        keyAnima.duration = 0.1;
        
        //设置重复次数。
        keyAnima.repeatCount = 2;
        
        //添加核心动画
        [iv_chat.layer addAnimation:keyAnima forKey:nil];
        
    } completion:nil];
    
    
    [UIView animateWithDuration:0.5 delay:0.4 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        
        //图片移动
        CGFloat chat_x;
        CGFloat chat_y;
        chat_x = self.view.bounds.size.width - iv_chat.bounds.size.width-60;
        chat_y = 10;
        iv_chat.frame = CGRectMake(chat_x, chat_y, iv_chat.frame.size.width, iv_chat.frame.size.height);
        
        //图片缩小
        iv_chat.transform = CGAffineTransformMakeScale(0.00001, 0.00001);
        
        
    } completion:nil];
    
    
}
- (void)viewDidDisappear:(BOOL)animated{
    if (auplayer) {
        auplayer = nil;
        [auplayer stop];
    }
    if (viewArr.count) {
        [viewArr removeAllObjects];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
