//
//  SSIRegistrationSocialAnimation.m
//
//  Code generated using QuartzCode 1.55.0 on 1/17/17.
//  www.quartzcodeapp.com
//

#import "SSIRegistrationSocialAnimation.h"
#import "QCMethod.h"

@interface SSIRegistrationSocialAnimation ()

@property (nonatomic, assign) BOOL  updateLayerValueForCompletedAnimation;
@property (nonatomic, strong) NSMapTable * completionBlocks;
@property (nonatomic, strong) NSMutableDictionary * layers;


@end

@implementation SSIRegistrationSocialAnimation

#pragma mark - Life Cycle

- (instancetype)initWithFrame:(CGRect)frame
{
	self = [super initWithFrame:frame];
	if (self) {
		[self setupProperties];
		[self setupLayers];
	}
	return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
	self = [super initWithCoder:coder];
	if (self) {
		[self setupProperties];
		[self setupLayers];
	}
	return self;
}



- (void)setupProperties{
	self.completionBlocks = [NSMapTable mapTableWithKeyOptions:NSPointerFunctionsOpaqueMemory valueOptions:NSPointerFunctionsStrongMemory];;
	self.layers = [NSMutableDictionary dictionary];
	
}

- (void)setupLayers{
	CALayer * aLayer = [CALayer layer];
	aLayer.frame = CGRectMake(0, 100, 100, 100);
	[self.layer addSublayer:aLayer];
	self.layers[@"aLayer"] = aLayer;
	{
		CAShapeLayer * share = [CAShapeLayer layer];
		share.frame = CGRectMake(17.9, 20.4, 64.2, 59.2);
		share.path = [self sharePath].CGPath;
		[aLayer addSublayer:share];
		self.layers[@"share"] = share;
	}
	
	
	[self resetLayerPropertiesForLayerIdentifiers:nil];
}

- (void)resetLayerPropertiesForLayerIdentifiers:(NSArray *)layerIds{
	[CATransaction begin];
	[CATransaction setDisableActions:YES];
	
	if(!layerIds || [layerIds containsObject:@"aLayer"]){
		CALayer * aLayer = self.layers[@"aLayer"];
		aLayer.backgroundColor = [UIColor colorWithRed:0.522 green: 0.749 blue:1 alpha:0].CGColor;
	}
	if(!layerIds || [layerIds containsObject:@"share"]){
		CAShapeLayer * share = self.layers[@"share"];
		share.fillColor   = nil;
		share.strokeColor = [UIColor whiteColor].CGColor;
		share.lineWidth   = 2.5;
	}
	
	[CATransaction commit];
}

#pragma mark - Animation Setup

- (void)addViewDidAppearAnimation{
	[self addViewDidAppearAnimationCompletionBlock:nil];
}

- (void)addViewDidAppearAnimationCompletionBlock:(void (^)(BOOL finished))completionBlock{
	if (completionBlock){
		CABasicAnimation * completionAnim = [CABasicAnimation animationWithKeyPath:@"completionAnim"];;
		completionAnim.duration = 1.5;
		completionAnim.delegate = self;
		[completionAnim setValue:@"viewDidAppear" forKey:@"animId"];
		[completionAnim setValue:@(NO) forKey:@"needEndAnim"];
		[self.layer addAnimation:completionAnim forKey:@"viewDidAppear"];
		[self.completionBlocks setObject:completionBlock forKey:[self.layer animationForKey:@"viewDidAppear"]];
	}
	
	NSString * fillMode = kCAFillModeForwards;
	
	////ALayer animation
	CAKeyframeAnimation * aLayerPositionAnim = [CAKeyframeAnimation animationWithKeyPath:@"position"];
	aLayerPositionAnim.values         = @[[NSValue valueWithCGPoint:CGPointMake(50, 150)], [NSValue valueWithCGPoint:CGPointMake(50, 50)], [NSValue valueWithCGPoint:CGPointMake(50, 50)], [NSValue valueWithCGPoint:CGPointMake(50, 45)], [NSValue valueWithCGPoint:CGPointMake(50, 55)], [NSValue valueWithCGPoint:CGPointMake(50, 50)]];
	aLayerPositionAnim.keyTimes       = @[@0, @0.228, @0.616, @0.785, @0.884, @1];
	aLayerPositionAnim.duration       = 1.5;
	aLayerPositionAnim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
	
	CAAnimationGroup * aLayerViewDidAppearAnim = [QCMethod groupAnimations:@[aLayerPositionAnim] fillMode:fillMode];
	[self.layers[@"aLayer"] addAnimation:aLayerViewDidAppearAnim forKey:@"aLayerViewDidAppearAnim"];
}

#pragma mark - Animation Cleanup

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
	void (^completionBlock)(BOOL) = [self.completionBlocks objectForKey:anim];;
	if (completionBlock){
		[self.completionBlocks removeObjectForKey:anim];
		if ((flag && self.updateLayerValueForCompletedAnimation) || [[anim valueForKey:@"needEndAnim"] boolValue]){
			[self updateLayerValuesForAnimationId:[anim valueForKey:@"animId"]];
			[self removeAnimationsForAnimationId:[anim valueForKey:@"animId"]];
		}
		completionBlock(flag);
	}
}

- (void)updateLayerValuesForAnimationId:(NSString *)identifier{
	if([identifier isEqualToString:@"viewDidAppear"]){
		[QCMethod updateValueFromPresentationLayerForAnimation:[self.layers[@"aLayer"] animationForKey:@"aLayerViewDidAppearAnim"] theLayer:self.layers[@"aLayer"]];
	}
}

- (void)removeAnimationsForAnimationId:(NSString *)identifier{
	if([identifier isEqualToString:@"viewDidAppear"]){
		[self.layers[@"aLayer"] removeAnimationForKey:@"aLayerViewDidAppearAnim"];
	}
}

- (void)removeAllAnimations{
	[self.layers enumerateKeysAndObjectsUsingBlock:^(id key, CALayer *layer, BOOL *stop) {
		[layer removeAllAnimations];
	}];
}

#pragma mark - Bezier Path

- (UIBezierPath*)sharePath{
	UIBezierPath *sharePath = [UIBezierPath bezierPath];
	[sharePath moveToPoint:CGPointMake(64.2, 26)];
	[sharePath addCurveToPoint:CGPointMake(32.1, 0) controlPoint1:CGPointMake(64.2, 11.7) controlPoint2:CGPointMake(49.8, 0)];
	[sharePath addCurveToPoint:CGPointMake(0, 26) controlPoint1:CGPointMake(14.4, 0) controlPoint2:CGPointMake(0, 11.6)];
	[sharePath addCurveToPoint:CGPointMake(32.1, 52) controlPoint1:CGPointMake(0, 40.3) controlPoint2:CGPointMake(14.4, 52)];
	[sharePath addCurveToPoint:CGPointMake(47.8, 48.7) controlPoint1:CGPointMake(37.8, 52) controlPoint2:CGPointMake(43.2, 50.8)];
	[sharePath addCurveToPoint:CGPointMake(46.1, 59.2) controlPoint1:CGPointMake(48.7, 51.7) controlPoint2:CGPointMake(49.2, 55.9)];
	[sharePath addCurveToPoint:CGPointMake(57.2, 42.2) controlPoint1:CGPointMake(46.1, 59.2) controlPoint2:CGPointMake(57.5, 54.4)];
	[sharePath addCurveToPoint:CGPointMake(64.2, 26) controlPoint1:CGPointMake(61.6, 37.7) controlPoint2:CGPointMake(64.2, 32.1)];
	[sharePath closePath];
	[sharePath moveToPoint:CGPointMake(64.2, 26)];
	
	return sharePath;
}

- (void)viewDidAppearAnimation {
    [self addViewDidAppearAnimation];
}

@end
