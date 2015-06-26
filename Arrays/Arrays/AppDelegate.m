//
//  AppDelegate.m
//  Arrays
//
//  Created by Evgeniy Roldukhin on 6/23/15.
//  Copyright (c) 2015 Evgeniy Roldukhin. All rights reserved.
//

#import "AppDelegate.h"
#import "REAHuman.h"
#import "REACycler.h"
#import "REARunner.h"
#import "REASwimmer.h"
#import "READancer.h"
#import "READog.h"
#import "REACat.h"

#import "Fraction.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    REAHuman* human = [[REAHuman alloc] init];
    human.name = @"Some human";
    human.weight = 100;
    human.height = 180;
    human.gender = GenderFemale;
    [human move];
    
    REACycler* cycler = [[REACycler alloc] init];
    cycler.name = @"Lance Armstrong";
    cycler.weight = 70;
    cycler.height = 170;
    cycler.gender = GenderMale;
    [cycler move];
    
    REARunner* runner = [[REARunner alloc] init];
    runner.name = @"Usain Bolt";
    runner.weight = 72;
    runner.height = 169;
    runner.gender = GenderMale;
    [runner move];
    
    REASwimmer* swimmer = [[REASwimmer alloc] init];
    swimmer.name = @"Michael Phelps";
    swimmer.weight = 76;
    swimmer.height = 1750;
    swimmer.gender = GenderMale;
    [swimmer move];
    
    READancer* dancer = [[READancer alloc] init];
    dancer.name = @"Michael Jackson";
    dancer.weight = 70;
    dancer.height = 170;
    dancer.gender = GenderMale;
    dancer.style = @"Break dance";
    dancer.secondName = @"Joseph";
    [dancer move];
    
    READog* dog = [[READog alloc] init];
    dog.nickname = @"Rex";
    [dog move];
    
    REACat* cat = [[REACat alloc] init];
    cat.nickname = @"Tom";
    [cat move];
    
    NSArray* crowdPeople = [NSArray arrayWithObjects:human, cycler, runner, swimmer, dancer, nil];
    NSArray* animals = [NSArray arrayWithObjects:dog, cat, nil];
    
    /*
    for (NSUInteger i = [crowdPeople count] - 1; i > 0; i--) {
        NSObject* obj = [crowdPeople objectAtIndex:i];
        if ([obj isKindOfClass:[REAHuman class]]) {
            REAHuman* human = (REAHuman*) obj;
            NSLog(@"It's human!");
            NSLog(@"%@", human);
        }
    }*/
    
    NSUInteger countHumans = [crowdPeople count];
    NSUInteger countAnimals = [animals count];
    NSUInteger countCycle = MAX(countHumans, countAnimals);
    
    for (int i = 0; i < countCycle; i++) {
        if (i < countHumans) {
            NSLog(@"%@", [crowdPeople objectAtIndex:i]);
        }
        if (i < countAnimals) {
            NSLog(@"%@", [animals objectAtIndex:i]);
        }
    }
    
    [self fractionTest];
    
    return YES;
}

- (void) fractionTest {
    // Fraction* myFraction = [[Fraction alloc] init];
    Fraction* myFraction = [Fraction new];
    myFraction.numerator = 1;
    myFraction.denominator = 3;
    [myFraction print];
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
