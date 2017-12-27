//
//  ChatData.m
//  
//
//  Created by 123 on 15/11/27.
//
//

#import "ChatData.h"

@implementation ChatData
+ (NSDictionary  *)readchatdatawithSex:(NSNumber *)sex {
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    
    if ([sex integerValue] == 0) {//nan
        
        [dic setValue:@{@"question":@[@"Hi, buddy, would you[24] like to be my partner[16]?",
                                      @"Just a small case, I[26] need you[24] to go to the tailor’s shop and take my clothes[15].",
                                      @"Don’t understimate[3] this task, only clever[46] girl can do it well.",
                                      @"When you[24] arrive at the store , give this letter to the red hair tailor.",
                                      @"I[26] am not kidding[41]. This is a secret mission[21] from the Queen.",
                                      @"Hey buddy, trust[49] me, the less you[24] know, the better.",
                                      @"For your safety, I[26] will drive you[24] there.",
                                      @"Hurry up , time limited[59].",
                                      @"Don’t be neverous[11], do as I[26] say.",
                                      @"I’ll wait for you[24] at the café at the corner.",
                                      @"Come on, partner[16]",
                                      @"Sorry, maybe I[26] need choose[54] another one to help me."],
                        @"answer":@[@{@"0":@[@"Is that means go trough fire and water with you[24]? It must be very dangerous[50],is it?",@1],
                                      @"1":@[@"Sounds so exciting, I[26] am honored[6]!",@2],
                                      @"2":@[@"Can I[26] work together[43] with the Bond girls?",@3]
                                      },
                                    @{@"2":@[@"A strange[44] task.",@1],
                                      @"1":@[@"Just take the clothes[15]?",@2],
                                      @"0":@[@"I[26] am not your housemaid.",@3]
                                      },
                                    @{@"1":@[@"I[26] don’t think[22] you[24] are just compliment me.",@3],
                                      @"0":@[@"So what? you[24] think[22] I[26] may get the wrong clothes[15]?",@1],
                                      @"2":@[@"I[26] know there must be some hiden tasks.",@2]
                                      },
                                    @{@"2":@[@"Oh, red hair. That’s really ugly.",@3],
                                      @"1":@[@"Is that guy on your side?",@2],
                                      @"0":@[@"What if I[26] open the letter?",@1]
                                      },
                                    @{@"1":@[@"Sounds a little bit dangerous[50].",@1],
                                      @"0":@[@"That’s really an important mission[21].",@2],
                                      @"2":@[@"The mission[21] involves the Queen?",@3]
                                      },
                                    @{@"0":@[@"If so, I[26] reject the task.",@1],
                                      @"1":@[@"OK, tell me the address.",@2],
                                      @"2":@[@"Is that your 007 style? Mystical.",@3]
                                      },
                                    @{@"2":@[@"Really? With the Aston Matin?",@1],
                                      @"1":@[@"Then I[26] must fasten my seatbelts since I[26] don’t trust[49] your skill.",@3],
                                      @"0":@[@"Sounds cool, Bond girl’s treatment.",@2]
                                      },
                                    @{@"0":@[@"I[26] am ready, let’s go.",@1],
                                      @"1":@[@"Work with James Bond, interesting.",@2],
                                      @"2":@[@"Don’t order me, I[26] am the one who is helping you[24].",@3]
                                      },
                                    @{@"1":@[@"Frankly speaking, I[26] am a little bit scared.",@1],
                                      @"2":@[@"Don’t be so verbose. I[26] know what to do.",@2],
                                      @"0":@[@"Slow down, you[24] are driving so fast that I[26] can’t think[22].",@3]
                                      },
                                    @{@"1":@[@"OK, deep breath, I[26] am leaving.",@2],
                                      @"0":@[@"Don’t go far away. I[26] am afraid I[26] can’t find you[24].",@1],
                                      @"2":@[@"Buy me a medium latte and wait for me.",@3]
                                      },
                                    @{
                                      @"0":@[@"See you[24] later, partner[16]"],
                                      },
                                    @{
                                      @"0":@[@"Did I[26] do something wrong?"],
                                      }
                                    ]
                       }
               forKey:@"200"];
        [dic setValue:@{@"question":@[@"Hi, I[26] am Max. you[24] haven’t show up in my cake shop for a long time.",
                                      @"All right, I[26] doubt whether you[24] guys think[22] my cakes are not delicious anymore.",
                                      @"Aha, Caroline, she found a new job recently.",
                                      @"Whatever, I[26] promise she won’t do that long.",
                                      @"you[24] know I[26] am always practical. I[26] don’t want to fall myself in daydreaming. Just run a cake shop is enough.",
                                      @"Sometimes I[26] wonder how long I[26] can run this shop.",
                                      @"you[24] honey-lipped guy. Come to my shop, I[26] made some new kinds of cakes.",
                                      @"Calm down, I[26] just want someone be my rat.",
                                      @"The more you[24] try to hide, the more you[24] is exposed. I[26] know you[24] are very happy.",
                                      @"So, can you[24] come today? After having the cake we may go to see a movie together[43]",
                                      @"OK, waiting for you[24]!",
                                      @"Oh, I[26] remember I[26] have a date with Coreline tonight, see you[24] next time."],
                        @"answer":@[@{@"0":@[@"I[26] am so busy recently, almost overwork everyday.",@1],
                                      @"1":@[@"Haven’t get salary for months, I[26] am really too poor to have a cake.",@2],
                                      @"2":@[@"My muscles are disappear and I[26] need lose weight",@3]
                                      },
                                    @{@"2":@[@"Come on, you[24] know you[24] really good at making cakes",@1],
                                      @"1":@[@"Not at all. But I[26] think[22] you[24] need to try something new.",@2],
                                      @"0":@[@"Maybe Caroline would say so because she eats too much cakes",@3]
                                      },
                                    @{@"1":@[@"That is to say she will not work at the cake shop any more?",@1],
                                      @"0":@[@"She is ready to feed herself?",@3],
                                      @"2":@[@"What kind of job? As a saleswoman in a company?",@2]
                                      },
                                    @{@"2":@[@"Why do you[24] say so?",@1],
                                      @"1":@[@"you[24] have the best understanding of her.",@2],
                                      @"0":@[@"you[24] are definitely right.",@3]
                                      },
                                    @{@"1":@[@"you[24] are always the one with no ambitions at all.",@2],
                                      @"0":@[@"But I[26] think[22] marry a golden bachelor is your final dream.",@3],
                                      @"2":@[@"Yes, we all know that the dream is plump but the reality is skinny.",@1]
                                      },
                                    @{@"0":@[@"Me too. I[26] don’t think[22] you[24] can do this for a long time.",@3],
                                      @"1":@[@"The state of the cake shop is not very well?",@2],
                                      @"2":@[@"Don’t kidding[41] me. you[24] can run the shop very well.",@1]
                                      },
                                    @{@"2":@[@"I[26] don’t want to have the dark cooking food.",@3],
                                      @"1":@[@"Really? Can I[26] have that for free?",@1],
                                      @"0":@[@"Wow, I[26] am the one come to your mind first when you[24] make new cakes.",@2]
                                      },
                                    @{@"0":@[@"If you[24] say so, I[26] am afraid to have that kind of try",@1],
                                      @"1":@[@"My pleasure, I[26] will go there someday.",@2],
                                      @"2":@[@"Have you[24] ever seen any rats as handsome as me?",@3]
                                      },
                                    @{@"1":@[@"Did Caroline try that kind of cake?",@1],
                                      @"2":@[@"I[26] will be happier if you[24] give me a life-long discount card.",@2],
                                      @"0":@[@"I[26] am always ready to serve beautiful lady like you[24].",@3]
                                      },
                                    @{@"1":@[@"I[26] have a date already.",@2],
                                      @"0":@[@"you[24] treat me cake ,I[26] treat the movie.",@1],
                                      @"2":@[@"Bonus sounds more attractive. ",@3]
                                      },
                                    @{
                                        @"0":@[@"Just a moment. I[26] will swing by."],
                                        },
                                    @{
                                        @"0":@[@"Well, you[24] really make me down"],
                                        }
                                    ]
                        }
               forKey:@"201"];
        [dic setValue:@{@"question":@[@"Hi, I[26] am Adam Levine, have you[24] heard of our new album",
                                      @"Really? My wife thinks[22] the MVs of the album are all in high quality.",
                                      @"you[24] are right, the one I[26] satisfied the most is Sugar.",
                                      @"Aha, I[26] want to sing now How is the song?",
                                      @"We are busy these days, we plan to find the hero of next MV.",
                                      @"Actually I[26] have been to some cities in China. Like Chengdu, Beijing and Shanghai.",
                                      @"Yes, that’s really deserve the reputation and I[26] want to visit some other cities in China.",
                                      @"We do have the plan to hold a concert in China recently.",
                                      @"Wow, fans like you[24] are always very enthusiasm.",
                                      @"you[24] mean both my gifts and my appearance are accepted by the world?",
                                      @"Thanks for speaking so highly of me. I[26] will sing another song for you[24].",
                                      @"Are you[24] really a fan of me? Let’s just stop the conversation here."],
                        @"answer":@[@{@"0":@[@"No, I[26] am so busy these days.",@1],
                                      @"1":@[@"Of course, I[26] am a determined fan of you[24].",@3],
                                      @"2":@[@"Yes and I[26] think[22] all the songs are great.",@2]
                                      },
                                    @{@"2":@[@"Of course, she must think[22] every song of yours is great",@2],
                                      @"1":@[@"Yes, I[26] agree, that must cost you[24] lots of money.",@1],
                                      @"0":@[@"Good MVs can make the songs to a high level.",@3]
                                      },
                                    @{@"1":@[@"Is that the one your band appears on different wedding ceremonies?",@3],
                                      @"0":@[@"Definitely, I[26] love that MV so much.",@1],
                                      @"2":@[@"Great, I[26] wonder how you[24] think[22] out that idea.",@2]
                                      },
                                    @{@"2":@[@"Can’t believe you[24] sing this song to me.",@2],
                                      @"1":@[@"Just one sentence? I[26] want to hear more",@3],
                                      @"0":@[@"I[26] am going to listen the whole song later.",@1]
                                      },
                                    @{@"1":@[@"That is to say you[24] will have a new song soon?",@1],
                                      @"0":@[@"you[24] can choose[54] your friend Blake Shelton as the hero.",@2],
                                      @"2":@[@"Do you[24] want to choose[54] a Asian man like me?",@3]
                                      },
                                    @{@"0":@[@"Chengdu? you[24] must have the Sichuan hot pot there.",@1],
                                      @"1":@[@"Beijing? How do you[24] think[22] of the environment there?",@2],
                                      @"2":@[@"Shanghai? Did you[24] go to the Oriental Pearl Tower?",@3]
                                      },
                                    @{@"2":@[@"Yes, I[26] think[22] there are many places in China are worth visiting.",@1],
                                      @"1":@[@"Do you[24] have any target cities? How about coming to my city and I[26] will be your guide.",@2],
                                      @"0":@[@"you[24] can hold a concert here in China, that’s really can kill two birds with one stone.",@3]
                                      },
                                    @{@"0":@[@"Really? Which city do you[24] choose[54]?",@1],
                                      @"1":@[@"I[26] hope to see your live concert.",@2],
                                      @"2":@[@"Great, I[26] am sure I[26] will go to your concert",@3]
                                      },
                                    @{@"1":@[@"That’s because I[26] enjoy going to see a concert.",@1],
                                      @"2":@[@"Yes, we all like you[24] and your band.",@2],
                                      @"0":@[@"I[26] can’t refuse to mad on a handsome and gifted man like you[24].",@3]
                                      },
                                    @{@"1":@[@"That’s true.",@2],
                                      @"0":@[@"you[24] just know this now?",@1],
                                      @"2":@[@"Don’t be so narcissism.",@3]
                                      },
                                    @{
                                        @"0":@[@"That really sounds of nature."],
                                        },
                                    @{
                                        @"0":@[@"What’s wrong?"],
                                        }
                                    ]
                        }
               forKey:@"202"];
        
        
        
    }else{//nv
        [dic setValue:@{@"question":@[@"My beautiful lady, would you[24] like to do me a favor[31]?",
                                      @"Just a small case, I[26] need you[24] to go to the tailor’s shop and take my clothes[15].",
                                      @"Don’t understimate[3] this task, only clever[46] girl can do it well.",
                                      @"When you[24] arrive at the store , give this letter to the red hair tailor.",
                                      @"I[26] am not kidding[41]. This is a secret mission[21] from the Queen.",
                                      @"Baby, trust[49] me, the less you[24] know, the better.",
                                      @"For your safety, I[26] will drive you[24] there.",
                                      @"Hurry up , time limited[59].",
                                      @"Don’t be neverous[11], do as I[26] say.",
                                      @"I’ll wait for you[24] at the café at the corner.",
                                      @"Come here, a goodbye kiss",
                                      @"Sorry, maybe I[26] need choose[54] another one to help me."],
                        //1
                        @"answer":@[@{@"0":@[@"What do you[24] want me to do?",@1],
                                      @"1":@[@"I[26] have to check if I[26] am free.",@2],
                                      @"2":@[@"A man like you[24] still need help?",@(3)]
                                      },
                                    //2
                                    @{@"2":@[@"A strange[44] task.",@1],
                                      @"1":@[@"Just take the clothes[15]?",@2],
                                      @"0":@[@"I[26] am not your housemaid.",@(3)]
                                      },
                                    //3
                                    @{@"1":@[@"I[26] don’t think[22] you[24] are just compliment me.",@3],
                                      @"0":@[@"So what? you[24] think[22] I[26] may get the wrong clothes[15]?",@1],
                                      @"2":@[@"I[26] know there must be some hiden tasks.",@2]
                                      },
                                    //4
                                    @{@"2":@[@"Oh, red hair. That’s really ugly.",@3],
                                      @"1":@[@"Is that guy on your side?",@2],
                                      @"0":@[@"What if I[26] open the letter?",@(1)]
                                      },
                                    //5
                                    @{@"1":@[@"Sounds a little bit dangerous[50].",@1],
                                      @"0":@[@"That’s really an important mission[21].",@2],
                                      @"2":@[@"The mission[21] involves the Queen?",@(3)]
                                      },
                                    //6
                                    @{@"0":@[@"If so, I[26] reject the task.",@1],
                                      @"1":@[@"OK, tell me the address.",@2],
                                      @"2":@[@"Is that your 007 style? Mystical.",@(3)]
                                      },
                                    //7
                                    @{@"2":@[@"Really? With the Aston Matin?",@1],
                                      @"1":@[@"Then I[26] must fasten my seatbelts since I[26] don’t trust[49] your skill.",@3],
                                      @"0":@[@"Sounds cool, Bond girl’s treatment.",@2]
                                      },
                                    //8
                                    @{@"0":@[@"I[26] am ready, let’s go.",@1],
                                      @"1":@[@"Work with James Bond, interesting.",@2],
                                      @"2":@[@"Don’t order me, I[26] am the one who is helping you[24].",@(3)]
                                      },
                                    //9
                                    @{@"1":@[@"Frankly speaking, I[26] am a little bit scared.",@1],
                                      @"2":@[@"Don’t be so verbose. I[26] know what to do.",@2],
                                      @"0":@[@"Slow down, you[24] are driving so fast that I[26] can’t think[22].",@(3)]
                                      },
                                    //10
                                    @{@"1":@[@"OK, deep breath, I[26] am leaving.",@2],
                                      @"0":@[@"Don’t go far away. I[26] am afraid I[26] can’t find you[24].",@1],
                                      @"2":@[@"Buy me a medium latte and wait for me.",@(3)]
                                      },
                                    //11
                                    @{@"0":@[@"Waiting for the victory kiss."]
                                      
                                      },
                                    //12
                                    @{@"0":@[@"Did I do something wrong?"]
                                      
                                      }
                                    ]
                        }
               forKey:@"200"];
        
               //第二个
        [dic setValue:@{@"question":@[@"Hi, I[26] am Max. you[24] haven’t show up in my cake shop for a long time",
                                      @"All right, I[26] doubt whether you[24] guys think[22] my cakes are not delicious anymore.",
                                      @"Aha, Caroline, she found a new job recently.",
                                      @"Whatever, I[26] promise she won’t do that long.",
                                      @"you[24] know I[26] am always practical. I[26] don’t want to fall myself in daydreaming. Just run a cake shop is enough.",
                                      @"Sometimes I[26] wonder how long I[26] can run this shop.",
                                      @"you[24] honey-lipped girl Come to my shop, I[26] made some new kinds of cakes.",
                                      @"Calm down, I[26] just want someone be my rat.",
                                      @"The more you[24] try to hide, the more you[24] is exposed. I[26] know you[24] are very happy.",
                                      @"So, can you[24] come today? After having the cake we may go to see a movie together[43].",
                                      @"Oh, I[26] remember I[26] have a date with Coreline tonight, see you[24] next time."],
                        //1
                        @"answer":@[@{@"0":@[@"I[26] am so busy recently, almost overwork everyday.",@1],
                                      @"1":@[@"Haven’t get salary for months, I[26] am really too poor to have a cake.",@2],
                                      @"2":@[@"I[26] am on diet recently.",@(3)]
                                      },
                                    //2
                                    @{@"2":@[@"Come on, you[24] know you[24] really good at making cakes.",@1],
                                      @"1":@[@"Not at all. But I[26] think[22] you[24] need to try something new.",@2],
                                      @"0":@[@"Maybe Caroline would say so because she eats too much cakes.",@(3)]
                                      },
                                    //3
                                    @{@"1":@[@"That is to say she will not work at the cake shop any more?",@3],
                                      @"0":@[@"She is ready to feed herself?",@2],
                                      @"2":@[@"What kind of job? As a saleswoman in a company?",@1]
                                      },
                                    //4
                                    @{@"2":@[@"Why do you[24] say so?",@1],
                                      @"1":@[@"you[24] have the best understanding of her.",@2],
                                      @"0":@[@"you[24] are definitely right.",@3]
                                      },
                                    //5
                                    @{@"1":@[@"you[24] are always the one with no ambitions at all.",@2],
                                      @"0":@[@"But I[26] think[22] marry a golden bachelor is your final dream.",@3],
                                      @"2":@[@"Yes, we all know that the dream is plump but the reality is skinny.",@1]
                                      },
                                    //6
                                    @{@"0":@[@"Me too. I[26] don’t think[22] you[24] can do this for a long time.",@3],
                                      @"1":@[@"The state of the cake shop is not very well?",@2],
                                      @"2":@[@"Don’t kidding[41] me. you[24] can run the shop very well.",@1]
                                      },
                                    //7
                                    @{@"2":@[@"I[26] don’t want to have the dark cooking food.",@3],
                                      @"1":@[@"Really? Can I[26] have that for free?",@1],
                                      @"0":@[@"Wow, I[26] am the one come to your mind first when you[24] make new cakes.",@2]
                                      },
                                    //8
                                    @{@"0":@[@"If you[24] say so, I[26] am afraid to have that kind of try.",@1],
                                      @"1":@[@"My pleasure, I[26] will go there someday.",@2],
                                      @"2":@[@"Have you[24] ever seen any rats as beautiful as me?",@(3)]
                                      },
                                    //9
                                    @{@"1":@[@"Did Caroline try that kind of cake?",@1],
                                      @"2":@[@"I[26] will be happier if you[24] give me a life-long discount card.",@2],
                                      @"0":@[@"I[26] will give up my diet plan for your new cake",@(3)]
                                      },
                                    //10
                                    @{@"1":@[@"I[26] have a date already.",@1],
                                      @"0":@[@"you[24] treat me cake ,I[26] treat the movie.",@2],
                                      @"2":@[@"Bonus sounds more attractive. ",@(3)]
                                      },
                                    //11
                                   
                                    @{@"0":@[ @"Just a moment. I will swing by."]
                                      
                                      },
                                    //12
                                    @{@"0":@[@"Well, you[24] really make me down"]
                                      
                                      }
                                    ]
                        }
               forKey:@"201"];
        
        //第三个
        [dic setValue:@{@"question":@[@"Hi, I[26] am Adam Levine, have you[24] heard of our new album?",
                                      @"Really? My wife thinks[22] the MVs of the album are all in high quality.",
                                      @" you[24] are right, the one I[26] satisfied the most is Sugar.",
                                      @"Aha, I[26] want to sing now How is the song?",
                                      @"We are busy these days, we plan to find the heroine of next MV.",
                                      @"Actually I[26] have been to some cities in China. Like Chengdu, Beijing and Shanghai.",
                                      @"Yes, that’s really deserve the reputation and I[26] want to visit some other cities in China.",
                                      @"We do have the plan to hold a concert in China recently.",
                                      @"Wow, fans like you[24] are always very enthusiasm.",
                                      @"you[24] mean both my gifts and my appearance are accepted by the world?",
                                      @"Thanks for speaking so highly of me. I[26] will sing another song for you[24].",
                                      @"Are you[24] really a fan of me? Let’s just stop the conversation here."
                                      ],
                        //1
                        @"answer":@[@{@"0":@[@"No, I[26] am so busy these days.",@1],
                                      @"1":@[@"Of course, I[26] am a determined fan of you[24].",@3],
                                      @"2":@[@"Yes and I[26] think[22] all the songs are great.",@2]
                                      },
                                    //2
                                    @{@"2":@[@"Of course, she must think[22] every song of yours is great.",@2],
                                      @"1":@[@"Yes, I[26] agree, that must cost you[24] lots of money.",@1],
                                      @"0":@[@"Good MVs can make the songs to a high level.",@3]
                                      },
                                    //3
                                    @{@"1":@[@"Is that the one your band appears on different wedding ceremonies?",@3],
                                      @"0":@[@"Definitely, I[26] love that MV so much.",@1],
                                      @"2":@[@"Great, I[26] wonder how you[24] think[22] out that idea.",@2]
                                      },
                                    //4
                                    @{@"2":@[@"Can’t believe you[24] sing this song to me.",@2],
                                      @"1":@[@"Just one sentence? I[26] want to hear mor.",@3],
                                      @"0":@[@"I[26] am going to listen the whole song later.",@1]
                                      },
                                    //5
                                    @{@"1":@[@"That is to say you[24] will have a new song soon?",@1],
                                      @"0":@[@"you[24] can choose[54] your wife BehatI[26] Prinsloo as the heroine.",@2],
                                      @"2":@[@"Do you[24] want to choose[54] a Chinese girl like me?",@3]
                                      },
                                    //6
                                    @{@"0":@[@"Chengdu? you[24] must have the Sichuan hot pot there.",@1],
                                      @"1":@[@"Beijing? How do you[24] think[22] of the environment there?",@2],
                                      @"2":@[@"Shanghai? Did you[24] go to the Oriental Pearl Tower?",@3]
                                      },
                                    //7
                                    @{@"2":@[@"Yes, I[26] think[22] there are many places in China are worth visiting.",@1],
                                      @"1":@[@"Do you[24] have any target cities? How about coming to my city and I[26] will be your guide.",@2],
                                      @"0":@[@"you[24] can hold a concert here in China, that’s really can kill two birds with one stone.",@3]
                                      },
                                    //8
                                    @{@"0":@[@"Really? Which city do you[24] choose[54]?",@1],
                                      @"1":@[@"I[26] hope to see your live concert.",@2],
                                      @"2":@[@"Great, I[26] am sure I[26] will go to your concert.",@3]
                                      },
                                    //9
                                    @{@"1":@[@"That’s because I[26] enjoy going to see a concert.",@1],
                                      @"2":@[@"Yes, we all like you[24] and your band.",@2],
                                      @"0":@[@"I[26] can’t refuse to mad on a handsome and gifted man like you[24].",@3]
                                      },
                                    //10
                                    @{@"1":@[@"That’s true.",@1],
                                      @"0":@[@"you[24] just know this now?",@2],
                                      @"2":@[@"Don’t be so narcissism.",@3]
                                      },
                                    //11
                                    @{@"0":@[@"That really sounds of nature."]
                                      
                                      },
                                    @{@"0":@[@"What’s wrong?"]
                                        }
                                    
                                    ]
                        }
               forKey:@"202"];

    }
    
    
    //第四个
    [dic setValue:@{@"question":@[@"How do you[24] think[22] of the newest show of DVB?",
                                  @"I[26] was shocked when David Beckham on the stage at end of the show.",
                                  @"Some of the men’s clothes[15] were designing by David.",
                                  @"Now Harper also can match her own clothes[15] when we go out.",
                                  @"Maybe next season I[26] will design some clothes[15] for kids and Harper can be my model.",
                                  @"Actually I[26] think[22] Harper has a better sense of stage than her father.",
                                  @"Harper is not like a 4-year-old girl.",
                                  @"She can sing the songs of mine and dance with the video.",
                                  @"I[26] am wondering who is looking after my daughter now.",
                                  @"I[26] haven’t seen her for 5 days because of the show.",
                                  @"I’d like to invite you[24] to my next show.",
                                  @"you[24] are really boring."
                                  ],
                    //1
                    @"answer":@[@{@"0":@[@"The models are beautiful and the clothes[15] are amazing.",@3],
                                  @"1":@[@"I[26] don’t know much about the design but I[26] think[22] the clothes[15] are beautiful.",@2],
                                  @"2":@[@"Awesome, I[26] can’t wait to buy the clothes[15].",@1]
                                  },
                                //2
                                @{@"2":@[@"you[24] didn’t know David is one of the model?",@1],
                                  @"1":@[@"Seemed that David gave you[24] a surprise.",@2],
                                  @"0":@[@"We all began to scream when he show up.",@3]
                                  },
                                //3
                                @{@"1":@[@"Which style of clothes[15] is designed by him?",@2],
                                  @"0":@[@"I[26] don’t know he can design clothes[15] as well.",@1],
                                  @"2":@[@"That is to say you[24] don’t need any other designers.",@3]
                                  },
                                //4
                                @{@"2":@[@"She has her own idea of wearing clothes[15].",@1],
                                  @"1":@[@"Maybe she need more clothes[15] since then.",@2],
                                  @"0":@[@"Someday she will help you[24] match the clothes[15].",@3]
                                  },
                                //5
                                @{@"1":@[@"Do you[24] really want her to show up in a big stage at such a young age?",@1],
                                  @"0":@[@"I[26] have seen some pictures of Harper and she is really good at posing.",@2],
                                  @"2":@[@"Mother is the designer and daughter is the model, sounds great.",@3]
                                  },
                                //6
                                @{@"0":@[@"you[24] are not satisfied with David’s performance?",@1],
                                  @"1":@[@"That is because her father is not a professional model.",@2],
                                  @"2":@[@"Harper inherited the sense of stage from you[24].",@3]
                                  },
                                //7
                                @{@"2":@[@"you[24] mean she is more mature than other 4-year- old girls?",@1],
                                  @"1":@[@"Sounds you[24] are proud of that.",@2],
                                  @"0":@[@"That is to say there are two elegant ladies in your family. ",@3]
                                  },
                                //8
                                @{@"0":@[@"She is so clever[46].",@1],
                                  @"1":@[@"Did you[24] teach her or she just learnt by herself?",@2],
                                  @"2":@[@"you[24] can sing and dance with her.",@3]
                                  },
                                //9
                                @{@"1":@[@"Of course the babysitter.",@1],
                                  @"2":@[@"Her brothers can look after her.",@2],
                                  @"0":@[@"Maybe she is in the back stage now.",@3]
                                  },
                                //10
                                @{@"1":@[@"That’s really a long time.",@1],
                                  @"0":@[@"you[24] must miss her very much.",@2],
                                  @"2":@[@"Why don’t you[24] go to the backstage and find her?",@3]
                                  },
                                //11
                                @{@"0":@[@"Really? Thank you[24] so much!"]
                                  
                                  },
                                //12
                                @{@"0":@[@"Oh, my heart is broken."]
                                  }
                                
                                ]
                    }
           forKey:@"203"];
    
    
    //第五个
    [dic setValue:@{@"question":@[@"I'm Bear Grylls. I'm gonna show you[24] what it takes to get out alive from some of the most dangerous[50] places on earth. ",
                                  @"My challege to the extremity never ends, expedition is all I[26] have.",
                                  @"Except for adventure[7], my life can not do without my family, My main goal always is to get home to my family safe and in one piece.",
                                  @"One of my favorite things to do is going on adventures[7] with my boys，wherever we go， adventure[7] is what you[24] make of it.",
                                  @"Death passed me by many times,I[26] was very lucky and it taught me a gratitude for life that has never left me.",
                                  @"Never give up, this is what I[26] said constantly.",
                                  @"By the way, have you[24] seen my new program shot in China, how do you[24] feel?",
                                  @"I[26] like China very much, I[26] am honored[6] I[26] have already explored some wild areas in China, they are really challenging!",
                                  @"I[26] hope I[26] can come to China frequently later, and share more survival skills with my fans.",
                                  @"I[26] plan to invite five of my fans to Grand Canyon Colorado as a specil shooting for Man vs . Wild.",
                                  @"Great, it’s a deal!",
                                  @"Sorry, you[24] are not suitable for my adventure[7]."
                                  ],
                    //1
                    @"answer":@[@{@"0":@[@"HI[26] Bear, your performance in the show is really shocking.",@2],
                                  @"1":@[@"Bear, you[24] are the ture man who stands on the top of the food chain.",@3],
                                  @"2":@[@"Sometimes, I[26] feel disgusting when see you[24] eating some “food”. ",@1]
                                  },
                                //2
                                @{@"2":@[@"There must be a lot of danger, don’t you[24] afraid?",@1],
                                  @"1":@[@"Yes, life is full of challege, we must be ready at all times.",@3],
                                  @"0":@[@"I[26] have not encounter extrem environment like that, but I’m not afraid of challenge. ",@2]
                                  },
                                //3
                                @{@"1":@[@"If you[24] encounter any danger, you[24] will throw your family into sorrow.",@1],
                                  @"0":@[@"It’s happy for you[24] to have your wife and sons love you[24] and stand behind you[24]!",@2],
                                  @"2":@[@"Home is always the warmest harbour and family is the best motivation to move forward.",@3]
                                  },
                                //4
                                @{@"2":@[@"Let boys this little go through such experiences, how cruel!",@1],
                                  @"1":@[@"I[26] hope we and our next generations can also as brave as you[24] do.",@3],
                                  @"0":@[@"you[24] have a real different way of teaching your children.",@2]
                                  },
                                //5
                                @{@"1":@[@"I[26] want to challenge deep in my heart, but I[26] am afraid of danger.",@2],
                                  @"0":@[@"Only after you[24] experience hardship, can you[24] feel grateful for your present life.",@3],
                                  @"2":@[@"I[26] have passed death once, so horrible.",@1]
                                  },
                                //6
                                @{@"0":@[@"There is a similar Chinese saying “Where there is a will there is a way.",@3],
                                  @"1":@[@"It’s easier to say than do.",@2],
                                  @"2":@[@"Yes, I’ve heard you[24] say that a lot of times.",@1]
                                  },
                                //7
                                @{@"2":@[@"This is an interesting program, you[24] and the Chinese stars are awesome.",@2],
                                  @"1":@[@"Stars have different abilities and adaptabilities, so I’d rather see the programs which you[24] explored alone.",@1],
                                  @"0":@[@"I[26] see that you[24] lead the team with trust[49] in each other, and teach the others how to survive.",@3]
                                  },
                                //8
                                @{@"0":@[@"Of course. China is so big, it has a lot of places you[24] havn’t been to.",@1],
                                  @"1":@[@"Qinghai-Tibet Plateau and the primeval forest in Yunnan are also suitable places for you[24] to explore.",@3],
                                  @"2":@[@"Really? I[26] havn’t seen them on TV yet, what a pity.",@2]
                                  },
                                //9
                                @{@"1":@[@"I[26] am on of your fans, we will orgnized that properly.",@2],
                                  @"2":@[@"Great, we can stand on the top of the food chain too,Hah hah...",@3],
                                  @"0":@[@"Your Chinese fans are looking forward to that, they will be very happy!",@1]
                                  },
                                //10
                                @{@"1":@[@"Will you[24] invite Chinese fans,like me? Hah hah..",@1],
                                  @"0":@[@"I[26] will be honored[6] if I[26] have the chance to explore with you[24].",@2],
                                  @"2":@[@"I[26] am ready, looking forward to that!",@3]
                                  },
                                //11
                                @{@"0":@[@"Great!"]
                                  
                                  },
                                //12
                                @{@"0":@[@"All right, I[26] will try my best next time."]
                                  }
                                
                                ]
                    }
           forKey:@"204"];
    
    
    //第六个
    [dic setValue:@{@"question":@[@" Today is so cold!",
                                  @"And I[26] hit in the traffic jam for more than an hour.",
                                  @" I[26] just come here to meet some friends.",
                                  @"I[26] just meet them to have a discussion about my next program.",
                                  @"you[24] like the Oprah Winfrey Show?",
                                  @"But I[26] feel bored  after hosting that show for such a long time so I[26] decided to stop the show.",
                                  @"Who do you[24] think[22] should I[26] choose[54] as my next honored[6] guest if I[26] redo the show?",
                                  @"you[24] give me the inspiration, I[26] can invite the president of China and his wife.",
                                  @"If I[26] had the courage, I[26] will ask Peng Liyuan to sing at the show.",
                                  @"I[26] know Peng could speak English well.",
                                  @"you[24] are so humorous. Maybe you[24] will be the honored[6] guest next time",
                                  @"My friends are coming, bye."
                                  ],
                    //1
                    @"answer":@[@{@"0":@[@"Because there was a heavy snow yesterday.",@1],
                                  @"1":@[@"It’s better to stay at home with a cup of hot coffee.",@3],
                                  @"2":@[@"Yes, I[26] am freezing.",@2]
                                  },
                                //2
                                @{@"2":@[@"That’s very normal in the rush hour.",@1],
                                  @"1":@[@"you[24] should have taken subway here.",@2],
                                  @"0":@[@"If you[24] stay in Beijing for a long time you[24] will get used to the traffic jam.",@3]
                                  },
                                //3
                                @{@"1":@[@"you[24] have friends in China?",@1],
                                  @"0":@[@"you[24] drove here by yourself?",@2],
                                  @"2":@[@"There is a very good restaurant, you[24] can have dinner there.",@3]
                                  },
                                //4
                                @{@"2":@[@"Are you[24] going to host a new program?",@1],
                                  @"1":@[@"I[26] still think[22] the Oprah Winfrey Show was your best show.",@3],
                                  @"0":@[@"What kind of program are you[24] going to do?",@2]
                                  },
                                //5
                                @{@"1":@[@"I[26] began to watch it when I[26] was in high school.",@1],
                                  @"0":@[@"I[26] like the style of you[24] when you[24] are on the stage.",@3],
                                  @"2":@[@"I[26] usually pay much attention to the honored[6] guests.",@2]
                                  },
                                //6
                                @{@"0":@[@"I[26] can understand your feeling.",@1],
                                  @"1":@[@"I[26] know you[24] stopped the show in 2006",@2],
                                  @"2":@[@"Don’t you[24] want to do the show again?",@3]
                                  },
                                //7
                                @{@"2":@[@"you[24] can choose[54] the one who never on the shows before.",@1],
                                  @"1":@[@"you[24] can choose[54] an ordinary people.",@2],
                                  @"0":@[@"How about the president XI[26] Jinping?",@3]
                                  },
                                //8
                                @{@"0":@[@"I[26] don’t think[22] they will accept the invitation of yours.",@1],
                                  @"1":@[@"Good idea, what do you[24] want to talk with them?",@2],
                                  @"2":@[@"Wow, what an daring idea.",@3]
                                  },
                                //9
                                @{@"1":@[@"That seems impossible.",@1],
                                  @"2":@[@"She is really good at singing.",@2],
                                  @"0":@[@"Maybe an English song.",@3]
                                  },
                                //10
                                @{@"1":@[@"She gave a speech about education in English.",@1],
                                  @"0":@[@"As a public figure, she has to build her international image.",@2],
                                  @"2":@[@"But I[26] know Obama’s wife can’t speak Chinese.",@3]
                                  },
                                //11
                                @{@"0":@[@"I[26] am sure you[24] won’t regret for your decision."]
                                  
                                  },
                                //12
                                @{@"0":@[@"OK… Bye"]
                                  }
                                
                                ]
                    }
           forKey:@"205"];


    
    return dic;
}
+ (NSDictionary *)chattranslation{
    NSMutableDictionary * _sourceWords = [NSMutableDictionary dictionaryWithCapacity:0];
        [_sourceWords setObject:                      @{
                                                        @"readNo":@16,
                                                        @"word":@"partner",
                                                        @"translation":@"伙伴"
                                                        }
         
                         forKey:@"16"];
        [_sourceWords setObject:                      @{
                                                        @"readNo":@15,
                                                        @"word":@"clothes",
                                                        @"translation":@"衣服"
                                                        }
         
                         forKey:@"15"];
        [_sourceWords setObject:                      @{
                                                        @"readNo":@3,
                                                        @"word":@"understimate",
                                                        @"translation":@"低估"
                                                        }
         
                         forKey:@"3"];
        [_sourceWords setObject:                      @{
                                                        @"readNo":@21,
                                                        @"word":@"mission",
                                                        @"translation":@"使命"
                                                        }
         
                         forKey:@"21"];
        [_sourceWords setObject:                      @{
                                                        @"readNo":@22,
                                                        @"word":@"think",
                                                        @"translation":@"认为"
                                                        }
         
                         forKey:@"22"];
        
        [_sourceWords setObject:                      @{
                                                        @"readNo":@6,
                                                        @"word":@"honored",
                                                        @"translation":@"受尊敬的"
                                                        }
         
                         forKey:@"6"];
        [_sourceWords setObject:                      @{
                                                        @"readNo":@7,
                                                        @"word":@"adventure",
                                                        @"translation":@"冒险"
                                                        }
         
                         forKey:@"7"];
        
        [_sourceWords setObject:                      @{
                                                        @"readNo":@11,
                                                        @"word":@"neverous",
                                                        @"translation":@"神经的"
                                                        }
         
                         forKey:@"11"];
        [_sourceWords setObject:                      @{
                                                        @"readNo":@24,
                                                        @"word":@"you",
                                                        @"translation":@"你"
                                                        }
         
                         forKey:@"24"];
        [_sourceWords setObject:                      @{
                                                        @"readNo":@31,
                                                        @"word":@"favor",
                                                        @"translation":@"喜爱"
                                                        }
         
                         forKey:@"31"];
        [_sourceWords setObject:                      @{
                                                        @"readNo":@46,
                                                        @"word":@"clever",
                                                        @"translation":@"聪明"
                                                        }
         
                         forKey:@"46"];
        [_sourceWords setObject:                      @{
                                                        @"readNo":@41,
                                                        @"word":@"kidding",
                                                        @"translation":@"开玩笑"
                                                        }
         
                         forKey:@"41"];
        [_sourceWords setObject:                      @{
                                                        @"readNo":@49,
                                                        @"word":@"trust",
                                                        @"translation":@"信任"
                                                        }
         
                         forKey:@"49"];
        [_sourceWords setObject:                      @{
                                                        @"readNo":@59,
                                                        @"word":@"limited",
                                                        @"translation":@"有限的"
                                                        }
         
                         forKey:@"59"];
        [_sourceWords setObject:                      @{
                                                        @"readNo":@54,
                                                        @"word":@"choose",
                                                        @"translation":@"选择"
                                                        }
         
                         forKey:@"54"];
        [_sourceWords setObject:                      @{
                                                        @"readNo":@50,
                                                        @"word":@"dangerous",
                                                        @"translation":@"危险"
                                                        }
         
                         forKey:@"50"];
        [_sourceWords setObject:                      @{
                                                        @"readNo":@43,
                                                        @"word":@"together",
                                                        @"translation":@"一起"
                                                        }
         
                         forKey:@"43"];
        [_sourceWords setObject:                      @{
                                                        @"readNo":@44,
                                                        @"word":@"strange",
                                                        @"translation":@"奇怪的"
                                                        }
         
                         forKey:@"44"];
        [_sourceWords setObject:                      @{
                                                        @"readNo":@52,
                                                        @"word":@"spell",
                                                        @"translation":@"拼写"
                                                        }
         
                         forKey:@"52"];
        [_sourceWords setObject:                      @{
                                                        @"readNo":@58,
                                                        @"word":@"free",
                                                        @"translation":@"自由"
                                                        }
         
                         forKey:@"58"];
        [_sourceWords setObject:                      @{
                                                        @"readNo":@29,
                                                        @"word":@"like",
                                                        @"translation":@"喜欢,爱"
                                                        }
         
                         forKey:@"29"];
        [_sourceWords setObject:                      @{
                                                        @"readNo":@70,
                                                        @"word":@"minute",
                                                        @"translation":@"分钟"
                                                        }
         
                         forKey:@"70"];
        
        [_sourceWords setObject:                      @{
                                                        @"readNo":@61,
                                                        @"word":@"very",
                                                        @"translation":@"非常"
                                                        }
         
                         forKey:@"61"];
        [_sourceWords setObject:                      @{
                                                        @"readNo":@26,
                                                        @"word":@"I",
                                                        @"translation":@"我"
                                                        }
         
                         forKey:@"26"];
        [_sourceWords setObject:                      @{
                                                        @"readNo":@2,
                                                        @"word":@"",
                                                        @"translation":@""
                                                        }
         
                         forKey:@"2"];
        [_sourceWords setObject:                      @{
                                                        @"readNo":@4,
                                                        @"word":@"me",
                                                        @"translation":@"我(宾格)"
                                                        }
         
                         forKey:@"4"];
        [_sourceWords setObject:                      @{
                                                        @"readNo":@56,
                                                        @"word":@"are",
                                                        @"translation":@"是"
                                                        }
         
                         forKey:@"56"];
        [_sourceWords setObject:                      @{
                                                        @"readNo":@1,
                                                        @"word":@"can",
                                                        @"translation":@"可以"
                                                        }
         
                         forKey:@"1"];
        [_sourceWords setObject:                      @{
                                                        @"readNo":@95,
                                                        @"word":@"anything",
                                                        @"translation":@"任何事"
                                                        }
         
                         forKey:@"95"];
        [_sourceWords setObject:                      @{
                                                        @"readNo":@78,
                                                        @"word":@"tomorrow",
                                                        @"translation":@"明天"
                                                        }
         
                         forKey:@"78"];
        [_sourceWords setObject:                      @{
                                                        @"readNo":@77,
                                                        @"word":@"Till",
                                                        @"translation":@"直到...为止"
                                                        }
         
                         forKey:@"77"];
        [_sourceWords setObject:                      @{
                                                        @"readNo":@98,
                                                        @"word":@"enough",
                                                        @"translation":@"足够"
                                                        }
         
                         forKey:@"98"];
        [_sourceWords setObject:                      @{
                                                        @"readNo":@79,
                                                        @"word":@"sure",
                                                        @"translation":@"确定"
                                                        }
         
                         forKey:@"79"];
        [_sourceWords setObject:                      @{
                                                        @"readNo":@47,
                                                        @"word":@"that",
                                                        @"translation":@"那个"
                                                        }
         
                         forKey:@"47"];
        [_sourceWords setObject:                      @{
                                                        @"readNo":@5,
                                                        @"word":@"your",
                                                        @"translation":@"你的"
                                                        }
         
                         forKey:@"5"];
        [_sourceWords setObject:                      @{
                                                        @"readNo":@10,
                                                        @"word":@"again",
                                                        @"translation":@"再一次"
                                                        }
         
                         forKey:@"10"];
        [_sourceWords setObject:                      @{
                                                        @"readNo":@53,
                                                        @"word":@"it",
                                                        @"translation":@"它"
                                                        }
         
                         forKey:@"53"];
        [_sourceWords setObject:                      @{
                                                        @"readNo":@20,
                                                        @"word":@"come",
                                                        @"translation":@"回来"
                                                        }
         
                         forKey:@"20"];
        [_sourceWords setObject:                      @{
                                                        @"readNo":@25,
                                                        @"word":@"if",
                                                        @"translation":@"如果"
                                                        }
         
                         forKey:@"25"];
        [_sourceWords setObject:                      @{
                                                        @"readNo":@27,
                                                        @"word":@"too",
                                                        @"translation":@"也"
                                                        }
         
                         forKey:@"27"];
        [_sourceWords setObject:                      @{
                                                        @"readNo":@19,
                                                        @"word":@"to",
                                                        @"translation":@"到"
                                                        }
         
                         forKey:@"19"];
        [_sourceWords setObject:                      @{
                                                        @"readNo":@87,
                                                        @"word":@"ugly",
                                                        @"translation":@"丑陋"
                                                        }
         
                         forKey:@"87"];
        
        
        
    
    
    
    return _sourceWords;
}
@end
