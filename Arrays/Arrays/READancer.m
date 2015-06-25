//
//  READancer.m
//  Arrays
//
//  Created by Evgeniy Roldukhin on 6/25/15.
//  Copyright (c) 2015 Evgeniy Roldukhin. All rights reserved.
//

#import "READancer.h"

@implementation READancer

- (void)move {
    [super move];
    NSLog(@"%@ moves with dancing by style: %@", self.name, self.style);
}

- (NSString *)description {
    NSString* baseDescription = [super description];
    return [NSString stringWithFormat:@"%@, Second name: %@, Style dancing: %@", baseDescription, self.secondName, self.style];
}

@end
