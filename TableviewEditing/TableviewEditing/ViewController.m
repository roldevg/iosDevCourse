//
//  ViewController.m
//  TableviewEditing
//
//  Created by Evgeniy Roldukhin on 7/14/15.
//  Copyright © 2015 Evgeniy Roldukhin. All rights reserved.
//

#import "ViewController.h"
#import "REAStudent.h"
#import "REAGroup.h"

@interface ViewController () <UITableViewDataSource, UITabBarControllerDelegate>
@property (weak, nonatomic) UITableView* tableView;
@property (strong, nonatomic) NSMutableArray* groupsArray;
@end

@implementation ViewController

- (void) loadView {
    [super loadView];
    
    CGRect frame = self.view.bounds;
    frame.origin = CGPointZero;
    
    UITableView* tableView = [[UITableView alloc] initWithFrame:frame style:UITableViewStyleGrouped];
    tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    tableView.delegate = self;
    tableView.dataSource = self;
    
    [self.view addSubview:tableView];
    
    self.tableView = tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.groupsArray = [NSMutableArray array];
    
    
    for (int i = 0; i < (arc4random() % 6 + 5); i++) {
        REAGroup* group = [[REAGroup alloc] init];
        group.name = [NSString stringWithFormat:@"Group # %d", i];
        
        NSMutableArray* array = [NSMutableArray array];
        for (int j = 0; j < (arc4random() % 11 + 15); j++) {
            [array addObject:[REAStudent randomStudent]];
        }
             
        group.students = array;
        [self.groupsArray addObject:group];
    }

    [self.tableView reloadData];
    
    
    // Navigation item
    self.navigationItem.title = @"Students";
    UIBarButtonItem* editBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(actionEdit:)];
    self.navigationItem.rightBarButtonItem = editBtn;
    [self.navigationItem setRightBarButtonItem:editBtn animated:true];
    
    UIBarButtonItem* addBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(actionAddSection:)];
    self.navigationItem.leftBarButtonItem = addBtn;
}

#pragma mark - Actions
- (void) actionEdit:(UIBarButtonItem*) sender {

    NSLog(@"actionEdit");
    
    BOOL isEditing = self.tableView.isEditing;
    
    [self.tableView setEditing:!isEditing animated:NO];
    
    UIBarButtonSystemItem item = UIBarButtonSystemItemEdit;
    if (self.tableView.isEditing) {
        item = UIBarButtonSystemItemDone;
    }
    UIBarButtonItem* editBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:item target:self action:@selector(actionEdit:)];
    self.navigationItem.rightBarButtonItem = editBtn;
}

- (void) actionAddSection:(UIBarButtonItem*) sender {
    REAGroup* group = [[REAGroup alloc] init];
    group.name = [NSString stringWithFormat:@"Group # %lu", [self.groupsArray count] + 1];
    group.students = @[[REAStudent randomStudent], [REAStudent randomStudent]];
    
    NSInteger newSectionIndex = 0;
    [self.groupsArray insertObject:group atIndex:newSectionIndex];

    // 1. First
    // [self.tableView reloadData];
    
    // 2. Second
    [self.tableView beginUpdates];
    NSIndexSet* insertSections = [NSIndexSet indexSetWithIndex:newSectionIndex];
    [self.tableView insertSections:insertSections withRowAnimation:UITableViewRowAnimationFade];
    [self.tableView insertRowsAtIndexPaths:@[] withRowAnimation:UITableViewRowAnimationMiddle];
    [self.tableView endUpdates];
    
    [[UIApplication sharedApplication] beginIgnoringInteractionEvents];
    double delayInSeconds = 0.3;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if ([[UIApplication sharedApplication] isIgnoringInteractionEvents]) {
            [[UIApplication sharedApplication] endIgnoringInteractionEvents];
        }
    });
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    REAGroup* group = [self.groupsArray objectAtIndex:section];
    return [group.students count];
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    
    
    
    if (indexPath.row == 0) {
        static NSString* addStudentIdentifier = @"AddStudentCell";
        
        UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:addStudentIdentifier];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:addStudentIdentifier];
            cell.textLabel.textColor = [UIColor blueColor];
            cell.textLabel.text = @"Add Student";
        }
        return cell;
    } else {
        static NSString* identifier = @"StudentCell";
        
        UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];
        }
        
        
        REAGroup* group = [self.groupsArray objectAtIndex:indexPath.section];
        REAStudent* student = [group.students objectAtIndex:indexPath.row - 1];
        
        //    cell.textLabel.text = [NSString stringWithFormat:@"Section %ld, Row %ld", indexPath.section, (long)indexPath.row];
        //    cell.detailTextLabel.text = @"Value";
        cell.textLabel.text = [NSString stringWithFormat:@"%@ %@", student.firstName, student.lastName];
        cell.detailTextLabel.text = [NSString stringWithFormat:@"%1.2f", student.averageGrade];
        
        if (student.averageGrade >= 4.0) {
            cell.detailTextLabel.textColor = [UIColor greenColor];
        } else if (student.averageGrade >= 3.0) {
            cell.detailTextLabel.textColor = [UIColor orangeColor];
        } else {
            cell.detailTextLabel.textColor = [UIColor redColor];
        }
        
        return cell;
    }
}

// Default is 1 if not implemented
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.groupsArray count];
}

// fixed font style. use custom view (UILabel) if you want something different
- (nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    // return [NSString stringWithFormat:@"Section title %ld in Header", section];
    return [[self.groupsArray objectAtIndex:section] name];
}
- (nullable NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    return [NSString stringWithFormat:@"Section title %ld in Footer", section];
}

- (BOOL) tableView:(nonnull UITableView *)tableView canMoveRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    return indexPath.row > 0 ;
}

- (void) tableView:(nonnull UITableView *)tableView moveRowAtIndexPath:(nonnull NSIndexPath *)sourceIndexPath toIndexPath:(nonnull NSIndexPath *)destinationIndexPath {
    
    REAGroup* group = [self.groupsArray objectAtIndex:sourceIndexPath.section];
    REAStudent* student = [group.students objectAtIndex:sourceIndexPath.row - 1];
    
    NSMutableArray* tempArray = [NSMutableArray arrayWithArray:group.students];

    if (sourceIndexPath.section == destinationIndexPath.section) {
        
        [tempArray exchangeObjectAtIndex:sourceIndexPath.row - 1 withObjectAtIndex:destinationIndexPath.row - 1];
        group.students = tempArray;
        
    } else {
        
        [tempArray removeObject:student];
        group.students = tempArray;
        
        REAGroup* destinationGroup = [self.groupsArray objectAtIndex:destinationIndexPath.section];
        tempArray = [NSMutableArray arrayWithArray:destinationGroup.students];
        [tempArray insertObject:student atIndex:destinationIndexPath.row - 1];
        destinationGroup.students = tempArray;
    }
}

- (void)tableView:(nonnull UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        REAGroup* sourceGroup = [self.groupsArray objectAtIndex:indexPath.section];
        REAStudent* student = [sourceGroup.students objectAtIndex:indexPath.row - 1];
        
        NSMutableArray* tempArray = [NSMutableArray arrayWithArray:sourceGroup.students];
        [tempArray removeObject:student];
        sourceGroup.students = tempArray;
        
        [tableView beginUpdates];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationBottom];
        [tableView endUpdates];
        
        [[UIApplication sharedApplication] beginIgnoringInteractionEvents];
        double delayInSeconds = 0.3;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            if ([[UIApplication sharedApplication] isIgnoringInteractionEvents]) {
                [[UIApplication sharedApplication] endIgnoringInteractionEvents];
            }
        });
    }
}

#pragma mark - UITAbleViewDelegate
- (NSIndexPath*)tableView:(UITableView*)tableView targetIndexPathForMoveFromRowAtIndexPath:(nonnull NSIndexPath *)sourceIndexPath toProposedIndexPath:(nonnull NSIndexPath *)proposedDestinationIndexPath {
    if (proposedDestinationIndexPath.row == 0) {
        return sourceIndexPath;
    } else {
        return proposedDestinationIndexPath;
    }
}

- (void)tableView:(UITableView*) tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.row == 0) {
        REAGroup* group = [self.groupsArray objectAtIndex:indexPath.section];
        NSMutableArray* tempArray = nil;
        
        if (group.students) {
            tempArray = [NSMutableArray arrayWithArray:group.students];
        } else {
            tempArray = [NSMutableArray array];
        }
        
        NSInteger newSectionIndex = 0;
        [tempArray insertObject:[REAStudent randomStudent] atIndex:newSectionIndex];
        group.students = tempArray;
        
        [self.tableView beginUpdates];
        NSIndexPath* newIndexPath = [NSIndexPath indexPathForItem:newSectionIndex + 1 inSection:indexPath.section];
        [self.tableView insertRowsAtIndexPaths:@[newIndexPath] withRowAnimation:UITableViewRowAnimationMiddle];
        [self.tableView endUpdates];
        
        [[UIApplication sharedApplication] beginIgnoringInteractionEvents];
        double delayInSeconds = 0.3;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            if ([[UIApplication sharedApplication] isIgnoringInteractionEvents]) {
                [[UIApplication sharedApplication] endIgnoringInteractionEvents];
            }
        });
    }
}

- (UITableViewCellEditingStyle) tableView:(UITableView*)tableView editingStyleForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    return indexPath.row == 0 ? UITableViewCellEditingStyleNone : UITableViewCellEditingStyleDelete;
}

- (NSString*)tableView:(UITableView*)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    return @"Remove";
}

@end
