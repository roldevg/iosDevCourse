//
//  REARunners.h
//  Arrays
//
//  Created by Evgeniy Roldukhin on 6/29/15.
//  Copyright (c) 2015 Evgeniy Roldukhin. All rights reserved.
//

#import "UIKit/UIKit.h"

@protocol REARunners <NSObject>

@required
@property (strong, nonatomic) NSString* name;
@property (assign, nonatomic) CGFloat maxJumpHeight;

- (void) jump;
- (void) warmUp;

@optional
-(void) parkour;

@end
