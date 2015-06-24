//
//  AppDelegate.m
//  Arrays
//
//  Created by Evgeniy Roldukhin on 6/23/15.
//  Copyright (c) 2015 Evgeniy Roldukhin. All rights reserved.
//

#import "AppDelegate.h"
#import "Human.h"
#import "Cycler.h"
#import "Runner.h"
#import "Swimmer.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    Human* human = [[Human alloc] init];
    human.name = @"Some human";
    human.weight = 100;
    human.height = 180;
    human.sex = @"male";
    [human move];
    
    Cycler* cycler = [[Cycler alloc] init];
    cycler.name = @"Lance Armstrong";
    cycler.weight = 70;
    cycler.height = 170;
    cycler.sex = @"male";
    [cycler move];
    
    Runner* runner = [[Runner alloc] init];
    runner.name = @"Usain Bolt";
    runner.weight = 72;
    runner.height = 169;
    runner.sex = @"male";
    [runner move];
    
    Swimmer* swimmer = [[Swimmer alloc] init];
    swimmer.name = @"Michael Phelps";
    swimmer.weight = 76;
    swimmer.height = 1750;
    swimmer.sex = @"female";
    [swimmer move];
    
    NSArray* crowdPeople = [NSArray arrayWithObjects:human, cycler, runner, swimmer, nil];
    
    for (int i = 0; i < [crowdPeople count]; i++) {
        Human* human = crowdPeople[i];
        NSLog(@"%@", human);
    }
    
    return YES;
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
