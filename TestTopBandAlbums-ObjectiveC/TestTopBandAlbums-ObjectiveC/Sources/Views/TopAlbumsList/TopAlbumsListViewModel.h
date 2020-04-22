//
//  TopAlbumsListViewModel.h
//  TestTopBandAlbums-ObjectiveC
//
//  Created by Gines Sanchez Merono on 2020-04-22.
//  Copyright © 2020 Ginés Sanchez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AlbumManager.h"
#import "TopAlbumsListDelegates.h"

NS_ASSUME_NONNULL_BEGIN

@protocol TopAlbumsListViewModelType <NSObject>

@property (nonatomic) id <AlbumManagerType> albumManager;

-(instancetype) initWithAlbumManager: (id<AlbumManagerType>) albumManager;

@end

@interface TopAlbumsListViewModel : NSObject <TopAlbumsListViewModelType, TopAlbumListViewControllerDelegate>

@end

NS_ASSUME_NONNULL_END
