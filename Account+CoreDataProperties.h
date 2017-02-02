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

@property (nullable, nonatomic, copy) NSString *email;
@property (nullable, nonatomic, copy) NSString *entityId;
@property (nullable, nonatomic, copy) NSString *locale;
@property (nonatomic) BOOL ableToJoin;
@property (nonatomic) BOOL ableToLogin;
@property (nonatomic) BOOL ableToTakeSurveys;
@property (nonatomic) BOOL ableToClaim;
@property (nullable, nonatomic, copy) NSString *sessionId;
@property (nonatomic) int16_t ability;

@end

NS_ASSUME_NONNULL_END
