//
//  TopAlbumListViewController.h
//  TestTopBandAlbums-ObjectiveC
//
//  Created by Gines Sanchez Merono on 2020-04-22.
//  Copyright © 2020 Ginés Sanchez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TopAlbumsListViewModel.h"
#import "TopAlbumsListDelegates.h"

NS_ASSUME_NONNULL_BEGIN

@interface TopAlbumListViewController : UIViewController

@property (nonatomic) id<TopAlbumListViewControllerDelegate> viewModel;

@end

NS_ASSUME_NONNULL_END
