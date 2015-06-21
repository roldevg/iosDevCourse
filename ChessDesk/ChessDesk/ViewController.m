//
//  ViewController.m
//  ChessDesk
//
//  Created by Evgeniy Roldukhin on 6/18/15.
//  Copyright (c) 2015 Evgeniy Roldukhin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) UIView *containerForBoard;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self drawBoard];
}

- (void) drawBoard {
    
    CGFloat screenWidth = self.view.bounds.size.width;
    CGFloat screenHeight = self.view.bounds.size.height;
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, (screenHeight/2 - screenWidth/2), screenWidth, screenWidth)];
    self.containerForBoard = view;
    self.containerForBoard.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin |
                                              UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;
    self.containerForBoard.backgroundColor = [UIColor whiteColor];
    self.containerForBoard.layer.borderColor = [UIColor blackColor].CGColor;
    self.containerForBoard.layer.borderWidth = 2.0f;
    [self.view addSubview:self.containerForBoard];
    
    int numberOfCells = 8;
    CGFloat chessBoardWidth = self.containerForBoard.bounds.size.width - 4 * 2; // left and right bounds
    CGFloat chessBoardCellWidth = chessBoardWidth / numberOfCells ;
    
    for (int i = 0; i < 8; i++) {
        for (int j = 0; j < 8; j++) {
            if ((i + j) % 2 == 0) {
                UIView *cellView = [[UIView alloc] initWithFrame:CGRectMake(chessBoardCellWidth * j + 4, chessBoardCellWidth * i + 4,
                                                                            chessBoardCellWidth, chessBoardCellWidth)];
                cellView.backgroundColor = [UIColor blackColor];
                [self.containerForBoard addSubview:cellView];
            }
        }
    }
}

- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation {
    
    CGFloat r = (CGFloat) (arc4random() % 255) / 255.f;
    CGFloat g = (CGFloat) (arc4random() % 255) / 255.f;
    CGFloat b = (CGFloat) (arc4random() % 255) / 255.f;
    
    UIColor *newColor = [UIColor colorWithRed:r green:g blue:b alpha:0.8];
    
    for (UIView *view in self.containerForBoard.subviews) {
        view.backgroundColor = newColor;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
