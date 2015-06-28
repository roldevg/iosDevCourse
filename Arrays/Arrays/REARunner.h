//
//  Runner.h
//  Arrays
//
//  Created by Evgeniy Roldukhin on 6/23/15.
//  Copyright (c) 2015 Evgeniy Roldukhin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIKit/UIKit.h"
#import "REAHuman.h"

@interface REARunner : REAHuman <REARunners, REAJumpers>

#pragma mark - Runners

@property (assign, nonatomic) READistance favouriteDistance;
@property (strong, nonatomic) NSString* sponsorBrand;

#pragma mark - Jumpers

@property (assign, nonatomic) CGFloat maxJumpHeight;

@end
