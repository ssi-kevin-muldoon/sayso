//
//  SSIRegistrationLevelUpAnimation.m
//
//  Code generated using QuartzCode 1.55.0 on 1/17/17.
//  www.quartzcodeapp.com
//

#import "SSIRegistrationLevelUpAnimation.h"
#import "QCMethod.h"

@interface SSIRegistrationLevelUpAnimation ()

@property (nonatomic, strong) NSMutableDictionary * layers;
@property (nonatomic, strong) NSMapTable * completionBlocks;
@property (nonatomic, assign) BOOL  updateLayerValueForCompletedAnimation;


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
	self.color = [UIColor colorWithRed:0.0118 green: 0.663 blue:0.957 alpha:1];
	self.color1 = [UIColor colorWithRed:0.506 green: 0.831 blue:0.98 alpha:1];
	self.lightBlue = [UIColor colorWithRed:0.31 green: 0.765 blue:0.969 alpha:1];
	self.blue = [UIColor colorWithRed:0.0118 green: 0.663 blue:0.957 alpha:1];
}

- (void)setupLayers{
	CALayer * aLayer = [CALayer layer];
	aLayer.frame = CGRectMake(0, 100, 100, 100);
	[self.layer addSublayer:aLayer];
	self.layers[@"aLayer"] = aLayer;
	{
		CALayer * levelup = [CALayer layer];
		levelup.frame = CGRectMake(12.5, 13, 74, 74);
		[aLayer addSublayer:levelup];
		self.layers[@"levelup"] = levelup;
		{
			CAShapeLayer * oval = [CAShapeLayer layer];
			oval.frame = CGRectMake(0, 0, 74, 74);
			oval.path = [self ovalPath].CGPath;
			[levelup addSublayer:oval];
			self.layers[@"oval"] = oval;
			CAShapeLayer * path = [CAShapeLayer layer];
			path.frame = CGRectMake(4, 4, 66, 66);
			path.path = [self pathPath].CGPath;
			[levelup addSublayer:path];
			self.layers[@"path"] = path;
			CAShapeLayer * path2 = [CAShapeLayer layer];
			path2.frame = CGRectMake(13.7, 12.35, 47.6, 45.3);
			path2.path = [self path2Path].CGPath;
			[levelup addSublayer:path2];
			self.layers[@"path2"] = path2;
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
	if(!layerIds || [layerIds containsObject:@"oval"]){
		CAShapeLayer * oval = self.layers[@"oval"];
		oval.fillColor   = nil;
		oval.strokeColor = [UIColor whiteColor].CGColor;
	}
	if(!layerIds || [layerIds containsObject:@"path"]){
		CAShapeLayer * path = self.layers[@"path"];
		path.fillColor   = nil;
		path.strokeColor = [UIColor whiteColor].CGColor;
		path.lineWidth   = 2.123;
	}
	if(!layerIds || [layerIds containsObject:@"path2"]){
		CAShapeLayer * path2 = self.layers[@"path2"];
		path2.fillColor   = [UIColor whiteColor].CGColor;
		path2.strokeColor = [UIColor whiteColor].CGColor;
		path2.lineWidth   = 0;
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

- (UIBezierPath*)ovalPath{
	UIBezierPath * ovalPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, 74, 74)];
	return ovalPath;
}

- (UIBezierPath*)pathPath{
	UIBezierPath *pathPath = [UIBezierPath bezierPath];
	[pathPath moveToPoint:CGPointMake(66, 33)];
	[pathPath addCurveToPoint:CGPointMake(33, 66) controlPoint1:CGPointMake(66, 51.225) controlPoint2:CGPointMake(51.225, 66)];
	[pathPath addCurveToPoint:CGPointMake(0, 33) controlPoint1:CGPointMake(14.775, 66) controlPoint2:CGPointMake(0, 51.225)];
	[pathPath addCurveToPoint:CGPointMake(33, 0) controlPoint1:CGPointMake(0, 14.775) controlPoint2:CGPointMake(14.775, 0)];
	[pathPath addCurveToPoint:CGPointMake(66, 33) controlPoint1:CGPointMake(51.225, 0) controlPoint2:CGPointMake(66, 14.775)];
	[pathPath closePath];
	[pathPath moveToPoint:CGPointMake(66, 33)];
	
	return pathPath;
}

- (UIBezierPath*)path2Path{
	UIBezierPath *path2Path = [UIBezierPath bezierPath];
	[path2Path moveToPoint:CGPointMake(23.8, 37.6)];
	[path2Path addLineToPoint:CGPointMake(38.5, 45.3)];
	[path2Path addLineToPoint:CGPointMake(35.7, 28.9)];
	[path2Path addLineToPoint:CGPointMake(47.6, 17.3)];
	[path2Path addLineToPoint:CGPointMake(31.2, 14.9)];
	[path2Path addLineToPoint:CGPointMake(23.8, 0)];
	[path2Path addLineToPoint:CGPointMake(16.4, 14.9)];
	[path2Path addLineToPoint:CGPointMake(0, 17.3)];
	[path2Path addLineToPoint:CGPointMake(11.9, 28.9)];
	[path2Path addLineToPoint:CGPointMake(9.1, 45.3)];
	[path2Path closePath];
	[path2Path moveToPoint:CGPointMake(23.8, 37.6)];
	
	return path2Path;
}


@end
