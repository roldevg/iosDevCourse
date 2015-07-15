//
//  ViewController.m
//  UITableViewDynamicCells
//
//  Created by Evgeniy Roldukhin on 7/13/15.
//  Copyright © 2015 Evgeniy Roldukhin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDataSource>
@property(weak, nonatomic) IBOutlet UITableView* table;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIEdgeInsets inset = UIEdgeInsetsMake(20, 0, 0, 0);
    self.table.contentInset = inset;
    self.table.scrollIndicatorInsets = inset;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark UITableViewDataSource<NSObject>

// Default is 1 if not implemented
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    NSLog(@"numberOfSectionsInTableView");
    return [[UIFont familyNames] count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSLog(@"numberOfRowsInSection");
    
    NSArray* familyNames = [UIFont familyNames];
    NSString* familyName = [familyNames objectAtIndex:section];
    NSArray* fontNames = [UIFont fontNamesForFamilyName:familyName];
    
    return [fontNames count];
}

// fixed font style. use custom view (UILabel) if you want something different
- (nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    NSArray* familyNames = [UIFont familyNames];
    NSString* familyName = [familyNames objectAtIndex:section];
    return familyName;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"cellForRowAtIndexPath {%ld %ld}", indexPath.section, (long)indexPath.row);
    
    static NSString* identifier = @"iosDevCourse";

    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        NSLog(@"cell created");
    } else {
        NSLog(@"cell reused");
    }
    
    NSArray* familyNames = [UIFont familyNames];
    NSString* familyName = [familyNames objectAtIndex:indexPath.section];
    NSArray* fontNames = [UIFont fontNamesForFamilyName:familyName];
    NSString* fontName = [fontNames objectAtIndex:indexPath.row];
    cell.textLabel.text = fontName;
    
    UIFont* font = [UIFont fontWithName:fontName size:16];
    cell.textLabel.font = font;
    
    return cell;
}




@end
