//
//  REASwimmers.h
//  Arrays
//
//  Created by Evgeniy Roldukhin on 6/29/15.
//  Copyright (c) 2015 Evgeniy Roldukhin. All rights reserved.
//

#import "READistance.h"

@protocol REASwimmers <NSObject>

@required
@property (strong, nonatomic) NSString* name;
@property (assign, nonatomic) READistance favouriteDistance;
@property (assign, nonatomic) CGFloat timeToHoldBreath;

- (void) swim;
- (void) dive;

@optional
-(void) makeBubbles;

@end