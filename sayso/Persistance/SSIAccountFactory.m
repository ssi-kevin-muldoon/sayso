//
//  SSIAccountFactory.m
//  sayso
//
//  Created by Kevin Muldoon on 2/2/17.
//  Copyright © 2017 Survey Sampling International, LLC. All rights reserved.
//

#import "SSIAccountFactory.h"
#import "Account+CoreDataProperties.h"
#import <MagicalRecord/MagicalRecord.h>

@implementation SSIAccountFactory

- (instancetype)init {
    self = [super init];
    if (self) {
        
        [self deleteAll];
        
        NSManagedObjectContext *context = [NSManagedObjectContext MR_defaultContext];

        Account *account = [Account MR_createEntity];
        
        account.email = @"";
        account.entityId = @"";
        account.locale = @"";
        account.ableToJoin = NO;
        account.ableToLogin = NO;
        account.ableToTakeSurveys = NO;
        account.ableToClaim = NO;
        account.sessionId = @"";
        account.ability = 0;
        
        [context MR_saveToPersistentStoreAndWait];
        
        NSLog(@"%@", [Account MR_findAll]);
        
    }
    return self;
}

- (void)deleteAll {
    
    [Account MR_truncateAll];

}

@end
