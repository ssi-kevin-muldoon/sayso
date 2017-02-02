//
//  Account+CoreDataProperties.m
//  
//
//  Created by Kevin Muldoon on 2/2/17.
//
//  This file was automatically generated and should not be edited.
//

#import "Account+CoreDataProperties.h"

@implementation Account (CoreDataProperties)

+ (NSFetchRequest<Account *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Account"];
}

@dynamic ability;
@dynamic ableToClaim;
@dynamic ableToJoin;
@dynamic ableToLogin;
@dynamic ableToTakeSurveys;
@dynamic email;
@dynamic entityId;
@dynamic locale;
@dynamic sessionId;

@end
