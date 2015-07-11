//
//  ViewController.m
//  UIControls
//
//  Created by Evgeniy Roldukhin on 7/10/15.
//  Copyright (c) 2015 Evgeniy Roldukhin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

- (IBAction)buttontStoruBoarPressed:(UIButton *)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(200, 200, 200, 200);
    button.backgroundColor = [UIColor yellowColor];
    
    // First method
    //[button setTitle:@"Button" forState:UIControlStateNormal];
    //[button setTitleColor:[UIColor purpleColor] forState:UIControlStateNormal];
    //[button setTitleColor:[UIColor greenColor] forState:UIControlStateHighlighted];
    
    NSDictionary* attributes = @{NSFontAttributeName: [UIFont systemFontOfSize:30],
                                 NSForegroundColorAttributeName: [UIColor orangeColor]};
    NSAttributedString* title = [[NSAttributedString alloc] initWithString:@"Button" attributes:attributes];
    [button setAttributedTitle:title forState:UIControlStateNormal];
    
    // padding
    // UIEdgeInsets insets = UIEdgeInsetsMake(100, 100, 0, 0);
    // button.titleEdgeInsets = insets;
    
    [self.view addSubview:button];
    
    [button addTarget:self action:@selector(actionTestButton:) forControlEvents:UIControlEventTouchUpInside];
    
}

#pragma mark - Actions

- (void) actionTestButton:(UIButton*) button {
    NSLog(@"Button pressed");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttontStoruBoarPressed:(UIButton *)sender {
    
}
@end
