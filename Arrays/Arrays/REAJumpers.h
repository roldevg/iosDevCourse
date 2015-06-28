//
//  REAJumpers.h
//  Arrays
//
//  Created by Evgeniy Roldukhin on 6/29/15.
//  Copyright (c) 2015 Evgeniy Roldukhin. All rights reserved.
//

#import "READistance.h"

@protocol REAJumpers <NSObject>

@required

@property (strong, nonatomic) NSString* name;
@property (assign, nonatomic) READistance favouriteDistance;

- (void) run;
- (void) jog;
   
@optional
@property (strong, nonatomic) NSString* sponsorBrand;
-(void) goForAnotherPairOfShoes;
   
@end