//
//  AppDelegate.m
//  Structures
//
//  Created by Evgeniy Roldukhin on 6/28/15.
//  Copyright (c) 2015 Evgeniy Roldukhin. All rights reserved.
//

#import "AppDelegate.h"
#import "READataTypes.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    [self workWithStructures];
    
    [self seeFight];
    
    return YES;
}

- (void) workWithStructures {
    NSString* mainString = @"This is long string";
    NSRange subStringRange = [mainString rangeOfString:@"long"];
    
    NSLog(@"%lu", (unsigned long)subStringRange.location);
    NSLog(@"%lu", (unsigned long)subStringRange.length);
    
    NSString* firstString = @"Hello world!";
    NSString* secondString = @"Hello world!";
    NSString* thirdString = @"Hello world!";
    
    NSString* name = @"John";
    name = [name stringByAppendingString:@"ny"];
    
    NSMutableString* stringName = [NSMutableString stringWithString:@"John"];
    [stringName appendString:@"ny"];
    
    NSLog(@"firstString = %@, secondString = %@, thirdString = %@, name = %@, stringName = %@",
          firstString, secondString, thirdString, name, stringName);
}

- (void) seeFight {
    CGRect android = CGRectMake(3, 3, 3, 3);
    int countNumber = 1;
    int goal = 3;
    while(true) {
        CGPoint pointTemp = CGPointMake((arc4random() % 11), (arc4random() % 11));
        BOOL goalAttempt = CGRectContainsPoint(android, pointTemp);
        if (goalAttempt) {
            NSLog(@"point %ld = %@ wounded enemy android!", (long)countNumber, NSStringFromCGPoint(pointTemp));
            goal--;
        } else {
            NSLog(@"point %ld = %@", (long)countNumber, NSStringFromCGPoint(pointTemp));
        }
        if (goal == 0) {
            NSLog(@"You win! Attempts: %d", countNumber);
            break;
        }
        countNumber++;
    }
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
