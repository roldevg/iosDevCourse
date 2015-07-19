//
//  ViewController.m
//  ClientServerApi
//
//  Created by Евгений Ролдухин on 19/07/15.
//  Copyright (c) 2015 Evgeniy Roldukhin. All rights reserved.
//

#import "ViewController.h"
#import "REAServerManager.h"
#import "REAUser.h"
#import "UIImageView+AFNetworking.h"

@interface ViewController ()

@property (strong, nonatomic) NSMutableArray* friendsArray;

@end

@implementation ViewController

static NSInteger friendInRequest = 5;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.friendsArray = [NSMutableArray array];
    
    [self getFriendsFromServer];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - API 

- (void) getFriendsFromServer {
    [[REAServerManager shareManager]
    getFriendsWithOffset:[self.friendsArray count]
    count:friendInRequest onSuccess:^(NSArray *friends) {
        [self.friendsArray addObjectsFromArray:friends];
        
        NSMutableArray* newPAths = [NSMutableArray array];
        for (int i = (int)[self.friendsArray count] - (int)[friends count]; i < [self.friendsArray count]; i++) {
            [newPAths addObject:[NSIndexPath indexPathForRow:i inSection:0]];
        }
        
        [self.tableView beginUpdates];
        [self.tableView insertRowsAtIndexPaths:newPAths withRowAnimation:UITableViewRowAnimationFade];
        [self.tableView endUpdates];
        
        // [self.tableView reloadData];
    }
    onFailure:^(NSError *error, NSInteger statusCode) {
        NSLog(@"Error: %@, code = %ld", [error localizedDescription], (long)statusCode);
    }];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.friendsArray count] + 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString* identifier = @"Cell";
    
    UITableViewCell* cell = [tableView dequeueReusableHeaderFooterViewWithIdentifier:identifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    if (indexPath.row == [self.friendsArray count]) {
        cell.textLabel.text = @"LOAD MORE";
        cell.imageView.image = nil;
    } else {
        // BAD
        /*NSDictionary* friend = [self.friendsArray objectAtIndex:indexPath.row];
        
        cell.textLabel.text = [NSString stringWithFormat:@"%@ %@",
                               [friend objectForKey:@"first_name"],
                               [friend objectForKey:@"last_name"]];*/
        
        REAUser* friend = [self.friendsArray objectAtIndex:indexPath.row];
        
        cell.textLabel.text = [NSString stringWithFormat:@"%@ %@", friend.firstName, friend.lastName];
        //[cell.imageView setImageWithURL:friend.imageURL];
  
        NSURLRequest * request = [NSURLRequest requestWithURL:friend.imageURL];
        
        __weak UITableViewCell* weakCell = cell;
        
        cell.imageView.image = nil;
        
        [cell.imageView setImageWithURLRequest:request
                              placeholderImage:nil
                                       success:^(NSURLRequest * request, NSHTTPURLResponse * response, UIImage * image) {
                                           weakCell.imageView.image = image;
                                           [weakCell layoutSubviews];
                                       } failure:^(NSURLRequest * request, NSHTTPURLResponse * response, NSError * image) {
                                           
                                       }];

    }
    
    return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.row == [self.friendsArray count]) {
        [self getFriendsFromServer];
    }
}


@end
