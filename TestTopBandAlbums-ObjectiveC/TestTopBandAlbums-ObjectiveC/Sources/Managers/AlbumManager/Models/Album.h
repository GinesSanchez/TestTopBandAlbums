//
//  Album.h
//  TestTopBandAlbums-ObjectiveC
//
//  Created by Gines Sanchez Merono on 2020-04-22.
//  Copyright © 2020 Ginés Sanchez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Artist.h"

NS_ASSUME_NONNULL_BEGIN

@interface Album : NSObject

@property (nonatomic) NSString *name;
@property (nonatomic) NSURL *url;
@property (nonatomic) NSString *mbid;
@property (nonatomic) NSArray *imageUrls;
@property (nonatomic) Artist *artist;

-(instancetype) initWithDictionary: (NSDictionary *) dictionary;

@end

NS_ASSUME_NONNULL_END
