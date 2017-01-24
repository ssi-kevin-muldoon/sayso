//
//  Activity+CoreDataProperties.h
//  
//
//  Created by Kevin Muldoon on 1/23/17.
//
//  This file was automatically generated and should not be edited.
//

#import "Activity+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Activity (CoreDataProperties)

+ (NSFetchRequest<Activity *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *title;
@property (nullable, nonatomic, copy) NSString *summery;
@property (nullable, nonatomic, copy) NSString *detail;
@property (nonatomic) int16_t valueComplete;
@property (nonatomic) int16_t type;
@property (nullable, nonatomic, copy) NSString *url;
@property (nonatomic) BOOL deferred;
@property (nonatomic) int16_t valueConsolation;
@property (nullable, nonatomic, copy) NSString *qgid;
@property (nonatomic) int16_t index;

@end

NS_ASSUME_NONNULL_END
