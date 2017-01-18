//
//  SSIToolBar.h
//
//  Code generated using QuartzCode 1.55.0 on 1/12/17.
//  www.quartzcodeapp.com
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE
@interface SSIToolBar : UIView

@property (nonatomic, strong) UIColor * color;
@property (nonatomic, strong) UIColor * color1;
@property (nonatomic, strong) UIColor * lightBlue;
@property (nonatomic, strong) UIColor * blue;
@property (nonatomic, assign) CGFloat  ToggleAnimProgress;

- (void)addRevealAnimation;
- (void)addRevealAnimationCompletionBlock:(void (^)(BOOL finished))completionBlock;
- (void)addRevealAnimationReverse:(BOOL)reverseAnimation totalDuration:(CFTimeInterval)totalDuration endTime:(CFTimeInterval)endTime completionBlock:(void (^)(BOOL finished))completionBlock;
- (void)addDismissAnimation;
- (void)addDismissAnimationCompletionBlock:(void (^)(BOOL finished))completionBlock;
- (void)addDismissAnimationReverse:(BOOL)reverseAnimation totalDuration:(CFTimeInterval)totalDuration endTime:(CFTimeInterval)endTime completionBlock:(void (^)(BOOL finished))completionBlock;
- (void)addClosedAnimation;
- (void)addClosedAnimationCompletionBlock:(void (^)(BOOL finished))completionBlock;
- (void)addToggleAnimation;
- (void)addToggleAnimationCompletionBlock:(void (^)(BOOL finished))completionBlock;
- (void)addToggleAnimationReverse:(BOOL)reverseAnimation totalDuration:(CFTimeInterval)totalDuration endTime:(CFTimeInterval)endTime completionBlock:(void (^)(BOOL finished))completionBlock;
- (void)removeAnimationsForAnimationId:(NSString *)identifier;
- (void)removeAllAnimations;

@end
