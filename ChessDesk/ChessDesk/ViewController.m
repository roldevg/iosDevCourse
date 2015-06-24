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
@property (strong, nonatomic) NSMutableArray *fieldsSecondColorCells;
@property (strong, nonatomic) NSMutableArray *firstPlayerCheckers;
@property (strong, nonatomic) NSMutableArray *secondPlayerCheckers;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.fieldsSecondColorCells = [NSMutableArray array];
    self.firstPlayerCheckers = [NSMutableArray array];
    self.secondPlayerCheckers = [NSMutableArray array];
    
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
    CGFloat chessBoardCellWidth = chessBoardWidth / numberOfCells;
    
    for (int i = 0; i < 8; i++) {
        for (int j = 0; j < 8; j++) {
            if ((i + j) % 2 == 0) {
                UIView *cellView = [[UIView alloc] initWithFrame:CGRectMake(chessBoardCellWidth * j + 4, chessBoardCellWidth * i + 4,
                                                                            chessBoardCellWidth, chessBoardCellWidth)];
                cellView.backgroundColor = [UIColor blackColor];
                [self.containerForBoard addSubview:cellView];
                [self.fieldsSecondColorCells addObject:cellView];
            }
        }
    }
    
    // draw checkers
    for (int i = 0; i < 8; i++) {
        for (int j = 0; j < 8; j++) {
            if ((i + j) % 2 == 0) {
                CGFloat originForChecker = chessBoardCellWidth * 0.2;
                UIView *squareView = [[UIView alloc] initWithFrame:CGRectMake(chessBoardCellWidth * j + 4 + originForChecker, chessBoardCellWidth * i + 4 + originForChecker,
                                                                              chessBoardCellWidth - originForChecker * 2, chessBoardCellWidth - originForChecker * 2)];
                squareView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin |
                                              UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;
                squareView.layer.cornerRadius = chessBoardCellWidth * 0.3;
                
                if (i < 3) {
                    squareView.backgroundColor = [UIColor redColor];
                    [self.containerForBoard addSubview:squareView];
                    [self.firstPlayerCheckers addObject:squareView];
                } else if (i > 4) {
                    squareView.backgroundColor = [UIColor greenColor];
                    [self.containerForBoard addSubview:squareView];
                    [self.secondPlayerCheckers addObject:squareView];
                }
            }
        }
    }
}

- (void) swapCheckers:(UIView*) checkerFirst and:(UIView*) checkerSecond {
    [UIView animateWithDuration:1 animations:^{
        CGRect frameFirst = checkerFirst.frame;
        CGRect frameSecond = checkerSecond.frame;
        
        [self.containerForBoard bringSubviewToFront:checkerFirst];
        checkerFirst.frame = frameSecond;
        
        [self.containerForBoard bringSubviewToFront:checkerSecond];
        checkerSecond.frame = frameFirst;
    }];
}

- (void) swapRandomAmmountOfCheckers {
    NSUInteger countOfSwaps = arc4random() % [self.firstPlayerCheckers count];
    
    for (int i = 0; i < countOfSwaps; i++) {
        [self swapCheckers:[self.firstPlayerCheckers objectAtIndex:i] and:[self.secondPlayerCheckers objectAtIndex:i]];
    }
}

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
    CGFloat r = (CGFloat) (arc4random() % 255) / 255.f;
    CGFloat g = (CGFloat) (arc4random() % 255) / 255.f;
    CGFloat b = (CGFloat) (arc4random() % 255) / 255.f;
    
    UIColor *newColor = [UIColor colorWithRed:r green:g blue:b alpha:0.8];
    
    for (UIView* field in self.fieldsSecondColorCells) {
        field.backgroundColor = newColor;
    }

    [self swapRandomAmmountOfCheckers];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
