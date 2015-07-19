//
//  REAServerManager.h
//  ClientServerApi
//
//  Created by Евгений Ролдухин on 19/07/15.
//  Copyright (c) 2015 Evgeniy Roldukhin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface REAServerManager : NSObject

+ (REAServerManager*) shareManager;

- (void) getFriendsWithOffset:(NSInteger) offset
                        count:(NSInteger) count
                    onSuccess:(void(^)(NSArray* friends)) success
                    onFailure:(void(^)(NSError* error, NSInteger statusCode)) failure;
@end
