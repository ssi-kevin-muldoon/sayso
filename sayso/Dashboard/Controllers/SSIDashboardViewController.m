//
//  SSIDashboardViewController.m
//  sayso
//
//  Created by Kevin Muldoon on 1/17/17.
//  Copyright © 2017 Survey Sampling International, LLC. All rights reserved.
//

#import "SSIDashboardViewController.h"
#import "SSIToolBar+SSI.h"
#import "Activity+CoreDataClass.h"
#import <MagicalRecord/MagicalRecord.h>
#import "SSIActivityTableViewCell.h"

static NSString * const SSIActivityTableViewCellIdentifier = @"SSIActivityTableViewCellIdentifier";

@interface SSIDashboardViewController () <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet SSIToolBar *animatedToolBar;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIButton *button;
@property (strong, nonatomic) NSMutableArray *dataSource;
@end

@implementation SSIDashboardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"saysoNavigationBarLogo"]];
    [self.navigationItem setHidesBackButton:YES];
    [self tableView];

}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self refreshData];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [self.animatedToolBar close];
    [self.animatedToolBar percentValue:@"10%"];
    [self setNeedsStatusBarAppearanceUpdate];

}

- (IBAction)buttonAction:(id)sender {
    
    [self toggleAction:sender];
}

- (void)toggleAction:(id)sender {
    
    _button.tag = _button.tag +1;
    
    if (_button.tag % 2) {
        [self.animatedToolBar addRevealAnimation];
    } else {
        [self.animatedToolBar addDismissAnimation];
    }
}


#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.dataSource count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
//    SSIActivityTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:SSIActivityTableViewCellIdentifier forIndexPath:indexPath];
    
//    [cell.valueLabel setText:@"1"];
//    [cell.typeLabel setText:@"QUIZ"];
//    [cell.pointsLabel setText:@"POINTS"];
//    [cell.titleLabel setText:@"Hey"];
//    [cell.bodyLabel setText:@"There"];
    
//    [cell setNeedsUpdateConstraints];
//    [cell updateConstraintsIfNeeded];
    
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];

    // Configure the cell...
    Activity *activity = [self.dataSource objectAtIndex:indexPath.row];
    cell.textLabel.text = [activity title];
    cell.detailTextLabel.text = [activity summery];
//
    return cell;
}


- (void)refreshData {
    
    [self.dataSource removeAllObjects];
    [self.dataSource addObjectsFromArray:[Activity MR_findAll]];
    [self.tableView reloadData];
}

//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    return UITableViewAutomaticDimension;
//}

- (CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 88;
}

- (UIStatusBarStyle)preferredStatusBarStyle NS_AVAILABLE_IOS(7_0) __TVOS_PROHIBITED { // Defaults to
    return UIStatusBarStyleLightContent;
}

- (BOOL)prefersStatusBarHidden {
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    self.navigationController.navigationBarHidden = NO;
    return NO;
}

- (NSMutableArray *)dataSource {
    if (!_dataSource) {
        _dataSource = [NSMutableArray new];
    }
    return _dataSource;
}

- (UITableView *)tableView {
    
    if (_tableView.tag != INT_MAX) {
        
        _tableView.tag = INT_MAX;
        
        [_tableView setDelegate:self];
        [_tableView setDataSource:(id)self];
        [_tableView setAllowsSelection:YES];
        [_tableView setRowHeight:UITableViewAutomaticDimension];
        [_tableView setEstimatedRowHeight:150.0f];
//        [_tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
        [_tableView registerClass:[SSIActivityTableViewCell class] forCellReuseIdentifier:SSIActivityTableViewCellIdentifier];
//        [_tableView registerClass:[SSIHeaderTableViewCell class] forCellReuseIdentifier:SSIHeaderViewCell];
//        [_tableView registerClass:[SSIMeteringTableViewCell class] forCellReuseIdentifier:SSIMeteringViewCell];
        [_tableView setBackgroundColor:[UIColor clearColor]];
    }
    return _tableView;
}

@end
