//
//  ViewModuleFactory.m
//  TestTopBandAlbums-ObjectiveC
//
//  Created by Gines Sanchez Merono on 2020-04-22.
//  Copyright © 2020 Ginés Sanchez. All rights reserved.
//

#import "ViewModuleFactory.h"
#import "TopAlbumsListViewModel.h"

@implementation ViewModuleFactory

-(TopAlbumListViewController *) createTopAlbumListModule {
    TopAlbumsListViewModel *viewModel = [[TopAlbumsListViewModel alloc] initWithAlbumManager: [[AlbumManager alloc] initWithNetworkManager]];
    TopAlbumListViewController * viewController = [[TopAlbumListViewController alloc]initWithNibName: @"TopAlbumListViewController" bundle:nil];
    viewController.viewModel = viewModel;
    return viewController;
}

@end
