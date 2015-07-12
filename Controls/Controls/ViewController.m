//
//  ViewController.m
//  Controls
//
//  Created by Evgeniy Roldukhin on 7/11/15.
//  Copyright © 2015 Evgeniy Roldukhin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *infoLbl;
@property (weak, nonatomic) IBOutlet UISlider *redslider;
@property (weak, nonatomic) IBOutlet UISlider *greenSlider;
@property (weak, nonatomic) IBOutlet UISlider *blueSlider;
@property (weak, nonatomic) IBOutlet UISegmentedControl *colorSchemeControl;

- (IBAction)actionSlider:(id)sender;
- (IBAction)actionSwitchEnable:(UISwitch *)sender;

@end

typedef enum {
    REAColorSchemeTypeRGB,
    REAColorSchemeTypeHSV
} REAColorSchemeType ;


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self refreshScreen];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Private methods 
- (void) refreshScreen {
    CGFloat red = self.redslider.value;
    CGFloat green = self.greenSlider.value;
    CGFloat blue = self.blueSlider.value;
    
    self.infoLbl.text = [NSString stringWithFormat:@"{%1.2f, %1.2f, %1.2f}", red, green, blue];
    
    UIColor* color = nil;
    
    if (self.colorSchemeControl.selectedSegmentIndex == REAColorSchemeTypeRGB) {
        color = [UIColor colorWithRed:red green:green blue:blue alpha:1.f];
    } else {
        color = [UIColor colorWithHue:red saturation:green brightness:blue alpha:1.f];
    }
    
    self.view.backgroundColor = color;
}

#pragma mark - Acitons
- (IBAction)actionSlider:(UISlider*)sender {
    [self refreshScreen];
}

- (IBAction)actionSwitchEnable:(UISwitch *)sender {
    self.redslider.enabled = sender.isOn;
    self.greenSlider.enabled = sender.isOn;
    self.blueSlider.enabled = sender.isOn;
    
    // for perfomance use this methods (delay)
    [[UIApplication sharedApplication] beginIgnoringInteractionEvents];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.4f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if ([[UIApplication sharedApplication] isIgnoringInteractionEvents]) {
            [[UIApplication sharedApplication] endIgnoringInteractionEvents];
        }
    });
}
@end
