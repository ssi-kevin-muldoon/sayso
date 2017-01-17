//
//  SSIRegistrationSurveysAnimation.m
//
//  Code generated using QuartzCode 1.55.0 on 1/17/17.
//  www.quartzcodeapp.com
//

#import "SSIRegistrationSurveysAnimation.h"
#import "QCMethod.h"

@interface SSIRegistrationSurveysAnimation ()

@property (nonatomic, assign) BOOL  updateLayerValueForCompletedAnimation;
@property (nonatomic, strong) NSMapTable * completionBlocks;
@property (nonatomic, strong) NSMutableDictionary * layers;


@end

@implementation SSIRegistrationSurveysAnimation

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
		CALayer * Untitled3copy01 = [CALayer layer];
		Untitled3copy01.frame = CGRectMake(20.25, 20.3, 59.5, 59.4);
		[aLayer addSublayer:Untitled3copy01];
		self.layers[@"Untitled3copy01"] = Untitled3copy01;
		{
			CAShapeLayer * path3 = [CAShapeLayer layer];
			path3.frame = CGRectMake(0, 0, 59.5, 59.4);
			path3.path = [self path3Path].CGPath;
			[Untitled3copy01 addSublayer:path3];
			self.layers[@"path3"] = path3;
			CAShapeLayer * path4 = [CAShapeLayer layer];
			path4.frame = CGRectMake(12.3, 14.2, 40, 29.8);
			path4.path = [self path4Path].CGPath;
			[Untitled3copy01 addSublayer:path4];
			self.layers[@"path4"] = path4;
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
	if(!layerIds || [layerIds containsObject:@"path3"]){
		CAShapeLayer * path3 = self.layers[@"path3"];
		path3.fillColor   = nil;
		path3.strokeColor = [UIColor whiteColor].CGColor;
		path3.lineWidth   = 2.123;
	}
	if(!layerIds || [layerIds containsObject:@"path4"]){
		CAShapeLayer * path4 = self.layers[@"path4"];
		path4.fillColor   = nil;
		path4.strokeColor = [UIColor whiteColor].CGColor;
		path4.lineWidth   = 2.123;
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
	
	////Path4 animation
	CAKeyframeAnimation * path4StrokeEndAnim = [CAKeyframeAnimation animationWithKeyPath:@"strokeEnd"];
	path4StrokeEndAnim.values   = @[@0, @0, @1];
	path4StrokeEndAnim.keyTimes = @[@0, @0.677, @1];
	path4StrokeEndAnim.duration = 0.694;
	
	CAAnimationGroup * path4ViewDidAppearAnim = [QCMethod groupAnimations:@[path4StrokeEndAnim] fillMode:fillMode];
	[self.layers[@"path4"] addAnimation:path4ViewDidAppearAnim forKey:@"path4ViewDidAppearAnim"];
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
		[QCMethod updateValueFromPresentationLayerForAnimation:[self.layers[@"path4"] animationForKey:@"path4ViewDidAppearAnim"] theLayer:self.layers[@"path4"]];
	}
}

- (void)removeAnimationsForAnimationId:(NSString *)identifier{
	if([identifier isEqualToString:@"viewDidAppear"]){
		[self.layers[@"aLayer"] removeAnimationForKey:@"aLayerViewDidAppearAnim"];
		[self.layers[@"path4"] removeAnimationForKey:@"path4ViewDidAppearAnim"];
	}
}

- (void)removeAllAnimations{
	[self.layers enumerateKeysAndObjectsUsingBlock:^(id key, CALayer *layer, BOOL *stop) {
		[layer removeAllAnimations];
	}];
}

#pragma mark - Bezier Path

- (UIBezierPath*)path3Path{
	UIBezierPath *path3Path = [UIBezierPath bezierPath];
	[path3Path moveToPoint:CGPointMake(52.9, 59.4)];
	[path3Path addLineToPoint:CGPointMake(6.5, 59.4)];
	[path3Path addCurveToPoint:CGPointMake(0, 52.9) controlPoint1:CGPointMake(2.9, 59.4) controlPoint2:CGPointMake(0, 56.5)];
	[path3Path addLineToPoint:CGPointMake(0, 6.5)];
	[path3Path addCurveToPoint:CGPointMake(6.5, 0) controlPoint1:CGPointMake(0, 2.9) controlPoint2:CGPointMake(2.9, 0)];
	[path3Path addLineToPoint:CGPointMake(53, 0)];
	[path3Path addCurveToPoint:CGPointMake(59.5, 6.5) controlPoint1:CGPointMake(56.6, 0) controlPoint2:CGPointMake(59.5, 2.9)];
	[path3Path addLineToPoint:CGPointMake(59.5, 53)];
	[path3Path addCurveToPoint:CGPointMake(52.9, 59.4) controlPoint1:CGPointMake(59.4, 56.5) controlPoint2:CGPointMake(56.5, 59.4)];
	[path3Path closePath];
	[path3Path moveToPoint:CGPointMake(52.9, 59.4)];
	
	return path3Path;
}

- (UIBezierPath*)path4Path{
	UIBezierPath *path4Path = [UIBezierPath bezierPath];
	[path4Path moveToPoint:CGPointMake(0, 15.4)];
	[path4Path addLineToPoint:CGPointMake(13.3, 29.8)];
	[path4Path addLineToPoint:CGPointMake(40, 0)];
	
	return path4Path;
}

- (void)viewDidAppearAnimation {
    [self addViewDidAppearAnimation];
}


@end
