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
    NSString* genderText = @"";
    if (self.gender == GenderFemale) {
        genderText = @"female";
    } else {
        genderText = @"male";
    }
    return [NSString stringWithFormat:@"Name: %@, Height: %ld, Weight: %ld, Gender: %@", self.name, self.height, self.weight, genderText];
}

@end
