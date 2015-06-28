//
//  READataTypes.h
//  Structures
//
//  Created by Evgeniy Roldukhin on 6/28/15.
//  Copyright (c) 2015 Evgeniy Roldukhin. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef struct {
    float heightOnMeters;
    int weightInKilos;
} Person;

@interface READataTypes : NSObject

@property (assign, nonatomic) Person person;

@end
