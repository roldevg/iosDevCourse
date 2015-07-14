//
//  REASettingsViewController.m
//  UITableView
//
//  Created by Evgeniy Roldukhin on 7/12/15.
//  Copyright © 2015 Evgeniy Roldukhin. All rights reserved.
//

#import "REASettingsViewController.h"

@interface REASettingsViewController ()

@end


#pragma mark - Constants 

static NSString* kSettingsLogin           = @"login";
static NSString* kSettingsPassword        = @"password";
static NSString* kSettingsDetalization    = @"detalization";
static NSString* kSettingsShadows         = @"shadows";
static NSString* kSettingsVolume          = @"volume";

@implementation REASettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    [self loadSettings];

    NSNotificationCenter* nc = [NSNotificationCenter defaultCenter];
    
    [nc addObserver:self selector:@selector(notificationKeyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [nc addObserver:self selector:@selector(notificationKeyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - Notifications 

- (void) notificationKeyboardWillShow:(NSNotification*) notification {
    NSLog(@"notificationKeyboardWillShow\n%@", notification.userInfo);    
}

- (void) notificationKeyboardWillHide:(NSNotification*) notification {
    NSLog(@"notificationKeyboardWillHide\n%@", notification.userInfo);
}

#pragma mark - Save and Load

- (void) saveSettings {
    NSUserDefaults* userDefaults = [NSUserDefaults standardUserDefaults]; // singleton
    
    [userDefaults setObject:self.loginField.text forKey:kSettingsLogin];
    [userDefaults setObject:self.passwordField.text forKey:kSettingsPassword];
    [userDefaults setInteger:self.detalizationSegmentControl.selectedSegmentIndex forKey:kSettingsDetalization];
    [userDefaults setBool:self.shadowsSwitch.isOn forKey:kSettingsShadows];
    [userDefaults setDouble:self.volumeSlider.value forKey:kSettingsVolume];
    
    [userDefaults synchronize];
}

- (void) loadSettings {
    NSUserDefaults* userDefaults = [NSUserDefaults standardUserDefaults];
    
    self.loginField.text = [userDefaults objectForKey:kSettingsLogin];
    self.passwordField.text = [userDefaults objectForKey:kSettingsPassword];
    
    self.detalizationSegmentControl.selectedSegmentIndex = [userDefaults integerForKey:kSettingsDetalization];
    self.shadowsSwitch.on = [userDefaults boolForKey:kSettingsShadows];
    self.volumeSlider.value = [userDefaults doubleForKey:kSettingsVolume];
}

#pragma mark - Actions

- (IBAction)actionTextChange:(UITextField *)sender {
    [self saveSettings];
}

- (IBAction)actionChange:(id)sender {
    [self saveSettings];
}

#pragma mark - UITextFieldDelegate 

- (BOOL) textFieldShouldReturn:(UITextField *)textField {
    if ([textField isEqual:self.loginField]) {
        [self.passwordField becomeFirstResponder];
    } else {
        [textField resignFirstResponder];
    }
    
    return NO;
}




@end
