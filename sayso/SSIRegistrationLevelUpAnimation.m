//
//  SSIRegistrationLevelUpAnimation.m
//
//  Code generated using QuartzCode 1.55.0 on 1/17/17.
//  www.quartzcodeapp.com
//

#import "SSIRegistrationLevelUpAnimation.h"
#import "QCMethod.h"

@interface SSIRegistrationLevelUpAnimation ()

@property (nonatomic, assign) BOOL  updateLayerValueForCompletedAnimation;
@property (nonatomic, strong) NSMapTable * completionBlocks;
@property (nonatomic, strong) NSMutableDictionary * layers;


@end

@implementation SSIRegistrationLevelUpAnimation

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
		CALayer * levelup01 = [CALayer layer];
		levelup01.frame = CGRectMake(18.7, 18.7, 62.6, 62.6);
		[aLayer addSublayer:levelup01];
		self.layers[@"levelup01"] = levelup01;
		{
			CAShapeLayer * path9 = [CAShapeLayer layer];
			path9.frame = CGRectMake(0, 0, 62.6, 62.6);
			path9.path = [self path9Path].CGPath;
			[levelup01 addSublayer:path9];
			self.layers[@"path9"] = path9;
			CAShapeLayer * path10 = [CAShapeLayer layer];
			path10.frame = CGRectMake(7.5, 6.65, 47.6, 45.3);
			path10.path = [self path10Path].CGPath;
			[levelup01 addSublayer:path10];
			self.layers[@"path10"] = path10;
		}
		
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
	if(!layerIds || [layerIds containsObject:@"path9"]){
		CAShapeLayer * path9 = self.layers[@"path9"];
		path9.fillColor   = nil;
		path9.strokeColor = [UIColor whiteColor].CGColor;
		path9.lineWidth   = 2.123;
	}
	if(!layerIds || [layerIds containsObject:@"path10"]){
		CAShapeLayer * path10 = self.layers[@"path10"];
		path10.fillColor   = nil;
		path10.strokeColor = [UIColor whiteColor].CGColor;
		path10.lineWidth   = 2.123;
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

- (UIBezierPath*)path9Path{
	UIBezierPath *path9Path = [UIBezierPath bezierPath];
	[path9Path moveToPoint:CGPointMake(62.6, 31.3)];
	[path9Path addCurveToPoint:CGPointMake(31.3, 62.6) controlPoint1:CGPointMake(62.6, 48.587) controlPoint2:CGPointMake(48.587, 62.6)];
	[path9Path addCurveToPoint:CGPointMake(0, 31.3) controlPoint1:CGPointMake(14.013, 62.6) controlPoint2:CGPointMake(0, 48.587)];
	[path9Path addCurveToPoint:CGPointMake(31.3, 0) controlPoint1:CGPointMake(0, 14.013) controlPoint2:CGPointMake(14.013, 0)];
	[path9Path addCurveToPoint:CGPointMake(62.6, 31.3) controlPoint1:CGPointMake(48.587, 0) controlPoint2:CGPointMake(62.6, 14.013)];
	[path9Path closePath];
	[path9Path moveToPoint:CGPointMake(62.6, 31.3)];
	
	return path9Path;
}

- (UIBezierPath*)path10Path{
	UIBezierPath *path10Path = [UIBezierPath bezierPath];
	[path10Path moveToPoint:CGPointMake(23.8, 37.6)];
	[path10Path addLineToPoint:CGPointMake(38.5, 45.3)];
	[path10Path addLineToPoint:CGPointMake(35.7, 28.9)];
	[path10Path addLineToPoint:CGPointMake(47.6, 17.3)];
	[path10Path addLineToPoint:CGPointMake(31.2, 14.9)];
	[path10Path addLineToPoint:CGPointMake(23.8, 0)];
	[path10Path addLineToPoint:CGPointMake(16.4, 14.9)];
	[path10Path addLineToPoint:CGPointMake(0, 17.3)];
	[path10Path addLineToPoint:CGPointMake(11.9, 28.9)];
	[path10Path addLineToPoint:CGPointMake(9.1, 45.3)];
	[path10Path closePath];
	[path10Path moveToPoint:CGPointMake(23.8, 37.6)];
	
	return path10Path;
}

- (void)viewDidAppearAnimation {
    [self addViewDidAppearAnimation];
}

@end
