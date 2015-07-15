//
//  REAStudent.h
//  TableviewEditing
//
//  Created by Evgeniy Roldukhin on 7/14/15.
//  Copyright © 2015 Evgeniy Roldukhin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface REAStudent : NSObject

@property (strong, nonatomic) NSString* firstName;
@property (strong, nonatomic) NSString* lastName;
@property (assign, nonatomic) CGFloat averageGrade;

+ (REAStudent*) randomStudent;

@end
