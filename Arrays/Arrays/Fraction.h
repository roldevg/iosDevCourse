//
//  Fraction.h
//  Arrays
//
//  Created by Evgeniy Roldukhin on 6/26/15.
//  Copyright (c) 2015 Evgeniy Roldukhin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Fraction : NSObject

@property (assign, nonatomic) NSInteger numerator;
@property (assign, nonatomic) NSInteger denominator;

- (void) print;

@end
