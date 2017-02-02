//
//  SSIActivityFactory.m
//  sayso
//
//  Created by Kevin Muldoon on 1/23/17.
//  Copyright © 2017 Survey Sampling International, LLC. All rights reserved.
//

#import "SSIActivityFactory.h"
#import "Activity+CoreDataProperties.h"
#import <MagicalRecord/MagicalRecord.h>


static NSString *SSIActivityPropertyTitleKey = @"title";
static NSString *SSIActivityPropertySummaryKey = @"summery";
static NSString *SSIActivityPropertyDetailKey = @"detail";
static NSString *SSIActivityPropertyValueCompleteKey = @"valueComplete";
static NSString *SSIActivityPropertyTypeKey = @"type";
static NSString *SSIActivityPropertyURLKey = @"url";
static NSString *SSIActivityPropertyValueConsolationKey = @"valueConsolation";
static NSString *SSIActivityPropertyValueQGIDKey = @"qgid";
static NSString *SSIActivityPropertyValueVisibleKey = @"visible";

@implementation SSIActivityFactory

- (instancetype)init {
    self = [super init];
    if (self) {
        
        [self deleteAll];
        
        NSManagedObjectContext *context = [NSManagedObjectContext MR_defaultContext];
        
        for (NSDictionary *response in [self dataSource] ) {
            [self createActivity:response];
        }
        
        [context MR_saveToPersistentStoreAndWait];
        NSLog(@"%@", [Activity MR_findAll]);
        
    }
    return self;
}

- (void)deleteAll {
    
    [Activity MR_truncateAll];

//    NSArray *allEntities = [NSManagedObjectModel MR_defaultManagedObjectModel].entities;
//    [allEntities enumerateObjectsUsingBlock:^(NSEntityDescription *entityDescription, NSUInteger idx, BOOL *stop) {
//        [NSClassFromString([entityDescription managedObjectClassName]) MR_truncateAll];
//    }];
}

- (NSArray *)dataSource {
    
    return @[@{SSIActivityPropertyTitleKey:@"How popular are your egg opinions",
               SSIActivityPropertySummaryKey:@"Don't get it scrambled",
               SSIActivityPropertyDetailKey:@"Don't get is scrambled",
               SSIActivityPropertyValueCompleteKey:@1,
               SSIActivityPropertyTypeKey:@0,
               SSIActivityPropertyURLKey:@"https://www.buzzfeed.com/ahmedaliakbar/how-trash-are-your-egg-opinions?utm_term=.ynYolJ9by#.ktBLEn6zb",
               SSIActivityPropertyValueConsolationKey:@1,
               SSIActivityPropertyValueQGIDKey:@"Foo",
               SSIActivityPropertyValueVisibleKey:@1
               },
             @{SSIActivityPropertyTitleKey:@"What type of villain are you?",
               SSIActivityPropertySummaryKey:@"Do you really seek world domination?",
               SSIActivityPropertyDetailKey:@"Do you really seek world domination?",
               SSIActivityPropertyValueCompleteKey:@1,
               SSIActivityPropertyTypeKey:@0,
               SSIActivityPropertyURLKey:@"https://www.buzzfeed.com/hattiesoykan/what-kind-of-villain-are-you?utm_term=.doGQP8LMw#.oc4dovpxm",
               SSIActivityPropertyValueConsolationKey:@1,
               SSIActivityPropertyValueQGIDKey:@"Foo",
               SSIActivityPropertyValueVisibleKey:@1
               },
             @{SSIActivityPropertyTitleKey:@"How many Bruce Willis movies have you seen?",
               SSIActivityPropertySummaryKey:@"Let’s see if you’re a ‘die hard’ Bruce Willis fan.",
               SSIActivityPropertyDetailKey:@"Let’s see if you’re a ‘die hard’ Bruce Willis fan.",
               SSIActivityPropertyValueCompleteKey:@1,
               SSIActivityPropertyTypeKey:@0,
               SSIActivityPropertyURLKey:@"https://www.buzzfeed.com/allsnrjs/how-many-bruce-willis-films-have-you-seen-zvgd?utm_term=.ux6ZENjOD#.mbdDLbqmW",
               SSIActivityPropertyValueConsolationKey:@1,
               SSIActivityPropertyValueQGIDKey:@"Foo",
               SSIActivityPropertyValueVisibleKey:@1
               },
             @{SSIActivityPropertyTitleKey:@"Which member of the Skywalker family are you?",
               SSIActivityPropertySummaryKey:@"Time to find out",
               SSIActivityPropertyDetailKey:@"Time to find out",
               SSIActivityPropertyValueCompleteKey:@1,
               SSIActivityPropertyTypeKey:@0,
               SSIActivityPropertyURLKey:@"https://www.buzzfeed.com/greygryffindor/which-skywalker-are-you-2qwq4?utm_term=.uir3K82Ly#.ttxvJRm5B",
               SSIActivityPropertyValueConsolationKey:@1,
               SSIActivityPropertyValueQGIDKey:@"Foo",
               SSIActivityPropertyValueVisibleKey:@1
               },
             @{SSIActivityPropertyTitleKey:@"Which DreamWorks movie are you based on your Disney opinions?",
               SSIActivityPropertySummaryKey:@"Hey now! You’re a rockstar!",
               SSIActivityPropertyDetailKey:@"Hey now! You’re a rockstar!",
               SSIActivityPropertyValueCompleteKey:@1,
               SSIActivityPropertyTypeKey:@0,
               SSIActivityPropertyURLKey:@"https://www.buzzfeed.com/basicdisney/we-know-which-dreamworks-movie-you-are-based-on-yo-1ap2x?utm_term=.lfpNaJm4y#.aypOo7XKN",
               SSIActivityPropertyValueConsolationKey:@1,
               SSIActivityPropertyValueQGIDKey:@"Foo",
               SSIActivityPropertyValueVisibleKey:@1
               },
             @{SSIActivityPropertyTitleKey:@"Do you know the plurals for these random words?",
               SSIActivityPropertySummaryKey:@"Passersby or passerbys?",
               SSIActivityPropertyDetailKey:@"Passersby or passerbys?",
               SSIActivityPropertyValueCompleteKey:@1,
               SSIActivityPropertyTypeKey:@0,
               SSIActivityPropertyURLKey:@"https://www.buzzfeed.com/sarahaspler/do-you-know-the-plurals-for-these-random-words?utm_term=.cxdVxQp5W#.rmZ3OXj1n",
               SSIActivityPropertyValueConsolationKey:@1,
               SSIActivityPropertyValueQGIDKey:@"Foo",
               SSIActivityPropertyValueVisibleKey:@1
               },
             @{SSIActivityPropertyTitleKey:@"Which “Rogue One” character are you?",
               SSIActivityPropertySummaryKey:@"Are you one with the force? Is the force with you? Let’s find out.",
               SSIActivityPropertyDetailKey:@"Are you one with the force? Is the force with you? Let’s find out.",
               SSIActivityPropertyValueCompleteKey:@1,
               SSIActivityPropertyTypeKey:@0,
               SSIActivityPropertyURLKey:@"https://www.buzzfeed.com/perpetua/which-rogue-one-character-are-you?utm_term=.vrLLyOazx#.gh9dQVEkj",
               SSIActivityPropertyValueConsolationKey:@1,
               SSIActivityPropertyValueQGIDKey:@"Foo",
               SSIActivityPropertyValueVisibleKey:@1
               },
             @{SSIActivityPropertyTitleKey:@"You can only be a woman if you pass this test",
               SSIActivityPropertySummaryKey:@"For real though.",
               SSIActivityPropertyDetailKey:@"For real though.",
               SSIActivityPropertyValueCompleteKey:@1,
               SSIActivityPropertyTypeKey:@0,
               SSIActivityPropertyURLKey:@"https://www.buzzfeed.com/lorynbrantz/this-one-question-will-determine-if-youre-a-woman-or-not?utm_term=.ql929pjyd#.fgK2qaW83",
               SSIActivityPropertyValueConsolationKey:@1,
               SSIActivityPropertyValueQGIDKey:@"Foo",
               SSIActivityPropertyValueVisibleKey:@1
               },
             @{SSIActivityPropertyTitleKey:@"You’re only allowed one: Puppies or pizza?",
               SSIActivityPropertySummaryKey:@"Sorry for doing this..again.",
               SSIActivityPropertyDetailKey:@"Sorry for doing this..again.",
               SSIActivityPropertyValueCompleteKey:@1,
               SSIActivityPropertyTypeKey:@0,
               SSIActivityPropertyURLKey:@"https://www.buzzfeed.com/remeepatel/youre-only-allowed-one-puppies-or-pizza?utm_term=.ggAbK9GPD#.igAJd32yY",
               SSIActivityPropertyValueConsolationKey:@1,
               SSIActivityPropertyValueQGIDKey:@"Foo",
               SSIActivityPropertyValueVisibleKey:@1
               },
             @{SSIActivityPropertyTitleKey:@"Can we guess what kind of beer you like?",
               SSIActivityPropertySummaryKey:@"Are you a hops hipster or a real ale fan?",
               SSIActivityPropertyDetailKey:@"Are you a hops hipster or a real ale fan?",
               SSIActivityPropertyValueCompleteKey:@1,
               SSIActivityPropertyTypeKey:@0,
               SSIActivityPropertyURLKey:@"https://www.buzzfeed.com/ailbhemalone/quizup-in-a-brewery?utm_term=.ll4yapDZ5#.qoBOEBnAv",
               SSIActivityPropertyValueConsolationKey:@1,
               SSIActivityPropertyValueQGIDKey:@"Foo",
               SSIActivityPropertyValueVisibleKey:@0               },
             @{SSIActivityPropertyTitleKey:@"Car shopping?",
               SSIActivityPropertySummaryKey:@"We want to know how you’re deciding your next automobile purchase.",
               SSIActivityPropertyDetailKey:@"We want to know how you’re deciding your next automobile purchase.",
               SSIActivityPropertyValueCompleteKey:@5000,
               SSIActivityPropertyTypeKey:@1,
               SSIActivityPropertyURLKey:@"https://www.google.com/",
               SSIActivityPropertyValueConsolationKey:@1,
               SSIActivityPropertyValueQGIDKey:@"Foo",
               SSIActivityPropertyValueVisibleKey:@0
               }
             ];
}

- (Activity *)createActivity:(NSDictionary *)response {
    
    Activity *activity = [Activity MR_createEntity];
    [activity setTitle:response[SSIActivityPropertyTitleKey]];
    [activity setSummery:response[SSIActivityPropertySummaryKey]];
    [activity setDetail:response[SSIActivityPropertyDetailKey]];
    [activity setValueComplete:[response[SSIActivityPropertyValueCompleteKey] integerValue]];
    [activity setType: [response[SSIActivityPropertyTypeKey] integerValue] ];
    [activity setUrl:response[SSIActivityPropertyURLKey]];
    [activity setValueConsolation:[response[SSIActivityPropertyValueConsolationKey] integerValue]];
    [activity setQgid:response[SSIActivityPropertyValueQGIDKey]];
    
    return activity;
    
}

@end
