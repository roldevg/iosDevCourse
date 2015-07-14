//
//  REASettingsViewController.h
//  UITableView
//
//  Created by Evgeniy Roldukhin on 7/12/15.
//  Copyright © 2015 Evgeniy Roldukhin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface REASettingsViewController : UITableViewController <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *loginField;
@property (weak, nonatomic) IBOutlet UILabel *passwordField;
@property (weak, nonatomic) IBOutlet UISegmentedControl *detalizationSegmentControl;
@property (weak, nonatomic) IBOutlet UISwitch *shadowsSwitch;
@property (weak, nonatomic) IBOutlet UISlider *volumeSlider;

- (IBAction)actionTextChange:(UITextField *)sender;
- (IBAction)actionChange:(id)sender;

@end
