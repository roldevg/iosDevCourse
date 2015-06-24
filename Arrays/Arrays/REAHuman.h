//
//  Human.h
//  Arrays
//
//  Created by Evgeniy Roldukhin on 6/23/15.
//  Copyright (c) 2015 Evgeniy Roldukhin. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    GenderMale = 0,
    GenderFemale = 1
} Gender;

@interface REAHuman : NSObject

@property (weak, nonatomic) NSString* name;
@property (assign, nonatomic) NSUInteger height;
@property (assign, nonatomic) NSUInteger weight;
@property (assign, nonatomic) Gender gender;

- (void) move;

@end
