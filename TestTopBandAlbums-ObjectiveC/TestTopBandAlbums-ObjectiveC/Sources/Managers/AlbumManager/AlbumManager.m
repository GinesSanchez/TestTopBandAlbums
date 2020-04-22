//
//  AlbumManager.m
//  TestTopBandAlbums-ObjectiveC
//
//  Created by Gines Sanchez Merono on 2020-04-22.
//  Copyright © 2020 Ginés Sanchez. All rights reserved.
//

#import "AlbumManager.h"
#import "NetworkManager.h"
#import "Album.h"

@interface AlbumManager ()

@property (nonatomic) NetworkManager *networkManager;

@end

@implementation AlbumManager

-(instancetype) initWithNetworkManager {
    self = [super init];

    if (self) {
        self.networkManager = [NetworkManager new];
        return self;
    }

    return nil;
}

-(void) getTopAlbumsFromBandName: (NSString *) bandName completionHandler: (albumsListResponse) completion {
    NSURL *url = [self.networkManager createURLWithSchema: @"https"
                                                  apiHost: @"http://ws.audioscrobbler.com/"
                                                     path: @"/2.0/"
                                               parameters: @{
                                                   @"method": @"artist.gettopalbums",
                                                   @"artist": bandName,
                                                   @"api_key": @"801b215af974882c6deb0ef9325163a7",
                                                   @"format": @"json"
                                               }];

    [self.networkManager getJsonDictionaryFromUrl: url completionHandler: ^(NSDictionary *response, NSError *error) {
        if (response) {
            NSDictionary *topAlbums = response[@"topalbums"];
            NSArray *tempAlbums = topAlbums[@"album"];
            NSMutableArray *albums = [NSMutableArray new];

            [tempAlbums enumerateObjectsUsingBlock: ^(NSDictionary * dictionary, NSUInteger idx, BOOL *stop) {
                Album *album = [[Album alloc] initWithDictionary: dictionary];
                if (album) {
                    [albums addObject: album];
                }
            }];

            completion(albums, nil);
        } else if (error) {
            completion(nil, error);
        }
    }];
}

@end
