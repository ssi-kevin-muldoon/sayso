//
//  SSILaunchScreenAnimation.m
//
//  Code generated using QuartzCode 1.55.0 on 1/18/17.
//  www.quartzcodeapp.com
//

#import "SSILaunchScreenAnimation.h"
#import "QCMethod.h"

@interface SSILaunchScreenAnimation ()

@property (nonatomic, strong) NSMutableDictionary * layers;
@property (nonatomic, strong) NSMapTable * completionBlocks;
@property (nonatomic, assign) BOOL  updateLayerValueForCompletedAnimation;


@end

@implementation SSILaunchScreenAnimation

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
	aLayer.frame = CGRectMake(0, 0, 320, 320);
	[self.layer addSublayer:aLayer];
	self.layers[@"aLayer"] = aLayer;
	{
		CALayer * saysoHeroLogo01 = [CALayer layer];
		saysoHeroLogo01.frame = CGRectMake(45.8, 124.2, 228.4, 71.6);
		[aLayer addSublayer:saysoHeroLogo01];
		self.layers[@"saysoHeroLogo01"] = saysoHeroLogo01;
		{
			CAShapeLayer * path = [CAShapeLayer layer];
			path.frame = CGRectMake(0, 15, 35.5, 41.9);
			path.path = [self pathPath].CGPath;
			[saysoHeroLogo01 addSublayer:path];
			self.layers[@"path"] = path;
			CAShapeLayer * path2 = [CAShapeLayer layer];
			path2.frame = CGRectMake(41.3, 15.1, 39.3, 41.8);
			path2.path = [self path2Path].CGPath;
			[saysoHeroLogo01 addSublayer:path2];
			self.layers[@"path2"] = path2;
			CAShapeLayer * path3 = [CAShapeLayer layer];
			path3.frame = CGRectMake(85.5, 15, 36.3, 56.6);
			path3.path = [self path3Path].CGPath;
			[saysoHeroLogo01 addSublayer:path3];
			self.layers[@"path3"] = path3;
			CAShapeLayer * path4 = [CAShapeLayer layer];
			path4.frame = CGRectMake(125.5, 15, 35.5, 41.8);
			path4.path = [self path4Path].CGPath;
			[saysoHeroLogo01 addSublayer:path4];
			self.layers[@"path4"] = path4;
			CAShapeLayer * path5 = [CAShapeLayer layer];
			path5.frame = CGRectMake(166.3, 15, 41.2, 41.8);
			path5.path = [self path5Path].CGPath;
			[saysoHeroLogo01 addSublayer:path5];
			self.layers[@"path5"] = path5;
			CAShapeLayer * path6 = [CAShapeLayer layer];
			path6.frame = CGRectMake(216, 0, 12.4, 56.3);
			path6.path = [self path6Path].CGPath;
			[saysoHeroLogo01 addSublayer:path6];
			self.layers[@"path6"] = path6;
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
	if(!layerIds || [layerIds containsObject:@"path"]){
		CAShapeLayer * path = self.layers[@"path"];
		path.fillColor   = [UIColor whiteColor].CGColor;
		path.strokeColor = [UIColor blackColor].CGColor;
		path.lineWidth   = 0;
	}
	if(!layerIds || [layerIds containsObject:@"path2"]){
		CAShapeLayer * path2 = self.layers[@"path2"];
		path2.fillColor   = [UIColor whiteColor].CGColor;
		path2.strokeColor = [UIColor blackColor].CGColor;
		path2.lineWidth   = 0;
	}
	if(!layerIds || [layerIds containsObject:@"path3"]){
		CAShapeLayer * path3 = self.layers[@"path3"];
		path3.fillColor   = [UIColor whiteColor].CGColor;
		path3.strokeColor = [UIColor blackColor].CGColor;
		path3.lineWidth   = 0;
	}
	if(!layerIds || [layerIds containsObject:@"path4"]){
		CAShapeLayer * path4 = self.layers[@"path4"];
		path4.fillColor   = [UIColor whiteColor].CGColor;
		path4.strokeColor = [UIColor blackColor].CGColor;
		path4.lineWidth   = 0;
	}
	if(!layerIds || [layerIds containsObject:@"path5"]){
		CAShapeLayer * path5 = self.layers[@"path5"];
		path5.fillColor   = [UIColor whiteColor].CGColor;
		path5.strokeColor = [UIColor blackColor].CGColor;
		path5.lineWidth   = 0;
	}
	if(!layerIds || [layerIds containsObject:@"path6"]){
		CAShapeLayer * path6 = self.layers[@"path6"];
		path6.fillColor   = [UIColor whiteColor].CGColor;
		path6.strokeColor = [UIColor blackColor].CGColor;
		path6.lineWidth   = 0;
	}
	
	[CATransaction commit];
}

#pragma mark - Animation Setup

- (void)addUntitled1Animation{
	[self addUntitled1AnimationCompletionBlock:nil];
}

- (void)addUntitled1AnimationCompletionBlock:(void (^)(BOOL finished))completionBlock{
	if (completionBlock){
		CABasicAnimation * completionAnim = [CABasicAnimation animationWithKeyPath:@"completionAnim"];;
		completionAnim.duration = 0.645;
		completionAnim.delegate = self;
		[completionAnim setValue:@"Untitled1" forKey:@"animId"];
		[completionAnim setValue:@(NO) forKey:@"needEndAnim"];
		[self.layer addAnimation:completionAnim forKey:@"Untitled1"];
		[self.completionBlocks setObject:completionBlock forKey:[self.layer animationForKey:@"Untitled1"]];
	}
	
	NSString * fillMode = kCAFillModeForwards;
	
	////SaysoHeroLogo01 animation
	CAKeyframeAnimation * saysoHeroLogo01TransformAnim = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
	saysoHeroLogo01TransformAnim.values   = @[[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.2, 0.2, 0.2)], 
		 [NSValue valueWithCATransform3D:CATransform3DConcat(CATransform3DMakeScale(1.35, 1.35, 1.35), CATransform3DMakeRotation(-20 * M_PI/180, -0, 0, 1))], 
		 [NSValue valueWithCATransform3D:CATransform3DMakeRotation(20 * M_PI/180, 0, 0, -1)]];
	saysoHeroLogo01TransformAnim.keyTimes = @[@0, @0.829, @1];
	saysoHeroLogo01TransformAnim.duration = 0.645;
	saysoHeroLogo01TransformAnim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
	
	CAKeyframeAnimation * saysoHeroLogo01OpacityAnim = [CAKeyframeAnimation animationWithKeyPath:@"opacity"];
	saysoHeroLogo01OpacityAnim.values   = @[@0, @1];
	saysoHeroLogo01OpacityAnim.keyTimes = @[@0, @1];
	saysoHeroLogo01OpacityAnim.duration = 0.298;
	
	CAAnimationGroup * saysoHeroLogo01Untitled1Anim = [QCMethod groupAnimations:@[saysoHeroLogo01TransformAnim, saysoHeroLogo01OpacityAnim] fillMode:fillMode];
	[self.layers[@"saysoHeroLogo01"] addAnimation:saysoHeroLogo01Untitled1Anim forKey:@"saysoHeroLogo01Untitled1Anim"];
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
	if([identifier isEqualToString:@"Untitled1"]){
		[QCMethod updateValueFromPresentationLayerForAnimation:[self.layers[@"saysoHeroLogo01"] animationForKey:@"saysoHeroLogo01Untitled1Anim"] theLayer:self.layers[@"saysoHeroLogo01"]];
	}
}

- (void)removeAnimationsForAnimationId:(NSString *)identifier{
	if([identifier isEqualToString:@"Untitled1"]){
		[self.layers[@"saysoHeroLogo01"] removeAnimationForKey:@"saysoHeroLogo01Untitled1Anim"];
	}
}

- (void)removeAllAnimations{
	[self.layers enumerateKeysAndObjectsUsingBlock:^(id key, CALayer *layer, BOOL *stop) {
		[layer removeAllAnimations];
	}];
}

#pragma mark - Bezier Path

- (UIBezierPath*)pathPath{
	UIBezierPath *pathPath = [UIBezierPath bezierPath];
	[pathPath moveToPoint:CGPointMake(16.6, 0)];
	[pathPath addCurveToPoint:CGPointMake(33.6, 8.5) controlPoint1:CGPointMake(25.1, 0) controlPoint2:CGPointMake(33.6, 3.4)];
	[pathPath addCurveToPoint:CGPointMake(29, 13.4) controlPoint1:CGPointMake(33.6, 11.1) controlPoint2:CGPointMake(31.9, 13.4)];
	[pathPath addCurveToPoint:CGPointMake(17.5, 8.3) controlPoint1:CGPointMake(24.7, 13.4) controlPoint2:CGPointMake(24.5, 8.3)];
	[pathPath addCurveToPoint:CGPointMake(11.1, 11.7) controlPoint1:CGPointMake(13.6, 8.3) controlPoint2:CGPointMake(11.1, 9.4)];
	[pathPath addCurveToPoint:CGPointMake(17, 15.7) controlPoint1:CGPointMake(11.1, 14.3) controlPoint2:CGPointMake(13.6, 14.9)];
	[pathPath addLineToPoint:CGPointMake(21.6, 16.8)];
	[pathPath addCurveToPoint:CGPointMake(35.5, 28.7) controlPoint1:CGPointMake(27.9, 18.2) controlPoint2:CGPointMake(35.5, 20.9)];
	[pathPath addCurveToPoint:CGPointMake(18.4, 41.9) controlPoint1:CGPointMake(35.5, 37.8) controlPoint2:CGPointMake(26.7, 41.9)];
	[pathPath addCurveToPoint:CGPointMake(0, 31.9) controlPoint1:CGPointMake(8.4, 41.9) controlPoint2:CGPointMake(0, 37.4)];
	[pathPath addCurveToPoint:CGPointMake(4.5, 27.3) controlPoint1:CGPointMake(0, 29.5) controlPoint2:CGPointMake(1.4, 27.3)];
	[pathPath addCurveToPoint:CGPointMake(18, 34.2) controlPoint1:CGPointMake(9.3, 27.3) controlPoint2:CGPointMake(9.8, 34.2)];
	[pathPath addCurveToPoint:CGPointMake(24.5, 30.2) controlPoint1:CGPointMake(22, 34.2) controlPoint2:CGPointMake(24.5, 32.4)];
	[pathPath addCurveToPoint:CGPointMake(18.1, 25.9) controlPoint1:CGPointMake(24.5, 27.4) controlPoint2:CGPointMake(22.1, 26.9)];
	[pathPath addLineToPoint:CGPointMake(11.6, 24.3)];
	[pathPath addCurveToPoint:CGPointMake(0.1, 12.6) controlPoint1:CGPointMake(5.1, 22.7) controlPoint2:CGPointMake(0.1, 20)];
	[pathPath addCurveToPoint:CGPointMake(16.6, 0) controlPoint1:CGPointMake(-0.1, 3.4) controlPoint2:CGPointMake(8.9, 0)];
	
	return pathPath;
}

- (UIBezierPath*)path2Path{
	UIBezierPath *path2Path = [UIBezierPath bezierPath];
	[path2Path moveToPoint:CGPointMake(38.2, 30)];
	[path2Path addCurveToPoint:CGPointMake(39.3, 37.5) controlPoint1:CGPointMake(38.2, 34.6) controlPoint2:CGPointMake(39.3, 35.7)];
	[path2Path addCurveToPoint:CGPointMake(34.3, 41.8) controlPoint1:CGPointMake(39.3, 40) controlPoint2:CGPointMake(36.9, 41.8)];
	[path2Path addCurveToPoint:CGPointMake(27.8, 35.3) controlPoint1:CGPointMake(29.5, 41.8) controlPoint2:CGPointMake(27.9, 38.8)];
	[path2Path addCurveToPoint:CGPointMake(12.6, 41.8) controlPoint1:CGPointMake(23.5, 40.1) controlPoint2:CGPointMake(18.4, 41.8)];
	[path2Path addCurveToPoint:CGPointMake(0, 30.5) controlPoint1:CGPointMake(6.3, 41.8) controlPoint2:CGPointMake(0, 37.5)];
	[path2Path addCurveToPoint:CGPointMake(15.5, 17.7) controlPoint1:CGPointMake(0, 21.3) controlPoint2:CGPointMake(7, 18.7)];
	[path2Path addLineToPoint:CGPointMake(22.3, 16.9)];
	[path2Path addCurveToPoint:CGPointMake(27.1, 12.8) controlPoint1:CGPointMake(25, 16.6) controlPoint2:CGPointMake(27.1, 16)];
	[path2Path addCurveToPoint:CGPointMake(20.1, 8.2) controlPoint1:CGPointMake(27.1, 9.6) controlPoint2:CGPointMake(23.8, 8.2)];
	[path2Path addCurveToPoint:CGPointMake(7.2, 14.3) controlPoint1:CGPointMake(11.9, 8.2) controlPoint2:CGPointMake(11.6, 14.3)];
	[path2Path addCurveToPoint:CGPointMake(2.5, 10) controlPoint1:CGPointMake(4.4, 14.3) controlPoint2:CGPointMake(2.5, 12.3)];
	[path2Path addCurveToPoint:CGPointMake(20.2, 0) controlPoint1:CGPointMake(2.5, 5.6) controlPoint2:CGPointMake(8.7, 0)];
	[path2Path addCurveToPoint:CGPointMake(38.2, 11.4) controlPoint1:CGPointMake(30.9, 0) controlPoint2:CGPointMake(38.2, 3.4)];
	[path2Path addLineToPoint:CGPointMake(38.2, 30)];
	[path2Path closePath];
	[path2Path moveToPoint:CGPointMake(27.1, 22)];
	[path2Path addCurveToPoint:CGPointMake(22.3, 23.8) controlPoint1:CGPointMake(25.9, 23.1) controlPoint2:CGPointMake(23.6, 23.5)];
	[path2Path addLineToPoint:CGPointMake(18.3, 24.4)];
	[path2Path addCurveToPoint:CGPointMake(11.1, 29.9) controlPoint1:CGPointMake(13.7, 25.1) controlPoint2:CGPointMake(11.1, 26.5)];
	[path2Path addCurveToPoint:CGPointMake(17.3, 34.5) controlPoint1:CGPointMake(11.1, 32.4) controlPoint2:CGPointMake(13.5, 34.5)];
	[path2Path addCurveToPoint:CGPointMake(27.1, 26.4) controlPoint1:CGPointMake(23.4, 34.5) controlPoint2:CGPointMake(27.1, 30.5)];
	[path2Path addLineToPoint:CGPointMake(27.1, 22)];
	[path2Path closePath];
	[path2Path moveToPoint:CGPointMake(27.1, 22)];
	
	return path2Path;
}

- (UIBezierPath*)path3Path{
	UIBezierPath *path3Path = [UIBezierPath bezierPath];
	[path3Path moveToPoint:CGPointMake(18.3, 30.2)];
	[path3Path addLineToPoint:CGPointMake(18.5, 30.2)];
	[path3Path addLineToPoint:CGPointMake(25.3, 5)];
	[path3Path addCurveToPoint:CGPointMake(30.6, 0.1) controlPoint1:CGPointMake(26.1, 2.2) controlPoint2:CGPointMake(27.6, 0.1)];
	[path3Path addCurveToPoint:CGPointMake(36.3, 5.1) controlPoint1:CGPointMake(35, 0.1) controlPoint2:CGPointMake(36.3, 3.8)];
	[path3Path addCurveToPoint:CGPointMake(35.5, 8.6) controlPoint1:CGPointMake(36.3, 6) controlPoint2:CGPointMake(36, 7.2)];
	[path3Path addLineToPoint:CGPointMake(22.6, 45)];
	[path3Path addCurveToPoint:CGPointMake(9.9, 56.6) controlPoint1:CGPointMake(19.9, 52.6) controlPoint2:CGPointMake(16.9, 56.6)];
	[path3Path addCurveToPoint:CGPointMake(2.9, 51.5) controlPoint1:CGPointMake(5, 56.6) controlPoint2:CGPointMake(2.9, 54.2)];
	[path3Path addCurveToPoint:CGPointMake(8, 47) controlPoint1:CGPointMake(2.9, 48.5) controlPoint2:CGPointMake(5, 47)];
	[path3Path addLineToPoint:CGPointMake(9.1, 47)];
	[path3Path addCurveToPoint:CGPointMake(13, 43.5) controlPoint1:CGPointMake(10.5, 47) controlPoint2:CGPointMake(12.1, 46.9)];
	[path3Path addLineToPoint:CGPointMake(1.4, 10.5)];
	[path3Path addCurveToPoint:CGPointMake(0, 5.3) controlPoint1:CGPointMake(0.5, 7.8) controlPoint2:CGPointMake(0, 6.6)];
	[path3Path addCurveToPoint:CGPointMake(5.4, 0) controlPoint1:CGPointMake(0, 2.3) controlPoint2:CGPointMake(2.4, 0)];
	[path3Path addCurveToPoint:CGPointMake(11.1, 4.2) controlPoint1:CGPointMake(8.4, 0) controlPoint2:CGPointMake(10.4, 1.7)];
	[path3Path addLineToPoint:CGPointMake(18.3, 30.2)];
	[path3Path closePath];
	[path3Path moveToPoint:CGPointMake(18.3, 30.2)];
	
	return path3Path;
}

- (UIBezierPath*)path4Path{
	UIBezierPath *path4Path = [UIBezierPath bezierPath];
	[path4Path moveToPoint:CGPointMake(16.5, 0)];
	[path4Path addCurveToPoint:CGPointMake(33.5, 8.5) controlPoint1:CGPointMake(25, 0) controlPoint2:CGPointMake(33.5, 3.4)];
	[path4Path addCurveToPoint:CGPointMake(28.9, 13.4) controlPoint1:CGPointMake(33.5, 11.1) controlPoint2:CGPointMake(31.7, 13.4)];
	[path4Path addCurveToPoint:CGPointMake(17.4, 8.3) controlPoint1:CGPointMake(24.6, 13.4) controlPoint2:CGPointMake(24.4, 8.3)];
	[path4Path addCurveToPoint:CGPointMake(11, 11.7) controlPoint1:CGPointMake(13.5, 8.3) controlPoint2:CGPointMake(11, 9.4)];
	[path4Path addCurveToPoint:CGPointMake(16.9, 15.7) controlPoint1:CGPointMake(11, 14.3) controlPoint2:CGPointMake(13.5, 14.9)];
	[path4Path addLineToPoint:CGPointMake(21.6, 16.7)];
	[path4Path addCurveToPoint:CGPointMake(35.5, 28.6) controlPoint1:CGPointMake(27.9, 18.1) controlPoint2:CGPointMake(35.5, 20.8)];
	[path4Path addCurveToPoint:CGPointMake(18.4, 41.8) controlPoint1:CGPointMake(35.5, 37.7) controlPoint2:CGPointMake(26.7, 41.8)];
	[path4Path addCurveToPoint:CGPointMake(0, 31.8) controlPoint1:CGPointMake(8.4, 41.8) controlPoint2:CGPointMake(0, 37.3)];
	[path4Path addCurveToPoint:CGPointMake(4.5, 27.2) controlPoint1:CGPointMake(0, 29.4) controlPoint2:CGPointMake(1.4, 27.2)];
	[path4Path addCurveToPoint:CGPointMake(18, 34.1) controlPoint1:CGPointMake(9.3, 27.2) controlPoint2:CGPointMake(9.7, 34.1)];
	[path4Path addCurveToPoint:CGPointMake(24.5, 30.1) controlPoint1:CGPointMake(22, 34.1) controlPoint2:CGPointMake(24.5, 32.3)];
	[path4Path addCurveToPoint:CGPointMake(18.1, 25.8) controlPoint1:CGPointMake(24.5, 27.3) controlPoint2:CGPointMake(22.1, 26.8)];
	[path4Path addLineToPoint:CGPointMake(11.6, 24.2)];
	[path4Path addCurveToPoint:CGPointMake(0.1, 12.5) controlPoint1:CGPointMake(5.1, 22.6) controlPoint2:CGPointMake(0.1, 19.9)];
	[path4Path addCurveToPoint:CGPointMake(16.5, 0) controlPoint1:CGPointMake(-0.1, 3.4) controlPoint2:CGPointMake(8.8, 0)];
	
	return path4Path;
}

- (UIBezierPath*)path5Path{
	UIBezierPath *path5Path = [UIBezierPath bezierPath];
	[path5Path moveToPoint:CGPointMake(20.6, 0)];
	[path5Path addCurveToPoint:CGPointMake(41.2, 20.9) controlPoint1:CGPointMake(34, 0) controlPoint2:CGPointMake(41.2, 9.1)];
	[path5Path addCurveToPoint:CGPointMake(20.6, 41.8) controlPoint1:CGPointMake(41.2, 32) controlPoint2:CGPointMake(35.8, 41.8)];
	[path5Path addCurveToPoint:CGPointMake(0, 20.9) controlPoint1:CGPointMake(5.5, 41.8) controlPoint2:CGPointMake(0, 32)];
	[path5Path addCurveToPoint:CGPointMake(20.6, 0) controlPoint1:CGPointMake(-0, 9.2) controlPoint2:CGPointMake(7.2, 0)];
	[path5Path moveToPoint:CGPointMake(20.6, 33.6)];
	[path5Path addCurveToPoint:CGPointMake(30, 20.9) controlPoint1:CGPointMake(27.2, 33.6) controlPoint2:CGPointMake(30, 27.7)];
	[path5Path addCurveToPoint:CGPointMake(20.6, 8.3) controlPoint1:CGPointMake(30, 13.7) controlPoint2:CGPointMake(27, 8.3)];
	[path5Path addCurveToPoint:CGPointMake(11.2, 20.9) controlPoint1:CGPointMake(14.1, 8.3) controlPoint2:CGPointMake(11.2, 13.7)];
	[path5Path addCurveToPoint:CGPointMake(20.6, 33.6) controlPoint1:CGPointMake(11.1, 27.7) controlPoint2:CGPointMake(13.9, 33.6)];
	
	return path5Path;
}

- (UIBezierPath*)path6Path{
	UIBezierPath *path6Path = [UIBezierPath bezierPath];
	[path6Path moveToPoint:CGPointMake(6.203, 43.9)];
	[path6Path addCurveToPoint:CGPointMake(12.403, 50.1) controlPoint1:CGPointMake(9.603, 43.9) controlPoint2:CGPointMake(12.403, 46.7)];
	[path6Path addCurveToPoint:CGPointMake(6.203, 56.3) controlPoint1:CGPointMake(12.403, 53.5) controlPoint2:CGPointMake(9.603, 56.3)];
	[path6Path addCurveToPoint:CGPointMake(0.003, 50.1) controlPoint1:CGPointMake(2.803, 56.3) controlPoint2:CGPointMake(0.003, 53.5)];
	[path6Path addCurveToPoint:CGPointMake(6.203, 43.9) controlPoint1:CGPointMake(-0.097, 46.7) controlPoint2:CGPointMake(2.703, 43.9)];
	[path6Path moveToPoint:CGPointMake(12.203, 14.7)];
	[path6Path addCurveToPoint:CGPointMake(11.903, 18.3) controlPoint1:CGPointMake(12.203, 15.8) controlPoint2:CGPointMake(12.003, 17.1)];
	[path6Path addLineToPoint:CGPointMake(9.503, 36.1)];
	[path6Path addCurveToPoint:CGPointMake(6.203, 38.9) controlPoint1:CGPointMake(9.203, 38.3) controlPoint2:CGPointMake(8.103, 38.9)];
	[path6Path addCurveToPoint:CGPointMake(2.803, 36.1) controlPoint1:CGPointMake(4.203, 38.9) controlPoint2:CGPointMake(3.203, 38.3)];
	[path6Path addLineToPoint:CGPointMake(0.403, 18.3)];
	[path6Path addCurveToPoint:CGPointMake(0.103, 14.7) controlPoint1:CGPointMake(0.203, 17.1) controlPoint2:CGPointMake(0.103, 15.9)];
	[path6Path addLineToPoint:CGPointMake(0.103, 5.9)];
	[path6Path addCurveToPoint:CGPointMake(6.103, 0) controlPoint1:CGPointMake(0.103, 2) controlPoint2:CGPointMake(2.303, 0)];
	[path6Path addCurveToPoint:CGPointMake(12.103, 5.9) controlPoint1:CGPointMake(9.903, 0) controlPoint2:CGPointMake(12.103, 2)];
	[path6Path addLineToPoint:CGPointMake(12.103, 14.7)];
	[path6Path closePath];
	[path6Path moveToPoint:CGPointMake(12.203, 14.7)];
	
	return path6Path;
}


@end
