//
//  SSIDashboardViewController.m
//  sayso
//
//  Created by Kevin Muldoon on 1/17/17.
//  Copyright © 2017 Survey Sampling International, LLC. All rights reserved.
//

#import <MagicalRecord/MagicalRecord.h>
#import <MagicalRecord/NSManagedObject+MagicalFinders.h>

#import "SSIDashboardViewController.h"
#import "SSIActivityTableViewCell.h"
#import "SSIToolBar+SSI.h"
#import "Account+CoreDataProperties.h"
#import "Activity+CoreDataClass.h"
#import "SSIAlertController.h"
#import "UICountingLabel.h"

typedef enum {
    SSIActivityTypeQuiz = 0,
    SSIActivityTypeSurvey = 1,
} SSIActivityType;

static NSString * const SSITableViewCellQuizIdentifier = @"SSITableViewCellQuizIdentifier";
static NSString * const SSITableViewCellSurveyIdentifier = @"SSITableViewCellSurveyIdentifier";
static NSString * const SSINSFetchedResultsControllerCache = nil;

@interface SSIDashboardViewController () <UITableViewDataSource, UITableViewDelegate, NSFetchedResultsControllerDelegate>
@property (weak, nonatomic) IBOutlet SSIToolBar *animatedToolBar;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIButton *button;
@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;

@property (strong, nonatomic) NSManagedObjectContext *context;
@property (weak, nonatomic) IBOutlet UICountingLabel *pointsValueLabel;
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

    [self setRightBarButtonItems];
    [self setLeftBarButtonItems];
}

- (void)setRightBarButtonItems {
    
    UIButton *button =  [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:@"account"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(accountButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [button setFrame:CGRectMake(0, 0, 24, 24)];
    UIBarButtonItem *buttonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    self.navigationItem.rightBarButtonItems = @[buttonItem];
}

- (void)setLeftBarButtonItems {
    
    UIButton *button =  [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:@"hamburger"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(hamburgerButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [button setFrame:CGRectMake(0, 0, 30, 18)];
    UIBarButtonItem *buttonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    self.navigationItem.leftBarButtonItems = @[buttonItem];
}

- (IBAction)accountButtonAction {
    
    NSString *title = @"Account";
    NSString *message = @"Users can access account settings, update demographic data. If not a memeber, invited to become full-members (sign-up). Reminded they win points and badges.";
    NSString *okButtonTitle = @"OK";
    
    SSIAlertController *alert = [SSIAlertController alertWithTitle:title message:message style:SSIAlertViewControllerStyleDefault];
    [alert addAction:[SSIAlertAction title:okButtonTitle
                                     style:SSIAlertActionButtonStyleDefault
                                   handler:^{
                                       
                                       [self changeAbility];
                                       [alert dismissViewControllerAnimated:YES completion:nil];
                                       
                                   }]];
    
    [self presentViewController:alert animated:YES completion:nil];
}

- (IBAction)hamburgerButtonAction {
    
    NSString *title = @"Menu";
    NSString *message = @"Slides the view to right, revealing addt'l actions. Contact us, Privacy, Terms.";
    NSString *okButtonTitle = @"OK";
    
    SSIAlertController *alert = [SSIAlertController alertWithTitle:title message:message style:SSIAlertViewControllerStyleDefault];
    [alert addAction:[SSIAlertAction title:okButtonTitle
                                     style:SSIAlertActionButtonStyleDefault
                                   handler:^{
                                       
                                       [alert dismissViewControllerAnimated:YES completion:nil];
                                       
                                   }]];
    
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)changeAbility {
    
    Account *account = [Account MR_findFirst];
    
    account.email = @"";
    account.entityId = @"";
    account.locale = @"";
    account.ableToJoin = NO;
    account.ableToLogin = NO;
    account.ableToTakeSurveys = NO;
    account.ableToClaim = NO;
    account.sessionId = @"";
    account.ability = 1;
    
    [self.context MR_saveToPersistentStoreAndWait];
    
    [self updateTableView];
}

- (void)foo {
    
    //
    // Need to directly modify the Activity table in order to trigger NSFetchedResultsControllerDelegate methods
    //
    
    Activity *activity = [Activity MR_findFirst];
    
    activity.valueComplete = 100;
    
    [self.context MR_saveToPersistentStoreAndWait];
}

- (void)updateTableView {
    
   self.fetchedResultsController = [Activity MR_fetchAllGroupedBy:nil
                                                 withPredicate:self.predicate
                                                      sortedBy:@"type"
                                                     ascending:NO
                                                      delegate:self];
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

- (IBAction)redeemButtonAction:(id)sender {
    
    NSString *title = @"Redeem";
    NSString *message = @"This is where we'd present all the fabulous prizes. Educate user 'star coins' can be turned into gift cards.";
    NSString *okButtonTitle = @"OK";

    SSIAlertController *alert = [SSIAlertController alertWithTitle:title message:message style:SSIAlertViewControllerStyleDefault];
    [alert addAction:[SSIAlertAction title:okButtonTitle
                                     style:SSIAlertActionButtonStyleDefault
                                   handler:^{
                                       
                                       [alert dismissViewControllerAnimated:YES completion:nil];
                                       
                                   }]];
    
    [self presentViewController:alert animated:YES completion:nil];
    
}

- (IBAction)levelButtonAction:(id)sender {
    
    NSString *title = @"Level";
    NSString *message = @"Users 'level up' with every star coin earned.";
    NSString *okButtonTitle = @"OK";
    
    SSIAlertController *alert = [SSIAlertController alertWithTitle:title message:message style:SSIAlertViewControllerStyleDefault];
    [alert addAction:[SSIAlertAction title:okButtonTitle
                                     style:SSIAlertActionButtonStyleDefault
                                   handler:^{
                                       
                                       [alert dismissViewControllerAnimated:YES completion:nil];
                                       
                                   }]];
    
    [self presentViewController:alert animated:YES completion:nil];
}

- (IBAction)abilitiesButtonAction:(id)sender {
    
    NSString *title = @"Abilities";
    NSString *message = @"Abilities unlocked. Become member : Phase ONE to earn points. Phase TWO can receive surveys worth 5,000 points or more. THREE can unlock notifications for more surveys. FOUR location services for mission surveys. ";
    NSString *okButtonTitle = @"OK";
    
    SSIAlertController *alert = [SSIAlertController alertWithTitle:title message:message style:SSIAlertViewControllerStyleDefault];
    [alert addAction:[SSIAlertAction title:okButtonTitle
                                     style:SSIAlertActionButtonStyleDefault
                                   handler:^{
                                       
                                       [alert dismissViewControllerAnimated:YES completion:nil];
                                       
                                   }]];
    
    [self presentViewController:alert animated:YES completion:nil];
}


- (IBAction)badgesButtonAction:(id)sender {
    
    NSString *title = @"Badges";
    NSString *message = @"Badges shown here, users win badges for 'First Complete', 'First Screen out', 'Shared a quiz'";
    NSString *okButtonTitle = @"OK";
    
    SSIAlertController *alert = [SSIAlertController alertWithTitle:title message:message style:SSIAlertViewControllerStyleDefault];
    [alert addAction:[SSIAlertAction title:okButtonTitle
                                     style:SSIAlertActionButtonStyleDefault
                                   handler:^{
                                       [alert dismissViewControllerAnimated:YES completion:nil];
                                   }]];
    
    [self presentViewController:alert animated:YES completion:nil];
}

- (IBAction)pointsButtonAction:(id)sender {
    NSString *title = @"Points";
    NSString *message = @"Users points never decrement. A point earned is forever. Reinforce users growth story";
    NSString *okButtonTitle = @"OK";
    
    SSIAlertController *alert = [SSIAlertController alertWithTitle:title message:message style:SSIAlertViewControllerStyleDefault];
    [alert addAction:[SSIAlertAction title:okButtonTitle
                                     style:SSIAlertActionButtonStyleDefault
                                   handler:^{
                                       
                                       [alert dismissViewControllerAnimated:YES completion:^{
                                           [self pointsValueLabel];
                                       }];
                                       
                                   }]];
    
    [self presentViewController:alert animated:YES completion:nil];
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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    Activity *activity = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    NSString *m;

    switch (activity.type) {
        case SSIActivityTypeQuiz:
            m = @"QUIZ - User can participate as non-member, share via social networking. If not member, told they will not receive points and invited to become a member.";
            
            break;
        case SSIActivityTypeSurvey:
            m = @"SURVEY -- User can participate as member.";
            break;
            
        default:
            break;
    }
    
    NSString *title = activity.title;
    NSString *message = [NSString stringWithFormat:@"%@", m];
    NSString *okButtonTitle = @"OK";
    
    SSIAlertController *alert = [SSIAlertController alertWithTitle:title message:message style:SSIAlertViewControllerStyleDefault];
    [alert addAction:[SSIAlertAction title:okButtonTitle
                                     style:SSIAlertActionButtonStyleDefault
                                   handler:^{
                                       
                                       [alert dismissViewControllerAnimated:YES completion:nil];
                                       
                                   }]];
    
    [self presentViewController:alert animated:YES completion:nil];
    

}

- (void)refreshData {
    [self.tableView reloadData];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
}

- (UIStatusBarStyle)preferredStatusBarStyle NS_AVAILABLE_IOS(7_0) __TVOS_PROHIBITED { // Defaults to
    return UIStatusBarStyleLightContent;
}

- (BOOL)prefersStatusBarHidden {
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    self.navigationController.navigationBarHidden = NO;
    return NO;
}

- (UITableView *)tableView {
    
    if (_tableView.tag != INT_MAX) {
        _tableView.tag = INT_MAX;
        
        [_tableView setDelegate:self];
        [_tableView setDataSource:(id)self];
        [_tableView setAllowsSelection:YES];
        [_tableView setRowHeight:UITableViewAutomaticDimension];
        [_tableView setEstimatedRowHeight:150.0f];
        [_tableView setContentInset:UIEdgeInsetsMake(5, 0, 50, 0)];
        [self updateTableView];
    }
    return _tableView;
}

- (NSFetchedResultsController *)fetchedResultsController {
    
    if (!_fetchedResultsController) {
        
//        NSFetchRequest *fetchRequest = [Activity MR_requestAllSortedBy:@"type" ascending:NO];
//        [fetchRequest setPredicate : [self predicate] ];
//        [fetchRequest setFetchLimit:20];
//        [fetchRequest setFetchBatchSize:10];
        
//        _fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest
//                                                                        managedObjectContext:self.context
//                                                                          sectionNameKeyPath:nil
//                                                                                   cacheName:SSINSFetchedResultsControllerCache];
        
        _fetchedResultsController = [Activity MR_fetchAllGroupedBy:nil
                                                     withPredicate:self.predicate
                                                          sortedBy:@"type"
                                                         ascending:NO
                                                          delegate:self];
        
//        _fetchedResultsController.delegate = self;
    }

    return _fetchedResultsController;
}

- (NSPredicate *)predicate {
    int16_t ability = [Account MR_findFirst].ability;
    return [NSPredicate predicateWithFormat:@"type <= %i", ability];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [[_fetchedResultsController sections] count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    id sectionInfo = [[_fetchedResultsController sections] objectAtIndex:section];
    return [sectionInfo numberOfObjects];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    SSIActivityTableViewCell *cell;
    Activity *activity = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    switch (activity.type) {
        case SSIActivityTypeQuiz:
            cell = [tableView dequeueReusableCellWithIdentifier:SSITableViewCellQuizIdentifier forIndexPath:indexPath];
            break;
            
        case SSIActivityTypeSurvey:
            cell = [tableView dequeueReusableCellWithIdentifier:SSITableViewCellSurveyIdentifier forIndexPath:indexPath];
            
        default:
            break;
    }
    
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    [numberFormatter setNumberStyle:NSNumberFormatterDecimalStyle];
    NSString *formattedNumberString = [numberFormatter stringFromNumber:[NSNumber numberWithInt:[activity valueComplete]]];
    
    [cell.valueLabel setText: formattedNumberString];
    [cell.titleLabel setText:[activity title]];
    [cell.bodyLabel setText:[activity summery]];
    
    [cell setNeedsUpdateConstraints];
    [cell updateConstraintsIfNeeded];
    
    return cell;
}

- (void)controller:(NSFetchedResultsController *)controller
   didChangeObject:(id)anObject
       atIndexPath:(NSIndexPath *)indexPath
     forChangeType:(NSFetchedResultsChangeType)type
      newIndexPath:(NSIndexPath *)newIndexPath {
    NSLog(@"%lu", type);
    switch (type) {
        case NSFetchedResultsChangeInsert: {
            [self.tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
        }
        case NSFetchedResultsChangeDelete: {
            [self.tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
        }
        case NSFetchedResultsChangeUpdate: {
//            [self configureCell:(TSPToDoCell *)[self.tableView cellForRowAtIndexPath:indexPath] atIndexPath:indexPath];
            break;
        }
        case NSFetchedResultsChangeMove: {
            [self.tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
            [self.tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
        }
    }
}

- (void)controllerWillChangeContent:(NSFetchedResultsController *)controller {
    [self.tableView beginUpdates];
}

- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller {
    [self.tableView endUpdates];
}

- (NSManagedObjectContext *)context {
    if (!_context) {
        _context = [NSManagedObjectContext MR_defaultContext];
    }
    return _context;
}

- (UICountingLabel *)pointsValueLabel {
    if (_pointsValueLabel.tag != INT_MAX) {
        _pointsValueLabel.tag = INT_MAX;
        _pointsValueLabel.format = @"%d";
        _pointsValueLabel.method = UILabelCountingMethodEaseOut;
        [_pointsValueLabel countFrom:0 to:500 withDuration:1.2f];
    }
    return _pointsValueLabel;
}


@end
