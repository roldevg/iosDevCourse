//
//  Human.h
//  Arrays
//
//  Created by Evgeniy Roldukhin on 6/23/15.
//  Copyright (c) 2015 Evgeniy Roldukhin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Human : NSObject

@property (weak, nonatomic) NSString* name;
@property (assign, nonatomic) NSUInteger height;
@property (assign, nonatomic) NSUInteger weight;
@property (assign, nonatomic) BOOL sex; // Use ENUM, Luck!

- (void) move;

@end
