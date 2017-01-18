//
//  SSIRegistrationAbilitiesAnimation.m
//
//  Code generated using QuartzCode 1.55.0 on 1/17/17.
//  www.quartzcodeapp.com
//

#import "SSIRegistrationAbilitiesAnimation.h"
#import "QCMethod.h"

@interface SSIRegistrationAbilitiesAnimation ()

@property (nonatomic, assign) BOOL  updateLayerValueForCompletedAnimation;
@property (nonatomic, strong) NSMapTable * completionBlocks;
@property (nonatomic, strong) NSMutableDictionary * layers;


@end

@implementation SSIRegistrationAbilitiesAnimation

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
		CAShapeLayer * path9 = [CAShapeLayer layer];
		path9.frame = CGRectMake(19.7, 15, 60.6, 70);
		path9.path = [self path9Path].CGPath;
		[aLayer addSublayer:path9];
		self.layers[@"path9"] = path9;
		CAShapeLayer * path10 = [CAShapeLayer layer];
		path10.frame = CGRectMake(25.4, 21.7, 49.2, 56.6);
		path10.path = [self path10Path].CGPath;
		[aLayer addSublayer:path10];
		self.layers[@"path10"] = path10;
		CAShapeLayer * path11 = [CAShapeLayer layer];
		path11.frame = CGRectMake(31.55, 38.65, 32.9, 28.7);
		path11.path = [self path11Path].CGPath;
		[aLayer addSublayer:path11];
		self.layers[@"path11"] = path11;
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
		path10.lineWidth   = 1.72;
	}
	if(!layerIds || [layerIds containsObject:@"path11"]){
		CAShapeLayer * path11 = self.layers[@"path11"];
		path11.fillColor   = [UIColor whiteColor].CGColor;
		path11.strokeColor = [UIColor blackColor].CGColor;
		path11.lineWidth   = 0;
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
	[path9Path moveToPoint:CGPointMake(0, 17.5)];
	[path9Path addLineToPoint:CGPointMake(30.3, 0)];
	[path9Path addLineToPoint:CGPointMake(60.6, 17.5)];
	[path9Path addLineToPoint:CGPointMake(60.6, 52.5)];
	[path9Path addLineToPoint:CGPointMake(30.3, 70)];
	[path9Path addLineToPoint:CGPointMake(0, 52.5)];
	[path9Path closePath];
	[path9Path moveToPoint:CGPointMake(0, 17.5)];
	
	return path9Path;
}

- (UIBezierPath*)path10Path{
	UIBezierPath *path10Path = [UIBezierPath bezierPath];
	[path10Path moveToPoint:CGPointMake(0, 14.1)];
	[path10Path addLineToPoint:CGPointMake(24.6, 0)];
	[path10Path addLineToPoint:CGPointMake(49.2, 14.1)];
	[path10Path addLineToPoint:CGPointMake(49.2, 42.5)];
	[path10Path addLineToPoint:CGPointMake(24.6, 56.6)];
	[path10Path addLineToPoint:CGPointMake(0, 42.5)];
	[path10Path closePath];
	[path10Path moveToPoint:CGPointMake(0, 14.1)];
	
	return path10Path;
}

- (UIBezierPath*)path11Path{
	UIBezierPath *path11Path = [UIBezierPath bezierPath];
	[path11Path moveToPoint:CGPointMake(0, 12.9)];
	[path11Path addLineToPoint:CGPointMake(32.9, 0)];
	[path11Path addLineToPoint:CGPointMake(15.7, 28.7)];
	[path11Path addLineToPoint:CGPointMake(16.4, 14.3)];
	[path11Path closePath];
	[path11Path moveToPoint:CGPointMake(0, 12.9)];
	
	return path11Path;
}

- (void)viewDidAppearAnimation {
    [self addViewDidAppearAnimation];
}

@end
