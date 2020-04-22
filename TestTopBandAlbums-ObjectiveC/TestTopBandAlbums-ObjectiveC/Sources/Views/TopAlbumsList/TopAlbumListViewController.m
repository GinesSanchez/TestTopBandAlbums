//
//  TopAlbumListViewController.m
//  TestTopBandAlbums-ObjectiveC
//
//  Created by Gines Sanchez Merono on 2020-04-22.
//  Copyright © 2020 Ginés Sanchez. All rights reserved.
//

#import "TopAlbumListViewController.h"
#import "Album.h"

@interface TopAlbumListViewController ()

@property (weak, nonatomic) IBOutlet UILabel *messageLabel;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation TopAlbumListViewController

NSArray *albumsArray;

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setUp];
    [self.viewModel viewDidLoad];
}

//MARK: - State Machine
-(void) setUp {
    [self setUpTableView];
    [self setUpNotifications];
    [self setUpNavigationBar];
}

-(void) setUpTableView {
    albumsArray = [NSArray new];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier: @"cell"];
    self.tableView.dataSource = self;
    self.tableView.tableFooterView = [UIView new];
}

-(void) setUpNotifications {
    [[NSNotificationCenter defaultCenter] addObserver: self
                                             selector: @selector(didUpdateViewModelStateWithNotification:)
                                                 name: @"didUpdateViewModelState"
                                               object: nil];
}

-(void) setUpNavigationBar {
    self.title = @"Albums of H.e.a.t";
}

//MARK: - UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [albumsArray count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath: (NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    Album *album = [albumsArray objectAtIndex: indexPath.row];
    cell.textLabel.text = album.name;
    [cell setUserInteractionEnabled: NO];
    return cell;
}

//MARK: - NSNoficationCenter
-(void) didUpdateViewModelStateWithNotification: (NSNotification *) notification {
    if ([[notification name] isEqualToString: @"didUpdateViewModelState"]) {
        ViewModelState state = [notification.userInfo[@"state"] intValue];
        dispatch_async(dispatch_get_main_queue(), ^{
            switch (state) {
                case initialized: {
                    [self.tableView setHidden: true];
                    self.messageLabel.text = nil;
                    break;
                }
                case loading: {
                    [self.tableView setHidden: true];
                    self.messageLabel.text = @"Loading...";
                    break;
                }
                case ready: {
                    self.messageLabel.text = nil;
                    [self.tableView setHidden: false];
                    albumsArray = notification.userInfo[@"albumsArray"];
                    [self.tableView reloadData];
                    break;
                }
                case empty: {
                    [self.tableView setHidden: true];
                    self.messageLabel.text = @"No albums found for this band.";
                    break;
                }
                case stateError: {
                    [self.tableView setHidden: true];
                    self.messageLabel.text = @"An error ocurred. Please, try again later";
                    break;
                }
            }
        });
    }
}



@end
