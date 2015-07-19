//
//  REAUser.h
//  ClientServerApi
//
//  Created by Евгений Ролдухин on 19/07/15.
//  Copyright (c) 2015 Evgeniy Roldukhin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface REAUser : NSObject
@property (strong, nonatomic) NSString* firstName;
@property (strong, nonatomic) NSString* lastName;
@property (strong, nonatomic) NSURL* imageURL;

- (id) initWithServerResponse:(NSDictionary*) responseObject;

@end
