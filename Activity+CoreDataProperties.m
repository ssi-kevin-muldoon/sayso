//
//  Activity+CoreDataProperties.m
//  
//
//  Created by Kevin Muldoon on 1/23/17.
//
//  This file was automatically generated and should not be edited.
//

#import "Activity+CoreDataProperties.h"

@implementation Activity (CoreDataProperties)

+ (NSFetchRequest<Activity *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Activity"];
}

@dynamic title;
@dynamic summery;
@dynamic detail;
@dynamic valueComplete;
@dynamic type;
@dynamic url;
@dynamic deferred;
@dynamic valueConsolation;
@dynamic qgid;
@dynamic index;

@end
