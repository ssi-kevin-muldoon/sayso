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
    
    NSArray *allEntities = [NSManagedObjectModel MR_defaultManagedObjectModel].entities;
    [allEntities enumerateObjectsUsingBlock:^(NSEntityDescription *entityDescription, NSUInteger idx, BOOL *stop) {
        [NSClassFromString([entityDescription managedObjectClassName]) MR_truncateAll];
    }];
}

- (NSArray *)dataSource {
    
    return @[@{SSIActivityPropertyTitleKey:@"How popular are your egg opinions",
               SSIActivityPropertySummaryKey:@"Don't get it scrambled",
               SSIActivityPropertyDetailKey:@"Don't get is scrambled",
               SSIActivityPropertyValueCompleteKey:@1,
               SSIActivityPropertyTypeKey:@0,
               SSIActivityPropertyURLKey:@"www.google.com",
               SSIActivityPropertyValueConsolationKey:@1,
               SSIActivityPropertyValueQGIDKey:@"Foo"
               },
             @{SSIActivityPropertyTitleKey:@"What type of villain are you?",
               SSIActivityPropertySummaryKey:@"Do you really seek world domination?",
               SSIActivityPropertyDetailKey:@"Do you really seek world domination?",
               SSIActivityPropertyValueCompleteKey:@1,
               SSIActivityPropertyTypeKey:@0,
               SSIActivityPropertyURLKey:@"www.google.com",
               SSIActivityPropertyValueConsolationKey:@1,
               SSIActivityPropertyValueQGIDKey:@"Foo"
               },
             @{SSIActivityPropertyTitleKey:@"How many Bruce Willis movies have you seen?",
               SSIActivityPropertySummaryKey:@"Let’s see if you’re a ‘die hard’ Bruce Willis fan.",
               SSIActivityPropertyDetailKey:@"Let’s see if you’re a ‘die hard’ Bruce Willis fan.",
               SSIActivityPropertyValueCompleteKey:@1,
               SSIActivityPropertyTypeKey:@0,
               SSIActivityPropertyURLKey:@"www.google.com",
               SSIActivityPropertyValueConsolationKey:@1,
               SSIActivityPropertyValueQGIDKey:@"Foo"
               },
             @{SSIActivityPropertyTitleKey:@"Which member of the Skywalker family are you?",
               SSIActivityPropertySummaryKey:@"Time to find out",
               SSIActivityPropertyDetailKey:@"Time to find out",
               SSIActivityPropertyValueCompleteKey:@1,
               SSIActivityPropertyTypeKey:@0,
               SSIActivityPropertyURLKey:@"www.google.com",
               SSIActivityPropertyValueConsolationKey:@1,
               SSIActivityPropertyValueQGIDKey:@"Foo"
               },
             @{SSIActivityPropertyTitleKey:@"Which DreamWorks movie are you based on your Disney opinions?",
               SSIActivityPropertySummaryKey:@"Hey now! You’re a rockstar!",
               SSIActivityPropertyDetailKey:@"Hey now! You’re a rockstar!",
               SSIActivityPropertyValueCompleteKey:@1,
               SSIActivityPropertyTypeKey:@0,
               SSIActivityPropertyURLKey:@"www.google.com",
               SSIActivityPropertyValueConsolationKey:@1,
               SSIActivityPropertyValueQGIDKey:@"Foo"
               },
             @{SSIActivityPropertyTitleKey:@"Do you know the plurals for these random words?",
               SSIActivityPropertySummaryKey:@"Passersby or passerbys?",
               SSIActivityPropertyDetailKey:@"Passersby or passerbys?",
               SSIActivityPropertyValueCompleteKey:@1,
               SSIActivityPropertyTypeKey:@0,
               SSIActivityPropertyURLKey:@"www.google.com",
               SSIActivityPropertyValueConsolationKey:@1,
               SSIActivityPropertyValueQGIDKey:@"Foo"
               },
             @{SSIActivityPropertyTitleKey:@"Which “Rogue One” character are you?",
               SSIActivityPropertySummaryKey:@"Are you one with the force? Is the force with you? Let’s find out.",
               SSIActivityPropertyDetailKey:@"Are you one with the force? Is the force with you? Let’s find out.",
               SSIActivityPropertyValueCompleteKey:@1,
               SSIActivityPropertyTypeKey:@0,
               SSIActivityPropertyURLKey:@"www.google.com",
               SSIActivityPropertyValueConsolationKey:@1,
               SSIActivityPropertyValueQGIDKey:@"Foo"
               },
             @{SSIActivityPropertyTitleKey:@"You can only be a woman if you pass this test",
               SSIActivityPropertySummaryKey:@"For real though.",
               SSIActivityPropertyDetailKey:@"For real though.",
               SSIActivityPropertyValueCompleteKey:@1,
               SSIActivityPropertyTypeKey:@0,
               SSIActivityPropertyURLKey:@"www.google.com",
               SSIActivityPropertyValueConsolationKey:@1,
               SSIActivityPropertyValueQGIDKey:@"Foo"
               },
             @{SSIActivityPropertyTitleKey:@"You’re only allowed one: Puppies or pizza?",
               SSIActivityPropertySummaryKey:@"Sorry for doing this..again.",
               SSIActivityPropertyDetailKey:@"Sorry for doing this..again.",
               SSIActivityPropertyValueCompleteKey:@1,
               SSIActivityPropertyTypeKey:@0,
               SSIActivityPropertyURLKey:@"www.google.com",
               SSIActivityPropertyValueConsolationKey:@1,
               SSIActivityPropertyValueQGIDKey:@"Foo"
               },
             @{SSIActivityPropertyTitleKey:@"Can we guess what kind of beer you like?",
               SSIActivityPropertySummaryKey:@"Are you a hops hipster or a real ale fan?",
               SSIActivityPropertyDetailKey:@"Are you a hops hipster or a real ale fan?",
               SSIActivityPropertyValueCompleteKey:@1,
               SSIActivityPropertyTypeKey:@0,
               SSIActivityPropertyURLKey:@"www.google.com",
               SSIActivityPropertyValueConsolationKey:@1,
               SSIActivityPropertyValueQGIDKey:@"Foo"
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
