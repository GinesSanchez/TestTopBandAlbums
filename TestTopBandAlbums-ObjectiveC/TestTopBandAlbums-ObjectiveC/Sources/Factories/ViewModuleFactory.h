//
//  ViewModuleFactory.h
//  TestTopBandAlbums-ObjectiveC
//
//  Created by Gines Sanchez Merono on 2020-04-22.
//  Copyright © 2020 Ginés Sanchez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TopAlbumListViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface ViewModuleFactory : NSObject

-(TopAlbumListViewController *) createTopAlbumListModule;

@end

NS_ASSUME_NONNULL_END
