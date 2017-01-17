//
//  UIImage+SSIImage.h
//  mTHOUGHTS
//
//  Copyright (c) 2015 Survey Sampling International, LLC. All rights reserved.
//  Created by Kevin Muldoon on 2/20/15.
//

#import <UIKit/UIKit.h>

@interface UIImage (SSIImage)

+ (UIImage *)imageWithColor:(UIColor *)color;
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;
- (UIImage *)imageByScalingProportionallyToSize:(CGSize)targetSize;

@end
