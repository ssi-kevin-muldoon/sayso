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
@end

@implementation SSIDashboardViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"saysoNavigationBarLogo"]];
    [self.navigationItem setHidesBackButton:YES];
    [self tableView];
    
    [self performSelector:@selector(changeAbility) withObject:nil afterDelay:3.0f];
    
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

- (IBAction)abilitiesButtonAction:(id)sender {
    NSString *title = @"Levels";
    NSString *message = @"Every 10,000 points earned, levels up and earns a star, redeemable for $10 gift card.";
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
                                       
                                       [alert dismissViewControllerAnimated:YES completion:nil];
                                       
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
    NSLog(@"...%@", activity);

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



@end
