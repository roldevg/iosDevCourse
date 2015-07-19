//
//  REAUser.m
//  ClientServerApi
//
//  Created by Евгений Ролдухин on 19/07/15.
//  Copyright (c) 2015 Evgeniy Roldukhin. All rights reserved.
//

#import "REAUser.h"

@implementation REAUser

- (id) initWithServerResponse:(NSDictionary*) responseObject {
    self = [super init];
    if (self) {
        self.firstName = [responseObject objectForKey:@"first_name"];
        self.lastName = [responseObject objectForKey:@"last_name"];

        NSString* urlString = [responseObject objectForKey:@"photo_50"];
        
        if (urlString) {
            self.imageURL = [NSURL URLWithString:urlString];
        }
    }
    return self;
}

@end
