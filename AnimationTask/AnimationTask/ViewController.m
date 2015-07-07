//
//  ViewController.m
//  AnimationTask
//
//  Created by Evgeniy Roldukhin on 7/7/15.
//  Copyright (c) 2015 Evgeniy Roldukhin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (assign, nonatomic) NSInteger squarePiece;
@property (assign, nonatomic) CGFloat marginHeight;
@property (strong, nonatomic) NSMutableArray* arrayView;
@property (strong, nonatomic) NSArray* arrayColor;
@property (assign, nonatomic) UIInterfaceOrientation interfaceOrientation;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.interfaceOrientation = [[UIApplication sharedApplication] statusBarOrientation];
    self.squarePiece = 4;
    self.arrayView = [[NSMutableArray alloc] init];
    self.arrayColor = [NSArray arrayWithObjects:[UIColor redColor],
                                                [UIColor blueColor],
                                                [UIColor greenColor],
                                                [UIColor yellowColor], nil];
    
    CGRect screenBounds = [self.view bounds];
    self.marginHeight = 30;
    NSInteger squareSize = (int)(CGRectGetWidth(screenBounds) - self.marginHeight * (self.squarePiece + 1)) / self.squarePiece;
    
    for (int i = 0; i < self.squarePiece; i++) {
        CGFloat squareMargin = (squareSize + self.marginHeight) * i + self.marginHeight;
        CGRect viewRect = CGRectMake(self.marginHeight, squareMargin, squareSize, squareSize);
        UIView* squareView = [[UIView alloc] initWithFrame:viewRect];
        squareView.backgroundColor = [self.arrayColor objectAtIndex:i];
        [self.arrayView addObject:squareView];
        [self.view addSubview:squareView];
    }
}

- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    for (UIView* viewArray in self.arrayView) {
        NSInteger indexArray = [self.arrayView indexOfObject:viewArray];
        UIViewAnimationOptions animationOptions = indexArray << 16 | 1 << 3 | 1 << 4;
        
        [UIView animateWithDuration:7
                              delay:1.5f
                            options:animationOptions
                         animations:^{
                            CGRect viewBounds = [viewArray bounds];
                            viewArray.center = CGPointMake(CGRectGetHeight(self.view.bounds) - self.marginHeight - CGRectGetHeight(viewBounds) / 2,
                                                           (CGRectGetHeight(viewBounds) + self.marginHeight) * indexArray + self.marginHeight + CGRectGetHeight(viewBounds) / 2);
                            viewArray.backgroundColor = [self.arrayColor objectAtIndex:arc4random() % self.squarePiece];
        }completion:^(BOOL finished) {
            
        }];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
