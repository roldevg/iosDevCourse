//
//  Fraction.m
//  Arrays
//
//  Created by Evgeniy Roldukhin on 6/26/15.
//  Copyright (c) 2015 Evgeniy Roldukhin. All rights reserved.
//

#import "Fraction.h"

@implementation Fraction

- (void) print {
    NSLog(@"Value: %ld/%ld", (long)self.numerator, (long)self.denominator);
}

@end
