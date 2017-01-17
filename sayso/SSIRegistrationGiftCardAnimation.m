//
//  SSIRegistrationGiftCardAnimation.m
//
//  Code generated using QuartzCode 1.55.0 on 1/17/17.
//  www.quartzcodeapp.com
//

#import "SSIRegistrationGiftCardAnimation.h"
#import "QCMethod.h"

@interface SSIRegistrationGiftCardAnimation ()

@property (nonatomic, assign) BOOL  updateLayerValueForCompletedAnimation;
@property (nonatomic, strong) NSMapTable * completionBlocks;
@property (nonatomic, strong) NSMutableDictionary * layers;


@end

@implementation SSIRegistrationGiftCardAnimation

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
		CALayer * giftCard01 = [CALayer layer];
		giftCard01.frame = CGRectMake(16.05, 27.7, 67.9, 44.6);
		[aLayer addSublayer:giftCard01];
		self.layers[@"giftCard01"] = giftCard01;
		{
			CAShapeLayer * path11 = [CAShapeLayer layer];
			path11.frame = CGRectMake(0, 0, 67.5, 44.6);
			path11.path = [self path11Path].CGPath;
			[giftCard01 addSublayer:path11];
			self.layers[@"path11"] = path11;
			CAShapeLayer * path12 = [CAShapeLayer layer];
			path12.frame = CGRectMake(0.8, 25.6, 67.1, 10.2);
			path12.path = [self path12Path].CGPath;
			[giftCard01 addSublayer:path12];
			self.layers[@"path12"] = path12;
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
	if(!layerIds || [layerIds containsObject:@"path11"]){
		CAShapeLayer * path11 = self.layers[@"path11"];
		path11.fillColor   = nil;
		path11.strokeColor = [UIColor whiteColor].CGColor;
		path11.lineWidth   = 2.123;
	}
	if(!layerIds || [layerIds containsObject:@"path12"]){
		CAShapeLayer * path12 = self.layers[@"path12"];
		path12.fillColor   = [UIColor whiteColor].CGColor;
		path12.strokeColor = [UIColor blackColor].CGColor;
		path12.lineWidth   = 0;
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

- (UIBezierPath*)path11Path{
	UIBezierPath *path11Path = [UIBezierPath bezierPath];
	[path11Path moveToPoint:CGPointMake(64.9, 44.6)];
	[path11Path addLineToPoint:CGPointMake(2.6, 44.6)];
	[path11Path addCurveToPoint:CGPointMake(0, 42) controlPoint1:CGPointMake(1.2, 44.6) controlPoint2:CGPointMake(0, 43.4)];
	[path11Path addLineToPoint:CGPointMake(0, 2.6)];
	[path11Path addCurveToPoint:CGPointMake(2.6, 0) controlPoint1:CGPointMake(0, 1.2) controlPoint2:CGPointMake(1.2, 0)];
	[path11Path addLineToPoint:CGPointMake(64.9, 0)];
	[path11Path addCurveToPoint:CGPointMake(67.5, 2.6) controlPoint1:CGPointMake(66.3, 0) controlPoint2:CGPointMake(67.5, 1.2)];
	[path11Path addLineToPoint:CGPointMake(67.5, 42)];
	[path11Path addCurveToPoint:CGPointMake(64.9, 44.6) controlPoint1:CGPointMake(67.5, 43.4) controlPoint2:CGPointMake(66.4, 44.6)];
	[path11Path closePath];
	[path11Path moveToPoint:CGPointMake(64.9, 44.6)];
	
	return path11Path;
}

- (UIBezierPath*)path12Path{
	UIBezierPath *path12Path = [UIBezierPath bezierPath];
	[path12Path moveToPoint:CGPointMake(0, 0)];
	[path12Path addLineToPoint:CGPointMake(67.1, 0)];
	[path12Path addLineToPoint:CGPointMake(67.1, 10.2)];
	[path12Path addLineToPoint:CGPointMake(0, 10.2)];
	[path12Path closePath];
	[path12Path moveToPoint:CGPointMake(0, 0)];
	
	return path12Path;
}

- (void)viewDidAppearAnimation {
    [self addViewDidAppearAnimation];
}

@end
