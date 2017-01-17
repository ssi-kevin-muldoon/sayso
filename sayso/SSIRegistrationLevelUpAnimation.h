//
//  SSIRegistrationLevelUpAnimation.h
//
//  Code generated using QuartzCode 1.55.0 on 1/17/17.
//  www.quartzcodeapp.com
//

#import <UIKit/UIKit.h>
#import "SSIQuartzCodeAnimationProtocol.h"

IB_DESIGNABLE
@interface SSIRegistrationLevelUpAnimation : UIView <SSIQuartzCodeAnimationProtocol>

@property (nonatomic, strong) UIColor * color;
@property (nonatomic, strong) UIColor * color1;
@property (nonatomic, strong) UIColor * lightBlue;
@property (nonatomic, strong) UIColor * blue;

- (void)addViewDidAppearAnimation;
- (void)addViewDidAppearAnimationCompletionBlock:(void (^)(BOOL finished))completionBlock;
- (void)removeAnimationsForAnimationId:(NSString *)identifier;
- (void)removeAllAnimations;

@end
