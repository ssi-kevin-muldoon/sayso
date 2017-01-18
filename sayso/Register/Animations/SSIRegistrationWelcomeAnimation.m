//
//  SSIRegistrationWelcomeAnimation.m
//
//  Code generated using QuartzCode 1.55.0 on 1/17/17.
//  www.quartzcodeapp.com
//

#import "SSIRegistrationWelcomeAnimation.h"
#import "QCMethod.h"

@interface SSIRegistrationWelcomeAnimation ()

@property (nonatomic, assign) BOOL  updateLayerValueForCompletedAnimation;
@property (nonatomic, strong) NSMapTable * completionBlocks;
@property (nonatomic, strong) NSMutableDictionary * layers;


@end

@implementation SSIRegistrationWelcomeAnimation

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
		CAShapeLayer * path5 = [CAShapeLayer layer];
		path5.frame = CGRectMake(17.9, 17.9, 64.2, 64.2);
		path5.path = [self path5Path].CGPath;
		[aLayer addSublayer:path5];
		self.layers[@"path5"] = path5;
		CALayer * Group = [CALayer layer];
		Group.frame = CGRectMake(32.7, 41.05, 34.6, 17.9);
		[aLayer addSublayer:Group];
		self.layers[@"Group"] = Group;
		{
			CAShapeLayer * path6 = [CAShapeLayer layer];
			path6.frame = CGRectMake(0, 0, 1.7, 13.8);
			path6.path = [self path6Path].CGPath;
			[Group addSublayer:path6];
			self.layers[@"path6"] = path6;
			CAShapeLayer * path7 = [CAShapeLayer layer];
			path7.frame = CGRectMake(3.9, 4.2, 9.2, 9.8);
			path7.path = [self path7Path].CGPath;
			[Group addSublayer:path7];
			self.layers[@"path7"] = path7;
			CAShapeLayer * path8 = [CAShapeLayer layer];
			path8.frame = CGRectMake(14.6, 4.2, 8.7, 13.7);
			path8.path = [self path8Path].CGPath;
			[Group addSublayer:path8];
			self.layers[@"path8"] = path8;
			CAShapeLayer * path9 = [CAShapeLayer layer];
			path9.frame = CGRectMake(25.4, 4.2, 9.2, 9.8);
			path9.path = [self path9Path].CGPath;
			[Group addSublayer:path9];
			self.layers[@"path9"] = path9;
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
	if(!layerIds || [layerIds containsObject:@"path5"]){
		CAShapeLayer * path5 = self.layers[@"path5"];
		path5.fillColor   = nil;
		path5.strokeColor = [UIColor whiteColor].CGColor;
		path5.lineWidth   = 2.123;
	}
	if(!layerIds || [layerIds containsObject:@"path6"]){
		CAShapeLayer * path6 = self.layers[@"path6"];
		path6.fillColor   = [UIColor whiteColor].CGColor;
		path6.strokeColor = [UIColor blackColor].CGColor;
		path6.lineWidth   = 0;
	}
	if(!layerIds || [layerIds containsObject:@"path7"]){
		CAShapeLayer * path7 = self.layers[@"path7"];
		path7.fillColor   = [UIColor whiteColor].CGColor;
		path7.strokeColor = [UIColor blackColor].CGColor;
		path7.lineWidth   = 0;
	}
	if(!layerIds || [layerIds containsObject:@"path8"]){
		CAShapeLayer * path8 = self.layers[@"path8"];
		path8.fillColor   = [UIColor whiteColor].CGColor;
		path8.strokeColor = [UIColor blackColor].CGColor;
		path8.lineWidth   = 0;
	}
	if(!layerIds || [layerIds containsObject:@"path9"]){
		CAShapeLayer * path9 = self.layers[@"path9"];
		path9.fillColor   = [UIColor whiteColor].CGColor;
		path9.strokeColor = [UIColor blackColor].CGColor;
		path9.lineWidth   = 0;
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

- (UIBezierPath*)path5Path{
	UIBezierPath *path5Path = [UIBezierPath bezierPath];
	[path5Path moveToPoint:CGPointMake(64.2, 32.1)];
	[path5Path addCurveToPoint:CGPointMake(32.1, 64.2) controlPoint1:CGPointMake(64.2, 49.828) controlPoint2:CGPointMake(49.828, 64.2)];
	[path5Path addCurveToPoint:CGPointMake(0, 32.1) controlPoint1:CGPointMake(14.372, 64.2) controlPoint2:CGPointMake(0, 49.828)];
	[path5Path addCurveToPoint:CGPointMake(32.1, 0) controlPoint1:CGPointMake(0, 14.372) controlPoint2:CGPointMake(14.372, 0)];
	[path5Path addCurveToPoint:CGPointMake(64.2, 32.1) controlPoint1:CGPointMake(49.828, 0) controlPoint2:CGPointMake(64.2, 14.372)];
	[path5Path closePath];
	[path5Path moveToPoint:CGPointMake(64.2, 32.1)];
	
	return path5Path;
}

- (UIBezierPath*)path6Path{
	UIBezierPath *path6Path = [UIBezierPath bezierPath];
	[path6Path moveToPoint:CGPointMake(0, 0)];
	[path6Path addLineToPoint:CGPointMake(1.7, 0)];
	[path6Path addLineToPoint:CGPointMake(1.7, 13.8)];
	[path6Path addLineToPoint:CGPointMake(0, 13.8)];
	[path6Path addLineToPoint:CGPointMake(0, 0)];
	[path6Path closePath];
	[path6Path moveToPoint:CGPointMake(0, 0)];
	
	return path6Path;
}

- (UIBezierPath*)path7Path{
	UIBezierPath *path7Path = [UIBezierPath bezierPath];
	[path7Path moveToPoint:CGPointMake(9.2, 4.8)];
	[path7Path addCurveToPoint:CGPointMake(4.5, 9.8) controlPoint1:CGPointMake(9.2, 8.3) controlPoint2:CGPointMake(6.8, 9.8)];
	[path7Path addCurveToPoint:CGPointMake(0, 5) controlPoint1:CGPointMake(2, 9.8) controlPoint2:CGPointMake(0, 7.9)];
	[path7Path addCurveToPoint:CGPointMake(4.7, 0) controlPoint1:CGPointMake(0, 1.9) controlPoint2:CGPointMake(2.1, 0)];
	[path7Path addCurveToPoint:CGPointMake(9.2, 4.8) controlPoint1:CGPointMake(7.3, 0) controlPoint2:CGPointMake(9.2, 1.9)];
	[path7Path closePath];
	[path7Path moveToPoint:CGPointMake(1.7, 4.9)];
	[path7Path addCurveToPoint:CGPointMake(4.6, 8.5) controlPoint1:CGPointMake(1.7, 7) controlPoint2:CGPointMake(2.9, 8.5)];
	[path7Path addCurveToPoint:CGPointMake(7.5, 4.9) controlPoint1:CGPointMake(6.2, 8.5) controlPoint2:CGPointMake(7.5, 7)];
	[path7Path addCurveToPoint:CGPointMake(4.7, 1.3) controlPoint1:CGPointMake(7.5, 3.3) controlPoint2:CGPointMake(6.7, 1.3)];
	[path7Path addCurveToPoint:CGPointMake(1.7, 4.9) controlPoint1:CGPointMake(2.6, 1.3) controlPoint2:CGPointMake(1.7, 3.1)];
	[path7Path closePath];
	[path7Path moveToPoint:CGPointMake(1.7, 4.9)];
	
	return path7Path;
}

- (UIBezierPath*)path8Path{
	UIBezierPath *path8Path = [UIBezierPath bezierPath];
	[path8Path moveToPoint:CGPointMake(8.7, 0.2)];
	[path8Path addCurveToPoint:CGPointMake(8.6, 2.8) controlPoint1:CGPointMake(8.7, 0.9) controlPoint2:CGPointMake(8.6, 1.6)];
	[path8Path addLineToPoint:CGPointMake(8.6, 8.3)];
	[path8Path addCurveToPoint:CGPointMake(7.3, 12.6) controlPoint1:CGPointMake(8.6, 10.5) controlPoint2:CGPointMake(8.2, 11.8)];
	[path8Path addCurveToPoint:CGPointMake(3.9, 13.7) controlPoint1:CGPointMake(6.4, 13.5) controlPoint2:CGPointMake(5.1, 13.7)];
	[path8Path addCurveToPoint:CGPointMake(0.8, 12.9) controlPoint1:CGPointMake(2.8, 13.7) controlPoint2:CGPointMake(1.5, 13.4)];
	[path8Path addLineToPoint:CGPointMake(1.2, 11.6)];
	[path8Path addCurveToPoint:CGPointMake(4, 12.3) controlPoint1:CGPointMake(1.8, 12) controlPoint2:CGPointMake(2.8, 12.3)];
	[path8Path addCurveToPoint:CGPointMake(7, 9) controlPoint1:CGPointMake(5.7, 12.3) controlPoint2:CGPointMake(7, 11.4)];
	[path8Path addLineToPoint:CGPointMake(7, 8)];
	[path8Path addLineToPoint:CGPointMake(7, 8)];
	[path8Path addCurveToPoint:CGPointMake(4, 9.6) controlPoint1:CGPointMake(6.5, 8.9) controlPoint2:CGPointMake(5.5, 9.6)];
	[path8Path addCurveToPoint:CGPointMake(0, 5) controlPoint1:CGPointMake(1.7, 9.6) controlPoint2:CGPointMake(0, 7.6)];
	[path8Path addCurveToPoint:CGPointMake(4.2, 0) controlPoint1:CGPointMake(0, 1.8) controlPoint2:CGPointMake(2.1, 0)];
	[path8Path addCurveToPoint:CGPointMake(7.1, 1.6) controlPoint1:CGPointMake(5.8, 0) controlPoint2:CGPointMake(6.7, 0.9)];
	[path8Path addLineToPoint:CGPointMake(7.1, 1.6)];
	[path8Path addLineToPoint:CGPointMake(7.2, 0.2)];
	[path8Path addLineToPoint:CGPointMake(8.7, 0.2)];
	[path8Path closePath];
	[path8Path moveToPoint:CGPointMake(6.9, 3.9)];
	[path8Path addCurveToPoint:CGPointMake(6.8, 3.1) controlPoint1:CGPointMake(6.9, 3.6) controlPoint2:CGPointMake(6.9, 3.4)];
	[path8Path addCurveToPoint:CGPointMake(4.4, 1.3) controlPoint1:CGPointMake(6.5, 2.1) controlPoint2:CGPointMake(5.7, 1.3)];
	[path8Path addCurveToPoint:CGPointMake(1.6, 4.9) controlPoint1:CGPointMake(2.8, 1.3) controlPoint2:CGPointMake(1.6, 2.7)];
	[path8Path addCurveToPoint:CGPointMake(4.4, 8.3) controlPoint1:CGPointMake(1.6, 6.7) controlPoint2:CGPointMake(2.5, 8.3)];
	[path8Path addCurveToPoint:CGPointMake(6.8, 6.6) controlPoint1:CGPointMake(5.4, 8.3) controlPoint2:CGPointMake(6.4, 7.6)];
	[path8Path addCurveToPoint:CGPointMake(6.9, 5.7) controlPoint1:CGPointMake(6.9, 6.3) controlPoint2:CGPointMake(6.9, 6)];
	[path8Path addLineToPoint:CGPointMake(6.9, 3.9)];
	[path8Path closePath];
	[path8Path moveToPoint:CGPointMake(6.9, 3.9)];
	
	return path8Path;
}

- (UIBezierPath*)path9Path{
	UIBezierPath *path9Path = [UIBezierPath bezierPath];
	[path9Path moveToPoint:CGPointMake(9.2, 4.8)];
	[path9Path addCurveToPoint:CGPointMake(4.5, 9.8) controlPoint1:CGPointMake(9.2, 8.3) controlPoint2:CGPointMake(6.8, 9.8)];
	[path9Path addCurveToPoint:CGPointMake(0, 5) controlPoint1:CGPointMake(2, 9.8) controlPoint2:CGPointMake(0, 7.9)];
	[path9Path addCurveToPoint:CGPointMake(4.7, 0) controlPoint1:CGPointMake(0, 1.9) controlPoint2:CGPointMake(2.1, 0)];
	[path9Path addCurveToPoint:CGPointMake(9.2, 4.8) controlPoint1:CGPointMake(7.3, 0) controlPoint2:CGPointMake(9.2, 1.9)];
	[path9Path closePath];
	[path9Path moveToPoint:CGPointMake(1.7, 4.9)];
	[path9Path addCurveToPoint:CGPointMake(4.6, 8.5) controlPoint1:CGPointMake(1.7, 7) controlPoint2:CGPointMake(2.9, 8.5)];
	[path9Path addCurveToPoint:CGPointMake(7.5, 4.9) controlPoint1:CGPointMake(6.2, 8.5) controlPoint2:CGPointMake(7.5, 7)];
	[path9Path addCurveToPoint:CGPointMake(4.7, 1.3) controlPoint1:CGPointMake(7.5, 3.3) controlPoint2:CGPointMake(6.7, 1.3)];
	[path9Path addCurveToPoint:CGPointMake(1.7, 4.9) controlPoint1:CGPointMake(2.6, 1.3) controlPoint2:CGPointMake(1.7, 3.1)];
	[path9Path closePath];
	[path9Path moveToPoint:CGPointMake(1.7, 4.9)];
	
	return path9Path;
}

- (void)viewDidAppearAnimation {
    [self addViewDidAppearAnimation];
}



@end
