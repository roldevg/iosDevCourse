//
//  ViewController.m
//  IBOutlet
//
//  Created by Evgeniy Roldukhin on 6/30/15.
//  Copyright (c) 2015 Evgeniy Roldukhin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
    
    CGFloat r = (CGFloat) (arc4random() % 255) / 255.f;
    CGFloat g = (CGFloat) (arc4random() % 255) / 255.f;
    CGFloat b = (CGFloat) (arc4random() % 255) / 255.f;
    
    UIColor *newColor = [UIColor colorWithRed:r green:g blue:b alpha:0.8];
    
    for (UIView* cellBlack in self.blackCells) {
        cellBlack.backgroundColor = newColor;
    }
    
    /*for (int i = 0; i < [self.blackCells count]; i++) {
        UIView* cellView = [self.blackCells objectAtIndex:i];
        cellView.backgroundColor = newColor;
    }*/
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
