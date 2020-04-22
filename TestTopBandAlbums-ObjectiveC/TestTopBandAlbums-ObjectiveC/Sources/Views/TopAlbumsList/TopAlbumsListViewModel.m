//
//  TopAlbumsListViewModel.m
//  TestTopBandAlbums-ObjectiveC
//
//  Created by Gines Sanchez Merono on 2020-04-22.
//  Copyright © 2020 Ginés Sanchez. All rights reserved.
//

#import "TopAlbumsListViewModel.h"

@implementation TopAlbumsListViewModel

@synthesize albumManager;

-(instancetype) initWithAlbumManager: (id<AlbumManagerType>) albumManager {
    self = [super init];
    if (self) {
        self.albumManager = albumManager;
        return self;
    }

    return  nil;
}

@end
