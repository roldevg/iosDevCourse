//
//  ViewController.m
//  ChessDesk
//
//  Created by Evgeniy Roldukhin on 6/18/15.
//  Copyright (c) 2015 Evgeniy Roldukhin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

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
    
    UIView *containerForBoard = [[UIView alloc] initWithFrame:CGRectMake(0, (screenHeight/2 - screenWidth/2), screenWidth, screenWidth)];
    containerForBoard.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin |
                                         UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;
    containerForBoard.backgroundColor = [UIColor blackColor];
    [self.view addSubview:containerForBoard];
    
    int numberOfCells = 8;
    CGFloat chessBoardWidth = containerForBoard.bounds.size.width - 4 * 2; // left and right bounds
    CGFloat chessBoardCellWidth = chessBoardWidth / numberOfCells ;
    
    for (int i = 0; i < 8; i++) {
        
        for (int j = 0; j < 8; j++) {
            
            UIView *cellView = [[UIView alloc] initWithFrame:CGRectMake(chessBoardCellWidth * i + 4, chessBoardCellWidth * j + 4,
                                                                        chessBoardCellWidth, chessBoardCellWidth)];
            [containerForBoard addSubview:cellView];
            
            if ((i + j) % 2 == 0) {
                cellView.backgroundColor = [UIColor blackColor];
            } else {
                cellView.backgroundColor = [UIColor whiteColor];
            }
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
