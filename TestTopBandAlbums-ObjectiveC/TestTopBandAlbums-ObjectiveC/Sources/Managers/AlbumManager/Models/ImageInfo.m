//
//  ImageInfo.m
//  TestTopBandAlbums-ObjectiveC
//
//  Created by Gines Sanchez Merono on 2020-04-22.
//  Copyright © 2020 Ginés Sanchez. All rights reserved.
//

#import "ImageInfo.h"

@implementation ImageInfo

-(instancetype) initWithDictionary: (NSDictionary *) dictionary {
    self = [super init];

    if (self) {
        NSString *size = dictionary[@"size"];
        NSURL *url = dictionary[@"#text"];

        if (size && url) {
            self.size = size;
            self.url = url;
            return self;
        }
    }

    return nil;
}

@end
