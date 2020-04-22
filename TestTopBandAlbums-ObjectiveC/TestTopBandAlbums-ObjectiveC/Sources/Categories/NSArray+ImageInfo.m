//
//  NSArray+ImageInfo.m
//  TestTopBandAlbums-ObjectiveC
//
//  Created by Gines Sanchez Merono on 2020-04-22.
//  Copyright © 2020 Ginés Sanchez. All rights reserved.
//

#import "NSArray+ImageInfo.h"
#import "ImageInfo.h"

@implementation NSArray (ImageInfo)

+(instancetype) arrayWithImageInfoArray: (NSArray *) array {
    if (array) {
        NSMutableArray *tempArray = [NSMutableArray new];
        [array enumerateObjectsUsingBlock: ^(NSDictionary *dictionary, NSUInteger idx, BOOL * stop) {
            ImageInfo *imageInfo = [[ImageInfo alloc] initWithDictionary: dictionary];
            if (imageInfo) {
                [tempArray addObject: imageInfo];
            }
        }];

        return (NSArray *) tempArray;
    }

    return [NSArray new];
}

@end
