//
//  Human.m
//  Arrays
//
//  Created by Evgeniy Roldukhin on 6/23/15.
//  Copyright (c) 2015 Evgeniy Roldukhin. All rights reserved.
//

#import "Human.h"

@implementation Human

- (void) move {
    NSLog(@"%@ moves", self.name);
}

- (void)printInfo {
    NSLog(@"Name: %@", self.name);
    NSLog(@"Height: %ld", self.height);
    NSLog(@"Weight: %ld", self.weight);
    NSLog(@"Sex: %@", self.sex);
}

@end
