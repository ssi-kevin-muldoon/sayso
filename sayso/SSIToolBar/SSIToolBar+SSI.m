//
//  SSIToolBar+SSI.m
//  sayso
//
//  Created by Kevin Muldoon on 1/11/17.
//  Copyright © 2017 Survey Sampling International, LLC. All rights reserved.
//

#import "SSIToolBar+SSI.h"

@interface SSIToolBar ()
@property (nonatomic, strong) NSMutableDictionary * layers;
@end

@implementation SSIToolBar (SSI)

- (void)percentValue:(NSString *)string {
    
    CATextLayer * progressPercent   = self.layers[@"progressPercent"];
    progressPercent.contentsScale   = [[UIScreen mainScreen] scale];
    progressPercent.string          = [NSString stringWithFormat:@"%@\n", string];
    progressPercent.font            = (__bridge CFTypeRef)@"Helvetica-Bold";
    progressPercent.fontSize        = 42;
    progressPercent.alignmentMode   = kCAAlignmentCenter;
    progressPercent.foregroundColor = [UIColor whiteColor].CGColor;
    
}

- (void)close {
    [self addClosedAnimation];
}

@end
