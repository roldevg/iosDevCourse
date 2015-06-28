//
//  Runner.m
//  Arrays
//
//  Created by Evgeniy Roldukhin on 6/23/15.
//  Copyright (c) 2015 Evgeniy Roldukhin. All rights reserved.
//

#import "REARunner.h"

@implementation REARunner

- (void) move {
    NSLog(@"Runner runs");
}


#pragma mark - Runners 

- (void) run {
    [self move];
}

- (void) jog {
    NSLog(@"%@: Now i jog, i can do better!", self.name);
}

- (void) goForAnotherPairOfShoes {
    NSLog(@"%@: I go for Nike shoes. ", self.name);
}

#pragma mark - Jumpers

- (void) jump {
    NSLog(@"%@: %@ jumps!", self.name, self.name);
}

- (void) warmUp {
    NSLog(@"%@: Time to warm up, %@", self.name, self.name);
}

- (void) parkour {
    NSLog(@"%@: Parkour is my hidden skill. Glad you found it!", self.name);
}

@end
