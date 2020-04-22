//
//  AlbumManager.h
//  TestTopBandAlbums-ObjectiveC
//
//  Created by Gines Sanchez Merono on 2020-04-22.
//  Copyright © 2020 Ginés Sanchez. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^albumsListResponse)(NSArray * albumsList, NSError * error);

@protocol AlbumManagerType <NSObject>

-(instancetype) initWithNetworkManager;
-(void) getTopAlbumsFromBandName: (NSString *) bandName completionHandler: (albumsListResponse) completion;

@end

NS_ASSUME_NONNULL_BEGIN

@interface AlbumManager : NSObject <AlbumManagerType>

@end

NS_ASSUME_NONNULL_END
