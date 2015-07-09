//
//  ViewController.m
//  UIViewDrawings
//
//  Created by Evgeniy Roldukhin on 7/9/15.
//  Copyright (c) 2015 Evgeniy Roldukhin. All rights reserved.
//

#import "ViewController.h"
#import "READrawingView.h"

@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Orientation

- (void) willTransitionToTraitCollection:(UITraitCollection *)newCollection
               withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
    [self.drawingView setNeedsDisplay]; // repaint View
}

@end
