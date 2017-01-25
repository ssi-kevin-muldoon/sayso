//
//  SSIActivityTableViewCell.h
//  sayso
//
//  Created by Kevin Muldoon on 1/24/17.
//  Copyright © 2017 Survey Sampling International, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SSIActivityTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *typeLabel;
@property (weak, nonatomic) IBOutlet UILabel *valueLabel;
@property (weak, nonatomic) IBOutlet UILabel *pointsLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *bodyLabel;

@end
