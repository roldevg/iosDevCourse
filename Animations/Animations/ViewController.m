//
//  ViewController.m
//  Animations
//
//  Created by Evgeniy Roldukhin on 7/1/15.
//  Copyright (c) 2015 Evgeniy Roldukhin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) UIView* testView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIView* view = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    view.backgroundColor = [UIColor greenColor];
    [self.view addSubview:view];
    
    self.testView = view;
}

- (void) viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [self moveView:self.testView];
}

- (void) moveView:(UIView*) view {
    
    CGRect rect = self.view.bounds;
    rect = CGRectInset(rect, CGRectGetWidth(view.frame), CGRectGetHeight(view.frame));
    
    CGFloat x = arc4random() % (int)CGRectGetWidth(rect) + CGRectGetMinX(rect);
    CGFloat y = arc4random() % (int)CGRectGetHeight(rect) + CGRectGetMinY(rect);
    
    CGFloat newScale = (float)(arc4random() % 151) / 100.f + 0.5f;
    
    // from 0 to 2pi
    CGFloat r = (double)(arc4random() % (int)(M_PI * 2 * 10000)) / 10000 - M_PI;
    
    CGFloat d = (float)(arc4random() % 20001) / 10000 + 2;
    
    [UIView animateWithDuration:d
                          delay:0
                        options:UIViewAnimationOptionCurveLinear // | UIViewAnimationOptionRepeat | UIViewAnimationOptionAutoreverse
                     animations:^{
                         // view.center = CGPointMake(CGRectGetWidth(self.view.bounds) - CGRectGetWidth(view.frame) / 2, 150);
                         view.center = CGPointMake(x, y);
                         
                         CGAffineTransform rotation = CGAffineTransformMakeRotation(r);
                         CGAffineTransform scale  = CGAffineTransformMakeScale(newScale, newScale);
                         CGAffineTransform transform = CGAffineTransformConcat(scale, rotation);
                         view.transform = transform;
                     }
                     completion:^(BOOL finished) {
                         NSLog(@"Animation finished! %d", finished);
                         NSLog(@"\nView frame = %@\nView bounds = %@", NSStringFromCGRect(view.frame), NSStringFromCGRect(view.bounds));
                         
                         __weak UIView* v = view;
                         
                         [self moveView:v];
                     }];
    
    double delayInSeconds = 13;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [view.layer removeAllAnimations];
    });
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
