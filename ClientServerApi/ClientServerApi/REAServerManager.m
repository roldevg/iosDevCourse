//
//  REAServerManager.m
//  ClientServerApi
//
//  Created by Евгений Ролдухин on 19/07/15.
//  Copyright (c) 2015 Evgeniy Roldukhin. All rights reserved.
//

#import "REAServerManager.h"
#import "AFNetworking.h"
#import "REAUser.h"

@interface REAServerManager()

@property (strong, nonatomic) AFHTTPRequestOperationManager* requestOperationManager;

@end

@implementation REAServerManager

+ (REAServerManager*) shareManager {
    static REAServerManager* manager = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[REAServerManager alloc] init];
    });
    
    return manager;
}

- (id) init {
    self = [super init];
    if (self) {
        NSURL* url = [NSURL URLWithString:@"https://api.vk.com/method/"];
        self.requestOperationManager = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:url];
    }
    return self;
}

- (void) getFriendsWithOffset:(NSInteger) offset
                        count:(NSInteger) count
                    onSuccess:(void(^)(NSArray* friends)) success
                    onFailure:(void(^)(NSError* error, NSInteger statusCode)) failure {
    
    NSDictionary* params = [NSDictionary dictionaryWithObjectsAndKeys:
                            @"581107", @"user_id",
                            @"name", @"order",
                            @(count), @"count",
                            @(offset), @"offset",
                            @"photo_50", @"fields",
                            @"nom", @"name_case",
                            nil];
    
    [self.requestOperationManager GET:@"friends.get"
                            parameters:params
                            success:^(AFHTTPRequestOperation *operation, id responseObject) {
      NSLog(@"JSON: %@", responseObject);

      NSArray* dictsArray = [responseObject objectForKey:@"response"];
                                
      NSMutableArray* objectsArray = [NSMutableArray array];

      for (NSDictionary* dict in dictsArray) {
          REAUser* user = [[REAUser alloc] initWithServerResponse:dict];
          [objectsArray addObject:user];
      }
                                  
     if (success) {
          success(objectsArray);
      }

                                  
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
        
        if (failure) {
            failure(error, operation.response.statusCode);
        }
    }];
}

@end
