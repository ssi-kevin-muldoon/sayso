//
//  SSIRegistrationAbilitiesAnimation.h
//
//  Code generated using QuartzCode 1.55.0 on 1/17/17.
//  www.quartzcodeapp.com
//

#import <UIKit/UIKit.h>
#import "SSIQuartzCodeAnimationProtocol.h"

IB_DESIGNABLE
@interface SSIRegistrationAbilitiesAnimation : UIView <SSIQuartzCodeAnimationProtocol>



- (void)addViewDidAppearAnimation;
- (void)addViewDidAppearAnimationCompletionBlock:(void (^)(BOOL finished))completionBlock;
- (void)removeAnimationsForAnimationId:(NSString *)identifier;
- (void)removeAllAnimations;

@end
