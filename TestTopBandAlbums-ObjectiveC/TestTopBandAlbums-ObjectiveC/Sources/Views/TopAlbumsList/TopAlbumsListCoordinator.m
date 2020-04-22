//
//  TopAlbumsListCoordinator.m
//  TestTopBandAlbums-ObjectiveC
//
//  Created by Gines Sanchez Merono on 2020-04-22.
//  Copyright © 2020 Ginés Sanchez. All rights reserved.
//

#import "TopAlbumsListCoordinator.h"
#import "TopAlbumListViewController.h"

@implementation TopAlbumsListCoordinator

TopAlbumListViewController *topAlbumListViewController;

@synthesize navigationController;

-(instancetype) initWithNavigationController: (UINavigationController *) navigationController {
    self = [super init];
    if (self) {
        self.navigationController = navigationController;
        return self;
    }

    return nil;
}

- (void) start {
    topAlbumListViewController = [[TopAlbumListViewController alloc]initWithNibName: @"TopAlbumListViewController" bundle:nil];
    [self.navigationController pushViewController: topAlbumListViewController animated: TRUE];
}

- (void) stop {
    [self.navigationController popViewControllerAnimated: TRUE];
    topAlbumListViewController = nil;
}

@end
