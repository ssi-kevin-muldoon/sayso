//
//  Activity+CoreDataProperties.m
//  
//
//  Created by Kevin Muldoon on 1/24/17.
//
//  This file was automatically generated and should not be edited.
//

#import "Activity+CoreDataProperties.h"

@implementation Activity (CoreDataProperties)

+ (NSFetchRequest<Activity *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Activity"];
}

@dynamic deferred;
@dynamic detail;
@dynamic index;
@dynamic qgid;
@dynamic summery;
@dynamic title;
@dynamic type;
@dynamic url;
@dynamic valueComplete;
@dynamic valueConsolation;

@end
