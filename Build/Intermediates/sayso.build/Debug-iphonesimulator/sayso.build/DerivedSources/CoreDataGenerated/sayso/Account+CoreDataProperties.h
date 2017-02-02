//
//  Account+CoreDataProperties.h
//  
//
//  Created by Kevin Muldoon on 2/2/17.
//
//  This file was automatically generated and should not be edited.
//

#import "Account+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Account (CoreDataProperties)

+ (NSFetchRequest<Account *> *)fetchRequest;

@property (nonatomic) int16_t ability;
@property (nonatomic) BOOL ableToClaim;
@property (nonatomic) BOOL ableToJoin;
@property (nonatomic) BOOL ableToLogin;
@property (nonatomic) BOOL ableToTakeSurveys;
@property (nullable, nonatomic, copy) NSString *email;
@property (nullable, nonatomic, copy) NSString *entityId;
@property (nullable, nonatomic, copy) NSString *locale;
@property (nullable, nonatomic, copy) NSString *sessionId;

@end

NS_ASSUME_NONNULL_END
