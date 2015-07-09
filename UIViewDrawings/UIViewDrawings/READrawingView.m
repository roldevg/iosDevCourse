//
//  READrawingView.m
//  UIViewDrawings
//
//  Created by Evgeniy Roldukhin on 7/9/15.
//  Copyright (c) 2015 Evgeniy Roldukhin. All rights reserved.
//

#import "READrawingView.h"

@implementation READrawingView

- (void) drawRect:(CGRect)rect {
    
    // [super drawRect:rect];
    NSLog(@"drawRect %@", NSStringFromCGRect(rect));
    
    //[self studyDrawings];
    [self paintManualChessDesk:rect];
    
}

- (void) paintManualChessDesk:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGFloat offset = 50.f;
    CGFloat borderWidth = 4.f;
    
    CGFloat maxBoardSize = MIN(CGRectGetWidth(rect) - offset * 2 - borderWidth * 2,
                               CGRectGetHeight(rect) - offset * 2 - borderWidth * 2);
    
    int cellSize = (int) maxBoardSize / 8;
    int boardSize = cellSize * 8;
    
    CGRect boardRect = CGRectMake((CGRectGetWidth(rect) - boardSize) / 2,
                                 (CGRectGetHeight(rect) - boardSize) / 2,
                                 boardSize, boardSize);
    
    boardRect = CGRectIntegral(boardRect);
    
    for (int i = 0; i < 8; i++) {
        for (int j = 0; j < 8; j++) {
            if (i % 2 != j % 2) {
                CGRect cellRect = CGRectMake(CGRectGetMinX(boardRect) + i * cellSize,
                                             CGRectGetMinY(boardRect) + j * cellSize,
                                             cellSize, cellSize);
                
                CGContextAddRect(context, cellRect);
            }
        }
    }
    
    CGContextSetFillColorWithColor(context, [UIColor grayColor].CGColor);
    CGContextFillPath(context);
    
    CGContextSetFillColorWithColor(context, [UIColor blackColor].CGColor);
    CGContextAddRect(context, boardRect);
    CGContextSetLineCap(context, borderWidth);
    CGContextStrokePath(context);
}

- (void) studyDrawings {
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //CGContextSetFillColorWithColor(context, [UIColor redColor].CGColor);
    CGContextSetStrokeColorWithColor(context, [UIColor redColor].CGColor);
    
    CGRect squareFirst  = CGRectMake(100, 100, 100, 100);
    CGRect squareSecond = CGRectMake(200, 200, 100, 100);
    CGRect squareThird  = CGRectMake(300, 300, 100, 100);
    
    // 1. First
    //CGContextAddRect(context, rect);
    //CGContextFillPath(context);
    
    // 2. Second
    //CGContextFillRect(context, rect);
    
    CGContextAddRect(context, squareFirst);
    CGContextAddRect(context, squareSecond);
    CGContextAddRect(context, squareThird);
    CGContextStrokePath(context);
    
    
    
    CGContextSetFillColorWithColor(context, [UIColor greenColor].CGColor);
    CGContextAddEllipseInRect(context, squareFirst);
    CGContextAddEllipseInRect(context, squareSecond);
    CGContextAddEllipseInRect(context, squareThird);
    CGContextFillPath(context);
    
    
    
    CGContextSetStrokeColorWithColor(context, [UIColor blueColor].CGColor);
    CGContextSetLineWidth(context, 3.f);
    CGContextSetLineCap(context, kCGLineCapRound);
    
    CGContextMoveToPoint(context, CGRectGetMinX(squareFirst), CGRectGetMaxY(squareFirst));
    CGContextAddLineToPoint(context, CGRectGetMinX(squareThird), CGRectGetMaxY(squareThird));
    
    CGContextMoveToPoint(context, CGRectGetMaxX(squareFirst), CGRectGetMinY(squareFirst));
    CGContextAddLineToPoint(context, CGRectGetMaxX(squareThird), CGRectGetMinY(squareThird));
    CGContextStrokePath(context);
    
    
    CGContextMoveToPoint(context, CGRectGetMinX(squareFirst), CGRectGetMaxY(squareFirst));
    CGContextAddArc(context, CGRectGetMaxX(squareFirst), CGRectGetMaxY(squareFirst), CGRectGetWidth(squareFirst),
                    M_PI, M_PI_2, NO);
    CGContextStrokePath(context);
    
    NSString* text = @"text";
    UIFont* font = [UIFont systemFontOfSize:14.f];
    NSShadow* shadow = [[NSShadow alloc] init];
    shadow.shadowOffset = CGSizeMake(1, 1);
    shadow.shadowColor = [UIColor blackColor];
    shadow.shadowBlurRadius = 0.5;
    
    NSDictionary* attributes = [NSDictionary dictionaryWithObjectsAndKeys:
                                [UIColor grayColor], NSForegroundColorAttributeName,
                                font, NSFontAttributeName,
                                shadow, NSShadowAttributeName,
                                nil];
    
    CGSize textize = [text sizeWithAttributes:attributes];
    
    CGRect textRect = CGRectMake(CGRectGetMidX(squareSecond) - textize.width / 2,
                                 CGRectGetMidY(squareSecond) - textize.height / 2,
                                 textize.width, textize.height);
    textRect = CGRectIntegral(textRect);
    [text drawInRect:textRect withAttributes:attributes];
    
    /*[text drawAtPoint:CGPointMake(CGRectGetMidX(squareSecond) - textize.width / 2, CGRectGetMidY(squareSecond) - textize.height / 2)
     withAttributes:attributes];*/

}

@end
