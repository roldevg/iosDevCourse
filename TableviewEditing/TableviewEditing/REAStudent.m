//
//  REAStudent.m
//  TableviewEditing
//
//  Created by Evgeniy Roldukhin on 7/14/15.
//  Copyright © 2015 Evgeniy Roldukhin. All rights reserved.
//

#import "REAStudent.h"

@implementation REAStudent

static NSString* firstNames[] = {
    @"Joe", @"Luis", @"jeckie"
};

static NSString* lastNames[] = {
    @"Kovobanga", @"NogiVRuki", @"Chan"
};

static int namesCount = 3;

+ (REAStudent*) randomStudent {
    REAStudent* student = [[REAStudent alloc] init];
    student.firstName = firstNames[arc4random() % namesCount];
    student.lastName  = lastNames[arc4random() % namesCount];
    student.averageGrade = (CGFloat)(arc4random() % 301 + 200) / 100;
    return student;
}


@end
