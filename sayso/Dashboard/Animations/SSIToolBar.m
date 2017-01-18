//
//  SSIToolBar.m
//
//  Code generated using QuartzCode 1.55.0 on 1/12/17.
//  www.quartzcodeapp.com
//

#import "SSIToolBar.h"
#import "QCMethod.h"

@interface SSIToolBar ()

@property (nonatomic, assign) BOOL  updateLayerValueForCompletedAnimation;
@property (nonatomic, assign) BOOL  animationAdded;
@property (nonatomic, strong) NSMapTable * completionBlocks;
@property (nonatomic, strong) NSMutableDictionary * layers;


@end

@implementation SSIToolBar

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

- (void)setToggleAnimProgress:(CGFloat)toggleAnimProgress{
	if(!self.animationAdded){
		[self removeAllAnimations];
		[self addToggleAnimation];
		self.animationAdded = YES;
		self.layer.speed = 0;
		self.layer.timeOffset = 0;
	}
	else{
		CGFloat totalDuration = 0.62;
		CGFloat offset = toggleAnimProgress * totalDuration;
		self.layer.timeOffset = offset;
	}
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
	CALayer * sceneLayer = [CALayer layer];
	sceneLayer.frame = CGRectMake(0, 0.26, 500, 227.74);
	[self.layer addSublayer:sceneLayer];
	self.layers[@"sceneLayer"] = sceneLayer;
	CAShapeLayer * progressContainer = [CAShapeLayer layer];
	progressContainer.frame = CGRectMake(141.5, 134.74, 220, 220);
	progressContainer.path = [self progressContainerPath].CGPath;
	[sceneLayer addSublayer:progressContainer];
	self.layers[@"progressContainer"] = progressContainer;
	CAShapeLayer * progressIndicatorBackground = [CAShapeLayer layer];
	progressIndicatorBackground.frame = CGRectMake(150.5, 144.74, 200, 200);
	progressIndicatorBackground.path = [self progressIndicatorBackgroundPath].CGPath;
	[sceneLayer addSublayer:progressIndicatorBackground];
	self.layers[@"progressIndicatorBackground"] = progressIndicatorBackground;
	CAShapeLayer * progressIndicator = [CAShapeLayer layer];
	progressIndicator.frame = CGRectMake(150.5, 144.74, 200, 200);
	progressIndicator.path = [self progressIndicatorPath].CGPath;
	[sceneLayer addSublayer:progressIndicator];
	self.layers[@"progressIndicator"] = progressIndicator;
	CAShapeLayer * toolBar = [CAShapeLayer layer];
	toolBar.frame = CGRectMake(-56, 183.58, 649.22, 44.16);
	toolBar.path = [self toolBarPath].CGPath;
	[sceneLayer addSublayer:toolBar];
	self.layers[@"toolBar"] = toolBar;
	CAShapeLayer * centerHub = [CAShapeLayer layer];
	centerHub.frame = CGRectMake(185.41, 156.74, 130.17, 27.84);
	centerHub.path = [self centerHubPath].CGPath;
	[sceneLayer addSublayer:centerHub];
	self.layers[@"centerHub"] = centerHub;
	
	CALayer * star = [CALayer layer];
	star.frame = CGRectMake(324.16, 72, 50, 50);
	[self.layer addSublayer:star];
	self.layers[@"star"] = star;
	
	CATextLayer * text = [CATextLayer layer];
	text.frame = CGRectMake(226.85, 212.51, 48.93, 22);
	[self.layer addSublayer:text];
	self.layers[@"text"] = text;
	
	CATextLayer * progressPercent = [CATextLayer layer];
	progressPercent.frame = CGRectMake(183.84, 151.93, 134.96, 49.59);
	[self.layer addSublayer:progressPercent];
	self.layers[@"progressPercent"] = progressPercent;
	
	CATextLayer * nextLevelLabel = [CATextLayer layer];
	nextLevelLabel.frame = CGRectMake(199.46, 140.77, 103.71, 21.31);
	[self.layer addSublayer:nextLevelLabel];
	self.layers[@"nextLevelLabel"] = nextLevelLabel;
	
	[self resetLayerPropertiesForLayerIdentifiers:nil];
}

- (void)resetLayerPropertiesForLayerIdentifiers:(NSArray *)layerIds{
	[CATransaction begin];
	[CATransaction setDisableActions:YES];
	
	if(!layerIds || [layerIds containsObject:@"sceneLayer"]){
		CALayer * sceneLayer = self.layers[@"sceneLayer"];
		sceneLayer.masksToBounds   = YES;
		sceneLayer.backgroundColor = [UIColor colorWithRed:0.522 green: 0.749 blue:1 alpha:0].CGColor;
	}
	if(!layerIds || [layerIds containsObject:@"progressContainer"]){
		CAShapeLayer * progressContainer = self.layers[@"progressContainer"];
		progressContainer.fillColor   = self.lightBlue.CGColor;
		progressContainer.strokeColor = [UIColor colorWithRed:0.329 green: 0.329 blue:0.329 alpha:1].CGColor;
		progressContainer.lineWidth   = 0;
	}
	if(!layerIds || [layerIds containsObject:@"progressIndicatorBackground"]){
		CAShapeLayer * progressIndicatorBackground = self.layers[@"progressIndicatorBackground"];
		[progressIndicatorBackground setValue:@(-203.93 * M_PI/180) forKeyPath:@"transform.rotation"];
		progressIndicatorBackground.opacity   = 0.94;
		progressIndicatorBackground.lineCap   = kCALineCapRound;
		progressIndicatorBackground.fillColor = self.lightBlue.CGColor;
		progressIndicatorBackground.strokeColor = [UIColor colorWithRed:0.329 green: 0.329 blue:0.329 alpha:1].CGColor;
		progressIndicatorBackground.lineWidth = 5;
		progressIndicatorBackground.strokeStart = 0.37;
		progressIndicatorBackground.strokeEnd = 0.63;
	}
	if(!layerIds || [layerIds containsObject:@"progressIndicator"]){
		CAShapeLayer * progressIndicator = self.layers[@"progressIndicator"];
		[progressIndicator setValue:@(-203.93 * M_PI/180) forKeyPath:@"transform.rotation"];
		progressIndicator.lineCap     = kCALineCapRound;
		progressIndicator.fillColor   = self.lightBlue.CGColor;
		progressIndicator.strokeColor = [UIColor colorWithRed:0.00392 green: 0.341 blue:0.608 alpha:1].CGColor;
		progressIndicator.lineWidth   = 8;
		progressIndicator.strokeStart = 0.44;
		progressIndicator.strokeEnd   = 0.63;
	}
	if(!layerIds || [layerIds containsObject:@"toolBar"]){
		CAShapeLayer * toolBar = self.layers[@"toolBar"];
		toolBar.fillColor   = self.blue.CGColor;
		toolBar.strokeColor = [UIColor colorWithRed:0.498 green: 0.498 blue:0.498 alpha:1].CGColor;
		toolBar.lineWidth   = 0;
	}
	if(!layerIds || [layerIds containsObject:@"centerHub"]){
		CAShapeLayer * centerHub = self.layers[@"centerHub"];
		centerHub.anchorPoint = CGPointMake(0.5, 0.98);
		centerHub.frame       = CGRectMake(185.41, 156.74, 130.17, 27.84);
		centerHub.fillRule    = kCAFillRuleEvenOdd;
		centerHub.fillColor   = [UIColor colorWithRed:0.0118 green: 0.663 blue:0.957 alpha:1].CGColor;
		centerHub.strokeColor = [UIColor colorWithRed:0.0118 green: 0.663 blue:0.957 alpha:1].CGColor;
		centerHub.lineWidth   = 0;
		centerHub.strokeStart = 0.01;
	}
	if(!layerIds || [layerIds containsObject:@"star"]){
		CALayer * star = self.layers[@"star"];
		star.shadowColor   = [UIColor colorWithRed:0 green: 0 blue:0 alpha:0.36].CGColor;
		star.shadowOpacity = 0.36;
		star.shadowOffset  = CGSizeMake(4, 4);
		star.shadowRadius  = 5;
		star.contents      = (id)[UIImage imageNamed:@"star"].CGImage;
	}
	if(!layerIds || [layerIds containsObject:@"text"]){
		CATextLayer * text = self.layers[@"text"];
		text.contentsScale   = [[UIScreen mainScreen] scale];
		text.string          = @"Progress\n";
		text.font            = (__bridge CFTypeRef)@"Helvetica";
		text.fontSize        = 12;
		text.alignmentMode   = kCAAlignmentCenter;
		text.foregroundColor = [UIColor whiteColor].CGColor;
	}
	if(!layerIds || [layerIds containsObject:@"progressPercent"]){
		CATextLayer * progressPercent = self.layers[@"progressPercent"];
		progressPercent.contentsScale   = [[UIScreen mainScreen] scale];
		progressPercent.string          = @"66%\n";
		progressPercent.font            = (__bridge CFTypeRef)@"Helvetica-Bold";
		progressPercent.fontSize        = 42;
		progressPercent.alignmentMode   = kCAAlignmentCenter;
		progressPercent.foregroundColor = [UIColor whiteColor].CGColor;
	}
	if(!layerIds || [layerIds containsObject:@"nextLevelLabel"]){
		CATextLayer * nextLevelLabel = self.layers[@"nextLevelLabel"];
		nextLevelLabel.contentsScale   = [[UIScreen mainScreen] scale];
		nextLevelLabel.string          = @"NEXT LEVEL\n";
		nextLevelLabel.font            = (__bridge CFTypeRef)@"Helvetica";
		nextLevelLabel.fontSize        = 12;
		nextLevelLabel.alignmentMode   = kCAAlignmentCenter;
		nextLevelLabel.foregroundColor = [UIColor whiteColor].CGColor;
	}
	
	[CATransaction commit];
}

#pragma mark - Animation Setup

- (void)addRevealAnimation{
	[self addRevealAnimationCompletionBlock:nil];
}

- (void)addRevealAnimationCompletionBlock:(void (^)(BOOL finished))completionBlock{
	[self addRevealAnimationReverse:NO totalDuration:0.618 endTime:1 completionBlock:completionBlock];
}

- (void)addRevealAnimationReverse:(BOOL)reverseAnimation totalDuration:(CFTimeInterval)totalDuration endTime:(CFTimeInterval)endTime completionBlock:(void (^)(BOOL finished))completionBlock{
	endTime = endTime * totalDuration;
	
	if (completionBlock){
		CABasicAnimation * completionAnim = [CABasicAnimation animationWithKeyPath:@"completionAnim"];;
		completionAnim.duration = endTime;
		completionAnim.delegate = self;
		[completionAnim setValue:@"Reveal" forKey:@"animId"];
		[completionAnim setValue:@(YES) forKey:@"needEndAnim"];
		[self.layer addAnimation:completionAnim forKey:@"Reveal"];
		[self.completionBlocks setObject:completionBlock forKey:[self.layer animationForKey:@"Reveal"]];
	}
	
	if (!reverseAnimation) [self resetLayerPropertiesForLayerIdentifiers:@[@"progressContainer", @"progressIndicatorBackground", @"progressIndicator", @"centerHub", @"star", @"progressPercent", @"nextLevelLabel"]];
	
	self.layer.speed = 1;
	self.animationAdded = NO;
	
	NSString * fillMode = reverseAnimation ? kCAFillModeBoth : kCAFillModeForwards;
	
	////ProgressContainer animation
	CAKeyframeAnimation * progressContainerTransformAnim = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
	progressContainerTransformAnim.values = @[[NSValue valueWithCATransform3D:CATransform3DIdentity], 
		 [NSValue valueWithCATransform3D:CATransform3DMakeScale(0.8, 0.8, 0.8)], 
		 [NSValue valueWithCATransform3D:CATransform3DMakeScale(1.85, 1.85, 1.85)], 
		 [NSValue valueWithCATransform3D:CATransform3DMakeScale(1.62, 1.62, 1.62)]];
	progressContainerTransformAnim.keyTimes = @[@0, @0.0813, @0.69, @1];
	progressContainerTransformAnim.duration = totalDuration;
	progressContainerTransformAnim.timingFunction = [CAMediaTimingFunction functionWithControlPoints:0.298 :0.157 :0.659 :1.58];
	
	CAAnimationGroup * progressContainerRevealAnim = [QCMethod groupAnimations:@[progressContainerTransformAnim] fillMode:fillMode];
	if (reverseAnimation) progressContainerRevealAnim = (CAAnimationGroup *)[QCMethod reverseAnimation:progressContainerRevealAnim totalDuration:totalDuration];
	[self.layers[@"progressContainer"] addAnimation:progressContainerRevealAnim forKey:@"progressContainerRevealAnim"];
	
	////ProgressIndicatorBackground animation
	CAKeyframeAnimation * progressIndicatorBackgroundTransformAnim = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
	progressIndicatorBackgroundTransformAnim.values = @[[NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI, 0, 0, -1)], 
		 [NSValue valueWithCATransform3D:CATransform3DConcat(CATransform3DMakeScale(0.8, 0.8, 0.8), CATransform3DMakeRotation(-M_PI, 0, 0, 1))], 
		 [NSValue valueWithCATransform3D:CATransform3DConcat(CATransform3DMakeScale(1.85, 1.85, 1.85), CATransform3DMakeRotation(-M_PI, 0, 0, 1))], 
		 [NSValue valueWithCATransform3D:CATransform3DConcat(CATransform3DMakeScale(1.62, 1.62, 1.62), CATransform3DMakeRotation(-M_PI, 0, 0, 1))]];
	progressIndicatorBackgroundTransformAnim.keyTimes = @[@0, @0.0813, @0.69, @1];
	progressIndicatorBackgroundTransformAnim.duration = totalDuration;
	progressIndicatorBackgroundTransformAnim.timingFunction = [CAMediaTimingFunction functionWithControlPoints:0.298 :0.157 :0.659 :1.58];
	
	CAKeyframeAnimation * progressIndicatorBackgroundStrokeStartAnim = [CAKeyframeAnimation animationWithKeyPath:@"strokeStart"];
	progressIndicatorBackgroundStrokeStartAnim.values = @[@0.37, @0.33];
	progressIndicatorBackgroundStrokeStartAnim.keyTimes = @[@0, @1];
	progressIndicatorBackgroundStrokeStartAnim.duration = 0.214 * totalDuration;
	progressIndicatorBackgroundStrokeStartAnim.beginTime = 0.177 * totalDuration;
	
	CAKeyframeAnimation * progressIndicatorBackgroundStrokeEndAnim = [CAKeyframeAnimation animationWithKeyPath:@"strokeEnd"];
	progressIndicatorBackgroundStrokeEndAnim.values = @[@0.63, @0.67];
	progressIndicatorBackgroundStrokeEndAnim.keyTimes = @[@0, @1];
	progressIndicatorBackgroundStrokeEndAnim.duration = 0.214 * totalDuration;
	progressIndicatorBackgroundStrokeEndAnim.beginTime = 0.177 * totalDuration;
	
	CAAnimationGroup * progressIndicatorBackgroundRevealAnim = [QCMethod groupAnimations:@[progressIndicatorBackgroundTransformAnim, progressIndicatorBackgroundStrokeStartAnim, progressIndicatorBackgroundStrokeEndAnim] fillMode:fillMode];
	if (reverseAnimation) progressIndicatorBackgroundRevealAnim = (CAAnimationGroup *)[QCMethod reverseAnimation:progressIndicatorBackgroundRevealAnim totalDuration:totalDuration];
	[self.layers[@"progressIndicatorBackground"] addAnimation:progressIndicatorBackgroundRevealAnim forKey:@"progressIndicatorBackgroundRevealAnim"];
	
	////ProgressIndicator animation
	CAKeyframeAnimation * progressIndicatorTransformAnim = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
	progressIndicatorTransformAnim.values = @[[NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI, 0, 0, -1)], 
		 [NSValue valueWithCATransform3D:CATransform3DConcat(CATransform3DMakeScale(0.8, 0.8, 0.8), CATransform3DMakeRotation(-M_PI, 0, 0, 1))], 
		 [NSValue valueWithCATransform3D:CATransform3DConcat(CATransform3DMakeScale(1.85, 1.85, 1.85), CATransform3DMakeRotation(-M_PI, 0, 0, 1))], 
		 [NSValue valueWithCATransform3D:CATransform3DConcat(CATransform3DMakeScale(1.62, 1.62, 1.62), CATransform3DMakeRotation(-M_PI, 0, 0, 1))]];
	progressIndicatorTransformAnim.keyTimes = @[@0, @0.0813, @0.69, @1];
	progressIndicatorTransformAnim.duration = totalDuration;
	progressIndicatorTransformAnim.timingFunction = [CAMediaTimingFunction functionWithControlPoints:0.298 :0.157 :0.659 :1.58];
	
	CAKeyframeAnimation * progressIndicatorStrokeEndAnim = [CAKeyframeAnimation animationWithKeyPath:@"strokeEnd"];
	progressIndicatorStrokeEndAnim.values = @[@0.63, @0.67];
	progressIndicatorStrokeEndAnim.keyTimes = @[@0, @1];
	progressIndicatorStrokeEndAnim.duration = 0.214 * totalDuration;
	progressIndicatorStrokeEndAnim.beginTime = 0.177 * totalDuration;
	
	CAAnimationGroup * progressIndicatorRevealAnim = [QCMethod groupAnimations:@[progressIndicatorTransformAnim, progressIndicatorStrokeEndAnim] fillMode:fillMode];
	if (reverseAnimation) progressIndicatorRevealAnim = (CAAnimationGroup *)[QCMethod reverseAnimation:progressIndicatorRevealAnim totalDuration:totalDuration];
	[self.layers[@"progressIndicator"] addAnimation:progressIndicatorRevealAnim forKey:@"progressIndicatorRevealAnim"];
	
	////CenterHub animation
	CAKeyframeAnimation * centerHubTransformAnim = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
	centerHubTransformAnim.values         = @[[NSValue valueWithCATransform3D:CATransform3DIdentity], 
		 [NSValue valueWithCATransform3D:CATransform3DMakeScale(1, -1, 1)], 
		 [NSValue valueWithCATransform3D:CATransform3DMakeScale(1.2, -1.36, 1)], 
		 [NSValue valueWithCATransform3D:CATransform3DMakeScale(1, -1, 1)]];
	centerHubTransformAnim.keyTimes       = @[@0, @0.742, @0.852, @1];
	centerHubTransformAnim.duration       = 0.656 * totalDuration;
	centerHubTransformAnim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
	
	CAKeyframeAnimation * centerHubFillColorAnim = [CAKeyframeAnimation animationWithKeyPath:@"fillColor"];
	centerHubFillColorAnim.values   = @[(id)self.blue.CGColor, 
		 (id)self.lightBlue.CGColor, 
		 (id)self.blue.CGColor, 
		 (id)self.lightBlue.CGColor, 
		 (id)self.lightBlue.CGColor];
	centerHubFillColorAnim.keyTimes = @[@0, @0.837, @0.296, @0.915, @1];
	centerHubFillColorAnim.duration = 0.374 * totalDuration;
	
	CAAnimationGroup * centerHubRevealAnim = [QCMethod groupAnimations:@[centerHubTransformAnim, centerHubFillColorAnim] fillMode:fillMode];
	if (reverseAnimation) centerHubRevealAnim = (CAAnimationGroup *)[QCMethod reverseAnimation:centerHubRevealAnim totalDuration:totalDuration];
	[self.layers[@"centerHub"] addAnimation:centerHubRevealAnim forKey:@"centerHubRevealAnim"];
	
	////Star animation
	CAKeyframeAnimation * starPositionAnim = [CAKeyframeAnimation animationWithKeyPath:@"position"];
	starPositionAnim.values                = @[[NSValue valueWithCGPoint:CGPointMake(251.355, 187.013)], [NSValue valueWithCGPoint:CGPointMake(342, 98)]];
	starPositionAnim.keyTimes              = @[@0, @1];
	starPositionAnim.duration              = 0.571 * totalDuration;
	starPositionAnim.timingFunction        = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
	
	CAKeyframeAnimation * starTransformAnim = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
	starTransformAnim.values    = @[[NSValue valueWithCATransform3D:CATransform3DIdentity], 
		 [NSValue valueWithCATransform3D:CATransform3DMakeScale(1.62, 1.62, 1)]];
	starTransformAnim.keyTimes  = @[@0, @1];
	starTransformAnim.duration  = 0.359 * totalDuration;
	starTransformAnim.beginTime = 0.331 * totalDuration;
	
	CAAnimationGroup * starRevealAnim = [QCMethod groupAnimations:@[starPositionAnim, starTransformAnim] fillMode:fillMode];
	if (reverseAnimation) starRevealAnim = (CAAnimationGroup *)[QCMethod reverseAnimation:starRevealAnim totalDuration:totalDuration];
	[self.layers[@"star"] addAnimation:starRevealAnim forKey:@"starRevealAnim"];
	
	////ProgressPercent animation
	CAKeyframeAnimation * progressPercentTransformAnim = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
	progressPercentTransformAnim.values   = @[[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.2, 0.2, 0.2)], 
		 [NSValue valueWithCATransform3D:CATransform3DIdentity], 
		 [NSValue valueWithCATransform3D:CATransform3DMakeScale(1.35, 1.35, 1.35)], 
		 [NSValue valueWithCATransform3D:CATransform3DIdentity]];
	progressPercentTransformAnim.keyTimes = @[@0, @0.706, @0.884, @1];
	progressPercentTransformAnim.duration = 0.69 * totalDuration;
	progressPercentTransformAnim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
	
	CAKeyframeAnimation * progressPercentHiddenAnim = [CAKeyframeAnimation animationWithKeyPath:@"hidden"];
	progressPercentHiddenAnim.values   = @[@YES, @NO];
	progressPercentHiddenAnim.keyTimes = @[@0, @1];
	progressPercentHiddenAnim.duration = 0.31 * totalDuration;
	
	CAAnimationGroup * progressPercentRevealAnim = [QCMethod groupAnimations:@[progressPercentTransformAnim, progressPercentHiddenAnim] fillMode:fillMode];
	if (reverseAnimation) progressPercentRevealAnim = (CAAnimationGroup *)[QCMethod reverseAnimation:progressPercentRevealAnim totalDuration:totalDuration];
	[self.layers[@"progressPercent"] addAnimation:progressPercentRevealAnim forKey:@"progressPercentRevealAnim"];
	
	////NextLevelLabel animation
	CAKeyframeAnimation * nextLevelLabelHiddenAnim = [CAKeyframeAnimation animationWithKeyPath:@"hidden"];
	nextLevelLabelHiddenAnim.values   = @[@YES, @NO];
	nextLevelLabelHiddenAnim.keyTimes = @[@0, @1];
	nextLevelLabelHiddenAnim.duration = 0.69 * totalDuration;
	
	CAAnimationGroup * nextLevelLabelRevealAnim = [QCMethod groupAnimations:@[nextLevelLabelHiddenAnim] fillMode:fillMode];
	if (reverseAnimation) nextLevelLabelRevealAnim = (CAAnimationGroup *)[QCMethod reverseAnimation:nextLevelLabelRevealAnim totalDuration:totalDuration];
	[self.layers[@"nextLevelLabel"] addAnimation:nextLevelLabelRevealAnim forKey:@"nextLevelLabelRevealAnim"];
}

- (void)addDismissAnimation{
	[self addDismissAnimationCompletionBlock:nil];
}

- (void)addDismissAnimationCompletionBlock:(void (^)(BOOL finished))completionBlock{
	[self addDismissAnimationReverse:NO totalDuration:0.618 endTime:1 completionBlock:completionBlock];
}

- (void)addDismissAnimationReverse:(BOOL)reverseAnimation totalDuration:(CFTimeInterval)totalDuration endTime:(CFTimeInterval)endTime completionBlock:(void (^)(BOOL finished))completionBlock{
	endTime = endTime * totalDuration;
	
	if (completionBlock){
		CABasicAnimation * completionAnim = [CABasicAnimation animationWithKeyPath:@"completionAnim"];;
		completionAnim.duration = endTime;
		completionAnim.delegate = self;
		[completionAnim setValue:@"Dismiss" forKey:@"animId"];
		[completionAnim setValue:@(YES) forKey:@"needEndAnim"];
		[self.layer addAnimation:completionAnim forKey:@"Dismiss"];
		[self.completionBlocks setObject:completionBlock forKey:[self.layer animationForKey:@"Dismiss"]];
	}
	
	if (!reverseAnimation) [self resetLayerPropertiesForLayerIdentifiers:@[@"progressContainer", @"progressIndicatorBackground", @"progressIndicator", @"centerHub", @"star", @"progressPercent", @"nextLevelLabel"]];
	
	self.layer.speed = 1;
	self.animationAdded = NO;
	
	NSString * fillMode = reverseAnimation ? kCAFillModeBoth : kCAFillModeForwards;
	
	////ProgressContainer animation
	CAKeyframeAnimation * progressContainerTransformAnim = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
	progressContainerTransformAnim.values = @[[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.62, 1.62, 1.62)], 
		 [NSValue valueWithCATransform3D:CATransform3DMakeScale(1.62, 1.62, 1.62)], 
		 [NSValue valueWithCATransform3D:CATransform3DMakeScale(2.2, 2.2, 2.2)], 
		 [NSValue valueWithCATransform3D:CATransform3DMakeScale(0.8, 0.8, 0.8)], 
		 [NSValue valueWithCATransform3D:CATransform3DIdentity]];
	progressContainerTransformAnim.keyTimes = @[@0, @0.145, @0.266, @0.725, @1];
	progressContainerTransformAnim.duration = 0.99 * totalDuration;
	progressContainerTransformAnim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
	
	CAAnimationGroup * progressContainerDismissAnim = [QCMethod groupAnimations:@[progressContainerTransformAnim] fillMode:fillMode];
	if (reverseAnimation) progressContainerDismissAnim = (CAAnimationGroup *)[QCMethod reverseAnimation:progressContainerDismissAnim totalDuration:totalDuration];
	[self.layers[@"progressContainer"] addAnimation:progressContainerDismissAnim forKey:@"progressContainerDismissAnim"];
	
	////ProgressIndicatorBackground animation
	CAKeyframeAnimation * progressIndicatorBackgroundTransformAnim = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
	progressIndicatorBackgroundTransformAnim.values = @[[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.62, 1.62, 1.62)], 
		 [NSValue valueWithCATransform3D:CATransform3DMakeScale(1.62, 1.62, 1.62)], 
		 [NSValue valueWithCATransform3D:CATransform3DMakeScale(2.2, 2.2, 2.2)], 
		 [NSValue valueWithCATransform3D:CATransform3DMakeScale(0.8, 0.8, 0.8)], 
		 [NSValue valueWithCATransform3D:CATransform3DIdentity]];
	progressIndicatorBackgroundTransformAnim.keyTimes = @[@0, @0.145, @0.266, @0.725, @1];
	progressIndicatorBackgroundTransformAnim.duration = 0.99 * totalDuration;
	progressIndicatorBackgroundTransformAnim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
	
	CAAnimationGroup * progressIndicatorBackgroundDismissAnim = [QCMethod groupAnimations:@[progressIndicatorBackgroundTransformAnim] fillMode:fillMode];
	if (reverseAnimation) progressIndicatorBackgroundDismissAnim = (CAAnimationGroup *)[QCMethod reverseAnimation:progressIndicatorBackgroundDismissAnim totalDuration:totalDuration];
	[self.layers[@"progressIndicatorBackground"] addAnimation:progressIndicatorBackgroundDismissAnim forKey:@"progressIndicatorBackgroundDismissAnim"];
	
	////ProgressIndicator animation
	CAKeyframeAnimation * progressIndicatorTransformAnim = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
	progressIndicatorTransformAnim.values = @[[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.62, 1.62, 1.62)], 
		 [NSValue valueWithCATransform3D:CATransform3DMakeScale(1.62, 1.62, 1.62)], 
		 [NSValue valueWithCATransform3D:CATransform3DMakeScale(2.2, 2.2, 2.2)], 
		 [NSValue valueWithCATransform3D:CATransform3DMakeScale(0.8, 0.8, 0.8)], 
		 [NSValue valueWithCATransform3D:CATransform3DIdentity]];
	progressIndicatorTransformAnim.keyTimes = @[@0, @0.145, @0.266, @0.725, @1];
	progressIndicatorTransformAnim.duration = 0.99 * totalDuration;
	progressIndicatorTransformAnim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
	
	CAAnimationGroup * progressIndicatorDismissAnim = [QCMethod groupAnimations:@[progressIndicatorTransformAnim] fillMode:fillMode];
	if (reverseAnimation) progressIndicatorDismissAnim = (CAAnimationGroup *)[QCMethod reverseAnimation:progressIndicatorDismissAnim totalDuration:totalDuration];
	[self.layers[@"progressIndicator"] addAnimation:progressIndicatorDismissAnim forKey:@"progressIndicatorDismissAnim"];
	
	////CenterHub animation
	CAKeyframeAnimation * centerHubTransformAnim = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
	centerHubTransformAnim.values         = @[[NSValue valueWithCATransform3D:CATransform3DMakeScale(1, -1, 1)], 
		 [NSValue valueWithCATransform3D:CATransform3DMakeScale(1, -1, 1)], 
		 [NSValue valueWithCATransform3D:CATransform3DMakeScale(1, 0.5, 1)], 
		 [NSValue valueWithCATransform3D:CATransform3DIdentity]];
	centerHubTransformAnim.keyTimes       = @[@0, @0.145, @0.832, @1];
	centerHubTransformAnim.duration       = totalDuration;
	centerHubTransformAnim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
	
	CAKeyframeAnimation * centerHubFillColorAnim = [CAKeyframeAnimation animationWithKeyPath:@"fillColor"];
	centerHubFillColorAnim.values   = @[(id)self.lightBlue.CGColor, 
		 (id)self.lightBlue.CGColor, 
		 (id)self.blue.CGColor, 
		 (id)self.blue.CGColor];
	centerHubFillColorAnim.keyTimes = @[@0, @0.5, @0.513, @1];
	centerHubFillColorAnim.duration = totalDuration;
	
	CAAnimationGroup * centerHubDismissAnim = [QCMethod groupAnimations:@[centerHubTransformAnim, centerHubFillColorAnim] fillMode:fillMode];
	if (reverseAnimation) centerHubDismissAnim = (CAAnimationGroup *)[QCMethod reverseAnimation:centerHubDismissAnim totalDuration:totalDuration];
	[self.layers[@"centerHub"] addAnimation:centerHubDismissAnim forKey:@"centerHubDismissAnim"];
	
	////Star animation
	CAKeyframeAnimation * starPositionAnim = [CAKeyframeAnimation animationWithKeyPath:@"position"];
	starPositionAnim.values                = @[[NSValue valueWithCGPoint:CGPointMake(349.162, 97)], [NSValue valueWithCGPoint:CGPointMake(251.367, 187)]];
	starPositionAnim.keyTimes              = @[@0, @1];
	starPositionAnim.duration              = 0.343 * totalDuration;
	starPositionAnim.beginTime             = 0.128 * totalDuration;
	starPositionAnim.timingFunction        = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
	
	CAKeyframeAnimation * starTransformAnim = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
	starTransformAnim.values   = @[[NSValue valueWithCATransform3D:CATransform3DIdentity], 
		 [NSValue valueWithCATransform3D:CATransform3DMakeScale(1.2, 1.2, 1.2)], 
		 [NSValue valueWithCATransform3D:CATransform3DIdentity]];
	starTransformAnim.keyTimes = @[@0, @0.116, @1];
	starTransformAnim.duration = 0.718 * totalDuration;
	
	CAAnimationGroup * starDismissAnim = [QCMethod groupAnimations:@[starPositionAnim, starTransformAnim] fillMode:fillMode];
	if (reverseAnimation) starDismissAnim = (CAAnimationGroup *)[QCMethod reverseAnimation:starDismissAnim totalDuration:totalDuration];
	[self.layers[@"star"] addAnimation:starDismissAnim forKey:@"starDismissAnim"];
	
	////ProgressPercent animation
	CAKeyframeAnimation * progressPercentHiddenAnim = [CAKeyframeAnimation animationWithKeyPath:@"hidden"];
	progressPercentHiddenAnim.values    = @[@YES, @YES];
	progressPercentHiddenAnim.keyTimes  = @[@0, @1];
	progressPercentHiddenAnim.duration  = 0.361 * totalDuration;
	progressPercentHiddenAnim.beginTime = 0.471 * totalDuration;
	
	CAKeyframeAnimation * progressPercentTransformAnim = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
	progressPercentTransformAnim.values   = @[[NSValue valueWithCATransform3D:CATransform3DIdentity], 
		 [NSValue valueWithCATransform3D:CATransform3DMakeScale(0.2, 0.2, 0.2)]];
	progressPercentTransformAnim.keyTimes = @[@0, @1];
	progressPercentTransformAnim.duration = 0.432 * totalDuration;
	progressPercentTransformAnim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
	
	CAAnimationGroup * progressPercentDismissAnim = [QCMethod groupAnimations:@[progressPercentHiddenAnim, progressPercentTransformAnim] fillMode:fillMode];
	if (reverseAnimation) progressPercentDismissAnim = (CAAnimationGroup *)[QCMethod reverseAnimation:progressPercentDismissAnim totalDuration:totalDuration];
	[self.layers[@"progressPercent"] addAnimation:progressPercentDismissAnim forKey:@"progressPercentDismissAnim"];
	
	////NextLevelLabel animation
	CAKeyframeAnimation * nextLevelLabelHiddenAnim = [CAKeyframeAnimation animationWithKeyPath:@"hidden"];
	nextLevelLabelHiddenAnim.values   = @[@NO, @YES];
	nextLevelLabelHiddenAnim.keyTimes = @[@0, @1];
	nextLevelLabelHiddenAnim.duration = 0.832 * totalDuration;
	
	CAAnimationGroup * nextLevelLabelDismissAnim = [QCMethod groupAnimations:@[nextLevelLabelHiddenAnim] fillMode:fillMode];
	if (reverseAnimation) nextLevelLabelDismissAnim = (CAAnimationGroup *)[QCMethod reverseAnimation:nextLevelLabelDismissAnim totalDuration:totalDuration];
	[self.layers[@"nextLevelLabel"] addAnimation:nextLevelLabelDismissAnim forKey:@"nextLevelLabelDismissAnim"];
}

- (void)addClosedAnimation{
	[self addClosedAnimationCompletionBlock:nil];
}

- (void)addClosedAnimationCompletionBlock:(void (^)(BOOL finished))completionBlock{
	if (completionBlock){
		CABasicAnimation * completionAnim = [CABasicAnimation animationWithKeyPath:@"completionAnim"];;
		completionAnim.duration = 0.1;
		completionAnim.delegate = self;
		[completionAnim setValue:@"Closed" forKey:@"animId"];
		[completionAnim setValue:@(NO) forKey:@"needEndAnim"];
		[self.layer addAnimation:completionAnim forKey:@"Closed"];
		[self.completionBlocks setObject:completionBlock forKey:[self.layer animationForKey:@"Closed"]];
	}
	
	self.layer.speed = 1;
	self.animationAdded = NO;
	
	NSString * fillMode = kCAFillModeForwards;
	
	////Star animation
	CAKeyframeAnimation * starPositionAnim = [CAKeyframeAnimation animationWithKeyPath:@"position"];
	starPositionAnim.values                = @[[NSValue valueWithCGPoint:CGPointMake(186.942, 186.898)], [NSValue valueWithCGPoint:CGPointMake(249.851, 187.013)]];
	starPositionAnim.keyTimes              = @[@0, @1];
	starPositionAnim.duration              = 0.1;
	
	CAAnimationGroup * starClosedAnim = [QCMethod groupAnimations:@[starPositionAnim] fillMode:fillMode];
	[self.layers[@"star"] addAnimation:starClosedAnim forKey:@"starClosedAnim"];
	
	////ProgressPercent animation
	CAKeyframeAnimation * progressPercentHiddenAnim = [CAKeyframeAnimation animationWithKeyPath:@"hidden"];
	progressPercentHiddenAnim.values   = @[@NO, @YES];
	progressPercentHiddenAnim.keyTimes = @[@0, @1];
	progressPercentHiddenAnim.duration = 0.1;
	
	CAAnimationGroup * progressPercentClosedAnim = [QCMethod groupAnimations:@[progressPercentHiddenAnim] fillMode:fillMode];
	[self.layers[@"progressPercent"] addAnimation:progressPercentClosedAnim forKey:@"progressPercentClosedAnim"];
	
	////NextLevelLabel animation
	CAKeyframeAnimation * nextLevelLabelHiddenAnim = [CAKeyframeAnimation animationWithKeyPath:@"hidden"];
	nextLevelLabelHiddenAnim.values   = @[@NO, @NO, @YES];
	nextLevelLabelHiddenAnim.keyTimes = @[@0, @0.00207, @1];
	nextLevelLabelHiddenAnim.duration = 0.1;
	
	CAAnimationGroup * nextLevelLabelClosedAnim = [QCMethod groupAnimations:@[nextLevelLabelHiddenAnim] fillMode:fillMode];
	[self.layers[@"nextLevelLabel"] addAnimation:nextLevelLabelClosedAnim forKey:@"nextLevelLabelClosedAnim"];
}

- (void)addToggleAnimation{
	[self addToggleAnimationCompletionBlock:nil];
}

- (void)addToggleAnimationCompletionBlock:(void (^)(BOOL finished))completionBlock{
	[self addToggleAnimationReverse:NO totalDuration:0.618 endTime:1 completionBlock:completionBlock];
}

- (void)addToggleAnimationReverse:(BOOL)reverseAnimation totalDuration:(CFTimeInterval)totalDuration endTime:(CFTimeInterval)endTime completionBlock:(void (^)(BOOL finished))completionBlock{
	endTime = endTime * totalDuration;
	
	if (completionBlock){
		CABasicAnimation * completionAnim = [CABasicAnimation animationWithKeyPath:@"completionAnim"];;
		completionAnim.duration = endTime;
		completionAnim.delegate = self;
		[completionAnim setValue:@"Toggle" forKey:@"animId"];
		[completionAnim setValue:@(YES) forKey:@"needEndAnim"];
		[self.layer addAnimation:completionAnim forKey:@"Toggle"];
		[self.completionBlocks setObject:completionBlock forKey:[self.layer animationForKey:@"Toggle"]];
	}
	
	if (!reverseAnimation) [self resetLayerPropertiesForLayerIdentifiers:@[@"progressContainer", @"progressIndicatorBackground", @"progressIndicator", @"centerHub", @"star", @"progressPercent", @"nextLevelLabel"]];
	
	self.layer.speed = 1;
	self.animationAdded = NO;
	
	NSString * fillMode = reverseAnimation ? kCAFillModeBoth : kCAFillModeForwards;
	
	////ProgressContainer animation
	CAKeyframeAnimation * progressContainerTransformAnim = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
	progressContainerTransformAnim.values = @[[NSValue valueWithCATransform3D:CATransform3DIdentity], 
		 [NSValue valueWithCATransform3D:CATransform3DMakeScale(0.8, 0.8, 0.8)], 
		 [NSValue valueWithCATransform3D:CATransform3DMakeScale(1.85, 1.85, 1.85)], 
		 [NSValue valueWithCATransform3D:CATransform3DMakeScale(1.62, 1.62, 1.62)]];
	progressContainerTransformAnim.keyTimes = @[@0, @0.0813, @0.69, @1];
	progressContainerTransformAnim.duration = totalDuration;
	progressContainerTransformAnim.timingFunction = [CAMediaTimingFunction functionWithControlPoints:0.298 :0.157 :0.659 :1.58];
	
	CAAnimationGroup * progressContainerToggleAnim = [QCMethod groupAnimations:@[progressContainerTransformAnim] fillMode:fillMode];
	if (reverseAnimation) progressContainerToggleAnim = (CAAnimationGroup *)[QCMethod reverseAnimation:progressContainerToggleAnim totalDuration:totalDuration];
	[self.layers[@"progressContainer"] addAnimation:progressContainerToggleAnim forKey:@"progressContainerToggleAnim"];
	
	////ProgressIndicatorBackground animation
	CAKeyframeAnimation * progressIndicatorBackgroundTransformAnim = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
	progressIndicatorBackgroundTransformAnim.values = @[[NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI, 0, 0, -1)], 
		 [NSValue valueWithCATransform3D:CATransform3DConcat(CATransform3DMakeScale(0.8, 0.8, 0.8), CATransform3DMakeRotation(-M_PI, 0, 0, 1))], 
		 [NSValue valueWithCATransform3D:CATransform3DConcat(CATransform3DMakeScale(1.85, 1.85, 1.85), CATransform3DMakeRotation(-M_PI, 0, 0, 1))], 
		 [NSValue valueWithCATransform3D:CATransform3DConcat(CATransform3DMakeScale(1.62, 1.62, 1.62), CATransform3DMakeRotation(-M_PI, 0, 0, 1))]];
	progressIndicatorBackgroundTransformAnim.keyTimes = @[@0, @0.0813, @0.69, @1];
	progressIndicatorBackgroundTransformAnim.duration = totalDuration;
	progressIndicatorBackgroundTransformAnim.timingFunction = [CAMediaTimingFunction functionWithControlPoints:0.298 :0.157 :0.659 :1.58];
	
	CAKeyframeAnimation * progressIndicatorBackgroundStrokeStartAnim = [CAKeyframeAnimation animationWithKeyPath:@"strokeStart"];
	progressIndicatorBackgroundStrokeStartAnim.values = @[@0.37, @0.33];
	progressIndicatorBackgroundStrokeStartAnim.keyTimes = @[@0, @1];
	progressIndicatorBackgroundStrokeStartAnim.duration = 0.214 * totalDuration;
	progressIndicatorBackgroundStrokeStartAnim.beginTime = 0.177 * totalDuration;
	
	CAKeyframeAnimation * progressIndicatorBackgroundStrokeEndAnim = [CAKeyframeAnimation animationWithKeyPath:@"strokeEnd"];
	progressIndicatorBackgroundStrokeEndAnim.values = @[@0.63, @0.67];
	progressIndicatorBackgroundStrokeEndAnim.keyTimes = @[@0, @1];
	progressIndicatorBackgroundStrokeEndAnim.duration = 0.214 * totalDuration;
	progressIndicatorBackgroundStrokeEndAnim.beginTime = 0.177 * totalDuration;
	
	CAAnimationGroup * progressIndicatorBackgroundToggleAnim = [QCMethod groupAnimations:@[progressIndicatorBackgroundTransformAnim, progressIndicatorBackgroundStrokeStartAnim, progressIndicatorBackgroundStrokeEndAnim] fillMode:fillMode];
	if (reverseAnimation) progressIndicatorBackgroundToggleAnim = (CAAnimationGroup *)[QCMethod reverseAnimation:progressIndicatorBackgroundToggleAnim totalDuration:totalDuration];
	[self.layers[@"progressIndicatorBackground"] addAnimation:progressIndicatorBackgroundToggleAnim forKey:@"progressIndicatorBackgroundToggleAnim"];
	
	////ProgressIndicator animation
	CAKeyframeAnimation * progressIndicatorTransformAnim = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
	progressIndicatorTransformAnim.values = @[[NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI, 0, 0, -1)], 
		 [NSValue valueWithCATransform3D:CATransform3DConcat(CATransform3DMakeScale(0.8, 0.8, 0.8), CATransform3DMakeRotation(-M_PI, 0, 0, 1))], 
		 [NSValue valueWithCATransform3D:CATransform3DConcat(CATransform3DMakeScale(1.85, 1.85, 1.85), CATransform3DMakeRotation(-M_PI, 0, 0, 1))], 
		 [NSValue valueWithCATransform3D:CATransform3DConcat(CATransform3DMakeScale(1.62, 1.62, 1.62), CATransform3DMakeRotation(-M_PI, 0, 0, 1))]];
	progressIndicatorTransformAnim.keyTimes = @[@0, @0.0813, @0.69, @1];
	progressIndicatorTransformAnim.duration = totalDuration;
	progressIndicatorTransformAnim.timingFunction = [CAMediaTimingFunction functionWithControlPoints:0.298 :0.157 :0.659 :1.58];
	
	CAKeyframeAnimation * progressIndicatorStrokeEndAnim = [CAKeyframeAnimation animationWithKeyPath:@"strokeEnd"];
	progressIndicatorStrokeEndAnim.values = @[@0.63, @0.67];
	progressIndicatorStrokeEndAnim.keyTimes = @[@0, @1];
	progressIndicatorStrokeEndAnim.duration = 0.214 * totalDuration;
	progressIndicatorStrokeEndAnim.beginTime = 0.177 * totalDuration;
	
	CAAnimationGroup * progressIndicatorToggleAnim = [QCMethod groupAnimations:@[progressIndicatorTransformAnim, progressIndicatorStrokeEndAnim] fillMode:fillMode];
	if (reverseAnimation) progressIndicatorToggleAnim = (CAAnimationGroup *)[QCMethod reverseAnimation:progressIndicatorToggleAnim totalDuration:totalDuration];
	[self.layers[@"progressIndicator"] addAnimation:progressIndicatorToggleAnim forKey:@"progressIndicatorToggleAnim"];
	
	////CenterHub animation
	CAKeyframeAnimation * centerHubTransformAnim = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
	centerHubTransformAnim.values         = @[[NSValue valueWithCATransform3D:CATransform3DIdentity], 
		 [NSValue valueWithCATransform3D:CATransform3DMakeScale(1, -1, 1)], 
		 [NSValue valueWithCATransform3D:CATransform3DMakeScale(1.2, -1.36, 1)], 
		 [NSValue valueWithCATransform3D:CATransform3DMakeScale(1, -1, 1)]];
	centerHubTransformAnim.keyTimes       = @[@0, @0.742, @0.852, @1];
	centerHubTransformAnim.duration       = 0.656 * totalDuration;
	centerHubTransformAnim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
	
	CAKeyframeAnimation * centerHubFillColorAnim = [CAKeyframeAnimation animationWithKeyPath:@"fillColor"];
	centerHubFillColorAnim.values   = @[(id)[UIColor colorWithRed:0.0118 green: 0.663 blue:0.957 alpha:1].CGColor, 
		 (id)[UIColor colorWithRed:0.31 green: 0.765 blue:0.969 alpha:1].CGColor, 
		 (id)[UIColor colorWithRed:0.0118 green: 0.663 blue:0.957 alpha:1].CGColor, 
		 (id)[UIColor colorWithRed:0.31 green: 0.765 blue:0.969 alpha:1].CGColor, 
		 (id)[UIColor colorWithRed:0.31 green: 0.765 blue:0.969 alpha:1].CGColor];
	centerHubFillColorAnim.keyTimes = @[@0, @0.837, @0.296, @0.915, @1];
	centerHubFillColorAnim.duration = 0.374 * totalDuration;
	
	CAAnimationGroup * centerHubToggleAnim = [QCMethod groupAnimations:@[centerHubTransformAnim, centerHubFillColorAnim] fillMode:fillMode];
	if (reverseAnimation) centerHubToggleAnim = (CAAnimationGroup *)[QCMethod reverseAnimation:centerHubToggleAnim totalDuration:totalDuration];
	[self.layers[@"centerHub"] addAnimation:centerHubToggleAnim forKey:@"centerHubToggleAnim"];
	
	////Star animation
	CAKeyframeAnimation * starPositionAnim = [CAKeyframeAnimation animationWithKeyPath:@"position"];
	starPositionAnim.values                = @[[NSValue valueWithCGPoint:CGPointMake(251.355, 187.013)], [NSValue valueWithCGPoint:CGPointMake(342, 98)]];
	starPositionAnim.keyTimes              = @[@0, @1];
	starPositionAnim.duration              = 0.571 * totalDuration;
	starPositionAnim.timingFunction        = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
	
	CAKeyframeAnimation * starTransformAnim = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
	starTransformAnim.values    = @[[NSValue valueWithCATransform3D:CATransform3DIdentity], 
		 [NSValue valueWithCATransform3D:CATransform3DMakeScale(1.62, 1.62, 1)]];
	starTransformAnim.keyTimes  = @[@0, @1];
	starTransformAnim.duration  = 0.359 * totalDuration;
	starTransformAnim.beginTime = 0.331 * totalDuration;
	
	CAAnimationGroup * starToggleAnim = [QCMethod groupAnimations:@[starPositionAnim, starTransformAnim] fillMode:fillMode];
	if (reverseAnimation) starToggleAnim = (CAAnimationGroup *)[QCMethod reverseAnimation:starToggleAnim totalDuration:totalDuration];
	[self.layers[@"star"] addAnimation:starToggleAnim forKey:@"starToggleAnim"];
	
	////ProgressPercent animation
	CAKeyframeAnimation * progressPercentTransformAnim = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
	progressPercentTransformAnim.values   = @[[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.2, 0.2, 0.2)], 
		 [NSValue valueWithCATransform3D:CATransform3DIdentity], 
		 [NSValue valueWithCATransform3D:CATransform3DMakeScale(1.35, 1.35, 1.35)], 
		 [NSValue valueWithCATransform3D:CATransform3DIdentity]];
	progressPercentTransformAnim.keyTimes = @[@0, @0.706, @0.884, @1];
	progressPercentTransformAnim.duration = 0.69 * totalDuration;
	progressPercentTransformAnim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
	
	CAKeyframeAnimation * progressPercentHiddenAnim = [CAKeyframeAnimation animationWithKeyPath:@"hidden"];
	progressPercentHiddenAnim.values   = @[@YES, @NO];
	progressPercentHiddenAnim.keyTimes = @[@0, @1];
	progressPercentHiddenAnim.duration = 0.31 * totalDuration;
	
	CAAnimationGroup * progressPercentToggleAnim = [QCMethod groupAnimations:@[progressPercentTransformAnim, progressPercentHiddenAnim] fillMode:fillMode];
	if (reverseAnimation) progressPercentToggleAnim = (CAAnimationGroup *)[QCMethod reverseAnimation:progressPercentToggleAnim totalDuration:totalDuration];
	[self.layers[@"progressPercent"] addAnimation:progressPercentToggleAnim forKey:@"progressPercentToggleAnim"];
	
	////NextLevelLabel animation
	CAKeyframeAnimation * nextLevelLabelHiddenAnim = [CAKeyframeAnimation animationWithKeyPath:@"hidden"];
	nextLevelLabelHiddenAnim.values   = @[@YES, @NO];
	nextLevelLabelHiddenAnim.keyTimes = @[@0, @1];
	nextLevelLabelHiddenAnim.duration = 0.69 * totalDuration;
	
	CAAnimationGroup * nextLevelLabelToggleAnim = [QCMethod groupAnimations:@[nextLevelLabelHiddenAnim] fillMode:fillMode];
	if (reverseAnimation) nextLevelLabelToggleAnim = (CAAnimationGroup *)[QCMethod reverseAnimation:nextLevelLabelToggleAnim totalDuration:totalDuration];
	[self.layers[@"nextLevelLabel"] addAnimation:nextLevelLabelToggleAnim forKey:@"nextLevelLabelToggleAnim"];
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
	if([identifier isEqualToString:@"Reveal"]){
		[QCMethod updateValueFromPresentationLayerForAnimation:[self.layers[@"progressContainer"] animationForKey:@"progressContainerRevealAnim"] theLayer:self.layers[@"progressContainer"]];
		[QCMethod updateValueFromPresentationLayerForAnimation:[self.layers[@"progressIndicatorBackground"] animationForKey:@"progressIndicatorBackgroundRevealAnim"] theLayer:self.layers[@"progressIndicatorBackground"]];
		[QCMethod updateValueFromPresentationLayerForAnimation:[self.layers[@"progressIndicator"] animationForKey:@"progressIndicatorRevealAnim"] theLayer:self.layers[@"progressIndicator"]];
		[QCMethod updateValueFromPresentationLayerForAnimation:[self.layers[@"centerHub"] animationForKey:@"centerHubRevealAnim"] theLayer:self.layers[@"centerHub"]];
		[QCMethod updateValueFromPresentationLayerForAnimation:[self.layers[@"star"] animationForKey:@"starRevealAnim"] theLayer:self.layers[@"star"]];
		[QCMethod updateValueFromPresentationLayerForAnimation:[self.layers[@"progressPercent"] animationForKey:@"progressPercentRevealAnim"] theLayer:self.layers[@"progressPercent"]];
		[QCMethod updateValueFromPresentationLayerForAnimation:[self.layers[@"nextLevelLabel"] animationForKey:@"nextLevelLabelRevealAnim"] theLayer:self.layers[@"nextLevelLabel"]];
	}
	else if([identifier isEqualToString:@"Dismiss"]){
		[QCMethod updateValueFromPresentationLayerForAnimation:[self.layers[@"progressContainer"] animationForKey:@"progressContainerDismissAnim"] theLayer:self.layers[@"progressContainer"]];
		[QCMethod updateValueFromPresentationLayerForAnimation:[self.layers[@"progressIndicatorBackground"] animationForKey:@"progressIndicatorBackgroundDismissAnim"] theLayer:self.layers[@"progressIndicatorBackground"]];
		[QCMethod updateValueFromPresentationLayerForAnimation:[self.layers[@"progressIndicator"] animationForKey:@"progressIndicatorDismissAnim"] theLayer:self.layers[@"progressIndicator"]];
		[QCMethod updateValueFromPresentationLayerForAnimation:[self.layers[@"centerHub"] animationForKey:@"centerHubDismissAnim"] theLayer:self.layers[@"centerHub"]];
		[QCMethod updateValueFromPresentationLayerForAnimation:[self.layers[@"star"] animationForKey:@"starDismissAnim"] theLayer:self.layers[@"star"]];
		[QCMethod updateValueFromPresentationLayerForAnimation:[self.layers[@"progressPercent"] animationForKey:@"progressPercentDismissAnim"] theLayer:self.layers[@"progressPercent"]];
		[QCMethod updateValueFromPresentationLayerForAnimation:[self.layers[@"nextLevelLabel"] animationForKey:@"nextLevelLabelDismissAnim"] theLayer:self.layers[@"nextLevelLabel"]];
	}
	else if([identifier isEqualToString:@"Closed"]){
		[QCMethod updateValueFromPresentationLayerForAnimation:[self.layers[@"star"] animationForKey:@"starClosedAnim"] theLayer:self.layers[@"star"]];
		[QCMethod updateValueFromPresentationLayerForAnimation:[self.layers[@"progressPercent"] animationForKey:@"progressPercentClosedAnim"] theLayer:self.layers[@"progressPercent"]];
		[QCMethod updateValueFromPresentationLayerForAnimation:[self.layers[@"nextLevelLabel"] animationForKey:@"nextLevelLabelClosedAnim"] theLayer:self.layers[@"nextLevelLabel"]];
	}
	else if([identifier isEqualToString:@"Toggle"]){
		[QCMethod updateValueFromPresentationLayerForAnimation:[self.layers[@"progressContainer"] animationForKey:@"progressContainerToggleAnim"] theLayer:self.layers[@"progressContainer"]];
		[QCMethod updateValueFromPresentationLayerForAnimation:[self.layers[@"progressIndicatorBackground"] animationForKey:@"progressIndicatorBackgroundToggleAnim"] theLayer:self.layers[@"progressIndicatorBackground"]];
		[QCMethod updateValueFromPresentationLayerForAnimation:[self.layers[@"progressIndicator"] animationForKey:@"progressIndicatorToggleAnim"] theLayer:self.layers[@"progressIndicator"]];
		[QCMethod updateValueFromPresentationLayerForAnimation:[self.layers[@"centerHub"] animationForKey:@"centerHubToggleAnim"] theLayer:self.layers[@"centerHub"]];
		[QCMethod updateValueFromPresentationLayerForAnimation:[self.layers[@"star"] animationForKey:@"starToggleAnim"] theLayer:self.layers[@"star"]];
		[QCMethod updateValueFromPresentationLayerForAnimation:[self.layers[@"progressPercent"] animationForKey:@"progressPercentToggleAnim"] theLayer:self.layers[@"progressPercent"]];
		[QCMethod updateValueFromPresentationLayerForAnimation:[self.layers[@"nextLevelLabel"] animationForKey:@"nextLevelLabelToggleAnim"] theLayer:self.layers[@"nextLevelLabel"]];
	}
}

- (void)removeAnimationsForAnimationId:(NSString *)identifier{
	if([identifier isEqualToString:@"Reveal"]){
		[self.layers[@"progressContainer"] removeAnimationForKey:@"progressContainerRevealAnim"];
		[self.layers[@"progressIndicatorBackground"] removeAnimationForKey:@"progressIndicatorBackgroundRevealAnim"];
		[self.layers[@"progressIndicator"] removeAnimationForKey:@"progressIndicatorRevealAnim"];
		[self.layers[@"centerHub"] removeAnimationForKey:@"centerHubRevealAnim"];
		[self.layers[@"star"] removeAnimationForKey:@"starRevealAnim"];
		[self.layers[@"progressPercent"] removeAnimationForKey:@"progressPercentRevealAnim"];
		[self.layers[@"nextLevelLabel"] removeAnimationForKey:@"nextLevelLabelRevealAnim"];
	}
	else if([identifier isEqualToString:@"Dismiss"]){
		[self.layers[@"progressContainer"] removeAnimationForKey:@"progressContainerDismissAnim"];
		[self.layers[@"progressIndicatorBackground"] removeAnimationForKey:@"progressIndicatorBackgroundDismissAnim"];
		[self.layers[@"progressIndicator"] removeAnimationForKey:@"progressIndicatorDismissAnim"];
		[self.layers[@"centerHub"] removeAnimationForKey:@"centerHubDismissAnim"];
		[self.layers[@"star"] removeAnimationForKey:@"starDismissAnim"];
		[self.layers[@"progressPercent"] removeAnimationForKey:@"progressPercentDismissAnim"];
		[self.layers[@"nextLevelLabel"] removeAnimationForKey:@"nextLevelLabelDismissAnim"];
	}
	else if([identifier isEqualToString:@"Closed"]){
		[self.layers[@"star"] removeAnimationForKey:@"starClosedAnim"];
		[self.layers[@"progressPercent"] removeAnimationForKey:@"progressPercentClosedAnim"];
		[self.layers[@"nextLevelLabel"] removeAnimationForKey:@"nextLevelLabelClosedAnim"];
	}
	else if([identifier isEqualToString:@"Toggle"]){
		[self.layers[@"progressContainer"] removeAnimationForKey:@"progressContainerToggleAnim"];
		[self.layers[@"progressIndicatorBackground"] removeAnimationForKey:@"progressIndicatorBackgroundToggleAnim"];
		[self.layers[@"progressIndicator"] removeAnimationForKey:@"progressIndicatorToggleAnim"];
		[self.layers[@"centerHub"] removeAnimationForKey:@"centerHubToggleAnim"];
		[self.layers[@"star"] removeAnimationForKey:@"starToggleAnim"];
		[self.layers[@"progressPercent"] removeAnimationForKey:@"progressPercentToggleAnim"];
		[self.layers[@"nextLevelLabel"] removeAnimationForKey:@"nextLevelLabelToggleAnim"];
	}
	self.layer.speed = 1;
}

- (void)removeAllAnimations{
	[self.layers enumerateKeysAndObjectsUsingBlock:^(id key, CALayer *layer, BOOL *stop) {
		[layer removeAllAnimations];
	}];
	self.layer.speed = 1;
}

#pragma mark - Bezier Path

- (UIBezierPath*)progressContainerPath{
	UIBezierPath * progressContainerPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, 220, 220)];
	return progressContainerPath;
}

- (UIBezierPath*)progressIndicatorBackgroundPath{
	UIBezierPath *progressIndicatorBackgroundPath = [UIBezierPath bezierPath];
	[progressIndicatorBackgroundPath moveToPoint:CGPointMake(100, 0)];
	[progressIndicatorBackgroundPath addCurveToPoint:CGPointMake(0, 100) controlPoint1:CGPointMake(44.772, 0) controlPoint2:CGPointMake(0, 44.772)];
	[progressIndicatorBackgroundPath addCurveToPoint:CGPointMake(100, 200) controlPoint1:CGPointMake(0, 155.228) controlPoint2:CGPointMake(44.772, 200)];
	[progressIndicatorBackgroundPath addCurveToPoint:CGPointMake(200, 100) controlPoint1:CGPointMake(155.228, 200) controlPoint2:CGPointMake(200, 155.228)];
	[progressIndicatorBackgroundPath addCurveToPoint:CGPointMake(100, 0) controlPoint1:CGPointMake(200, 44.772) controlPoint2:CGPointMake(155.228, 0)];
	
	return progressIndicatorBackgroundPath;
}

- (UIBezierPath*)progressIndicatorPath{
	UIBezierPath *progressIndicatorPath = [UIBezierPath bezierPath];
	[progressIndicatorPath moveToPoint:CGPointMake(100, 0)];
	[progressIndicatorPath addCurveToPoint:CGPointMake(0, 100) controlPoint1:CGPointMake(44.772, 0) controlPoint2:CGPointMake(0, 44.772)];
	[progressIndicatorPath addCurveToPoint:CGPointMake(100, 200) controlPoint1:CGPointMake(0, 155.228) controlPoint2:CGPointMake(44.772, 200)];
	[progressIndicatorPath addCurveToPoint:CGPointMake(200, 100) controlPoint1:CGPointMake(155.228, 200) controlPoint2:CGPointMake(200, 155.228)];
	[progressIndicatorPath addCurveToPoint:CGPointMake(100, 0) controlPoint1:CGPointMake(200, 44.772) controlPoint2:CGPointMake(155.228, 0)];
	
	return progressIndicatorPath;
}

- (UIBezierPath*)toolBarPath{
	UIBezierPath * toolBarPath = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, 649, 44)];
	return toolBarPath;
}

- (UIBezierPath*)centerHubPath{
	UIBezierPath *centerHubPath = [UIBezierPath bezierPath];
	[centerHubPath moveToPoint:CGPointMake(0, 27.841)];
	[centerHubPath addCurveToPoint:CGPointMake(65.087, 0) controlPoint1:CGPointMake(16.388, 10.686) controlPoint2:CGPointMake(39.489, 0)];
	[centerHubPath addCurveToPoint:CGPointMake(130.174, 27.841) controlPoint1:CGPointMake(90.684, 0) controlPoint2:CGPointMake(113.786, 10.686)];
	[centerHubPath addLineToPoint:CGPointMake(0, 27.841)];
	[centerHubPath closePath];
	[centerHubPath moveToPoint:CGPointMake(0, 27.841)];
	
	return centerHubPath;
}


@end
