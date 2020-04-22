//
//  Artist.m
//  TestTopBandAlbums-ObjectiveC
//
//  Created by Gines Sanchez Merono on 2020-04-22.
//  Copyright © 2020 Ginés Sanchez. All rights reserved.
//

#import "Artist.h"

@implementation Artist

-(instancetype) initWithDictionary: (NSDictionary *) dictionary {
    self = [super init];

    if (self) {
        NSString *name = dictionary[@"name"];
        NSURL *url = dictionary[@"url"];
        NSString *mbid = dictionary[@"mbid"];

        if (name && url && mbid) {
            self.name = name;
            self.url = url;
            self.mbid = mbid;
        }
    }

    return nil;
}

@end
