//
//  UIColor+SSI.m
//  sayso
//
//  Created by Kevin Muldoon on 1/17/17.
//  Copyright © 2017 Survey Sampling International, LLC. All rights reserved.
//

#import "UIColor+SSI.h"

@implementation UIColor (SSI)

/*
 #03A9F4
 **/
+ (UIColor *)blueBurst {
    CGFloat red = 3; CGFloat green = 169; CGFloat blue = 244;
    return [UIColor colorWithRed:red/255.0f green:green/255.0f blue:blue/255.0f alpha:1.0f];
}

+ (UIColor *)blueSplash {
    CGFloat red = 2; CGFloat green = 119; CGFloat blue = 189;
    return [UIColor colorWithRed:red/255.0f green:green/255.0f blue:blue/255.0f alpha:1.0f];
}


/*
 #4FC3F7
 **/
+ (UIColor *)seaFrolic {
    CGFloat red = 79; CGFloat green = 195; CGFloat blue = 247;
    return [UIColor colorWithRed:red/255.0f green:green/255.0f blue:blue/255.0f alpha:1.0f];
}

@end
