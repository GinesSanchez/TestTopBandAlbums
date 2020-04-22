//
//  Album.m
//  TestTopBandAlbums-ObjectiveC
//
//  Created by Gines Sanchez Merono on 2020-04-22.
//  Copyright © 2020 Ginés Sanchez. All rights reserved.
//

#import "Album.h"
#import "NSArray+ImageInfo.h"

@implementation Album

-(instancetype) initWithDictionary: (NSDictionary *) dictionary {
    self = [super init];

    if (self) {
        NSString *name = dictionary[@"name"];
        NSURL *url = dictionary[@"url"];
        NSString *mbid = dictionary[@"mbid"];
        Artist *artist = [[Artist alloc] initWithDictionary: dictionary[@"artist"]];
        NSArray *imageList = [NSArray arrayWithImageInfoArray: dictionary[@"image"]];

        if (name && url && mbid) {
            self.name = name;
            self.url = url;
            self.mbid = mbid;
            self.artist = artist;
            self.imageUrls = imageList;
        }
    }

    return nil;
}

@end
