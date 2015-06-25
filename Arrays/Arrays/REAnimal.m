//
//  Animal.m
//  Arrays
//
//  Created by Evgeniy Roldukhin on 6/25/15.
//  Copyright (c) 2015 Evgeniy Roldukhin. All rights reserved.
//

#import "REAnimal.h"

@implementation REAnimal

- (NSString *)description {
    return [NSString stringWithFormat:@"%@", self.nickname];
}

- (void) move {
    NSLog(@"Animal: %@ Move zzz... zzz... zzz...", self.nickname);
}

@end
