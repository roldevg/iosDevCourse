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

#import "REAJumpers.h"
#import "REASwimmers.h"
#import "REARunners.h"

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
    NSArray* commonArray = [NSArray arrayWithObjects:human, cycler, runner, swimmer, dancer, dog, cat, nil];
    
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
    
    
    NSArray* unsortedArray = [NSArray arrayWithObjects:human, cycler, runner, swimmer, dancer, dog, cat, nil];
    NSArray* sortedArray = [unsortedArray sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        if ([obj1 isKindOfClass:[REAHuman class]] && [obj2 isKindOfClass:[REAHuman class]]) {
            REAHuman* human1 = (REAHuman*) obj1;
            REAHuman* human2 = (REAHuman*) obj2;
            return [[human1 name] compare:[human2 name]];
        } else if ([obj1 isKindOfClass:[REAnimal class]] && [obj2 isKindOfClass:[REAnimal class]]) {
            REAnimal* animal1 = (REAnimal*) obj1;
            REAnimal* animal2 = (REAnimal*) obj2;
            return [[animal1 nickname] compare:[animal2 nickname]];
        } else if ([obj1 isKindOfClass:[REAnimal class]]) {
            return (NSComparisonResult) NSOrderedAscending;
        } else {
            return (NSComparisonResult) NSOrderedSame;
        }
        return true;
    }];
    
    [self testProtocols:sortedArray];
    [self workWithDictionary];
    
    return YES;
}

- (void) workWithDictionary {
    REACycler* cycler1 = [[REACycler alloc] init];
    cycler1.name = @"Lance1";
    cycler1.weight = 70;
    
    REACycler* cycler2 = [[REACycler alloc] init];
    cycler2.name = @"Lance2";
    cycler2.weight = 80;
    
    REACycler* cycler3 = [[REACycler alloc] init];
    cycler3.name = @"Lance3";
    cycler3.weight = 90;
    
    REACycler* cycler4 = [[REACycler alloc] init];
    cycler4.name = @"Lance4";
    cycler4.weight = 100;
    
    REACycler* cycler5 = [[REACycler alloc] init];
    cycler5.name = @"Lance5";
    cycler5.weight = 110;
    
    NSDictionary* cyclersDictionary = [NSDictionary dictionaryWithObjectsAndKeys:
                                       cycler1, cycler1.name,
                                       cycler2, cycler2.name,
                                       cycler3, cycler3.name,
                                       cycler4, cycler4.name,
                                       cycler5, cycler5.name, nil];
    
    NSArray* sortedKeys = [cyclersDictionary keysSortedByValueUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        return [[obj1 name] compare:[obj2 name]];
    }];
    
//    NSSortDescriptor *arrayDesriptorName = [NSSortDescriptor sortDescriptorWithKey:@"self" ascending:YES selector:@selector(localizedCaseInsensitiveCompare:)];
//    NSArray* sortedKeysArray = [[cyclersDictionary allKeys] sortedArrayUsingDescriptors:[NSArray arrayWithObjects:arrayDesriptorName, nil]];
    
    for (id key in sortedKeys) {
        id tempObj = [cyclersDictionary objectForKey:key];
        NSLog(@"%@", tempObj);
    }
    
    NSLog(@"%@", cyclersDictionary);
}

- (void) testProtocols:(NSArray*)array {
    for (id object in array) {
        if ([object conformsToProtocol:@protocol(REAJumpers)]) {
            NSLog(@"New jumper! %@, %@, It can jump to %f. No warm up!", [object class], [object name], [object maxJumpHeight]);
            [object warmUp];
            NSLog(@"Now jump!");
            [object jump];
            if ([object respondsToSelector:@selector(parkour)]) {
                NSLog(@"And look -- the parkour");
                [object parkour];
            }
        }
    }
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
