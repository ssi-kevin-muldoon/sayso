//
//  SSIActivityTableViewCell.m
//  sayso
//
//  Created by Kevin Muldoon on 1/24/17.
//  Copyright © 2017 Survey Sampling International, LLC. All rights reserved.
//

#import "SSIActivityTableViewCell.h"

@interface SSIActivityTableViewCell ()

@property (weak, nonatomic) IBOutlet UIView *containerView;
@property (weak, nonatomic) IBOutlet UIView *bannerView;
@property (weak, nonatomic) IBOutlet UIView *offerView;

@end

@implementation SSIActivityTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    [self setSelectionStyle:UITableViewCellSelectionStyleNone];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    UIView *selectedBackgroundViewContent = [UIView new];
    self.selectedBackgroundView = selectedBackgroundViewContent;
}

- (void)layoutSubviews {
    [super layoutSubviews];

    
//    /* We want the bottom corners of self.contentImageView to be round, not the top. Unfortunately, AutoLayout will
//     not update the CAShapeLayer needed for this effect, so we must update the layer.mask in layoutSubviews. **/
//    
////    CAShapeLayer *newCornerLayer = [self containerViewBoundsPath];
////    self.offerView.layer.mask = newCornerLayer;
////    self.bannerView.layer.mask = newCornerLayer;
//
//    
//    
//    
//    [self layoutBanner];
//    [self layoutOffer];
//
//    
//
//    
//    
//    
//    
////    [self.containerView.layer setCornerRadius:10.0f];
//    //    [self.offerView.layer setCornerRadius:10.0f];
//    
    // drop shadow
    [self.containerView.layer setShadowColor:[UIColor blackColor].CGColor];
    [self.containerView.layer setShadowOpacity:0.2f];
    [self.containerView.layer setShadowRadius:2.0f];
    [self.containerView.layer setShadowOffset:CGSizeMake(2.0f, 2.0f)];
    
}

- (void)layoutBanner {
    UIBezierPath *shapePath = [UIBezierPath bezierPathWithRoundedRect:self.bannerView.bounds
                                                    byRoundingCorners:UIRectCornerBottomLeft | UIRectCornerTopLeft
                                                          cornerRadii:CGSizeMake(8.0f, 8.0f)];
    
    CAShapeLayer *newCornerLayer = [CAShapeLayer layer];
    newCornerLayer.frame = self.bannerView.bounds;
    newCornerLayer.path = shapePath.CGPath;
    self.bannerView.layer.mask = newCornerLayer;
}

- (void)layoutOffer {
    UIBezierPath *shapePath = [UIBezierPath bezierPathWithRoundedRect:self.offerView.bounds
                                                    byRoundingCorners:UIRectCornerBottomRight | UIRectCornerTopRight
                                                          cornerRadii:CGSizeMake(8.0f, 8.0f)];
    
    
    
    CAShapeLayer *newCornerLayer = [CAShapeLayer layer];
    newCornerLayer.frame = self.offerView.bounds;
    newCornerLayer.path = shapePath.CGPath;
    self.offerView.layer.mask = newCornerLayer;
}

- (CAShapeLayer *)containerViewBoundsPath {
    UIBezierPath *shapePath = [UIBezierPath bezierPathWithRoundedRect:self.containerView.bounds
                                 byRoundingCorners:UIRectCornerAllCorners
                                       cornerRadii:CGSizeMake(8.0f, 8.0f)];
    CAShapeLayer *newCornerLayer = [CAShapeLayer layer];
    newCornerLayer.frame = self.containerView.bounds;
    newCornerLayer.path = shapePath.CGPath;
    return newCornerLayer;
}

@end
