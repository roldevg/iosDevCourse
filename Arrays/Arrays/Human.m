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

- (NSString *)description {
    return [NSString stringWithFormat:@"Name: %@, Height: %ld, Weight: %ld, Sex: %@", self.name, self.height, self.weight, self.sex];
}

@end
