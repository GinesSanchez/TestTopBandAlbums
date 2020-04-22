//
//  NetworkManager.h
//  TestTopBandAlbums-ObjectiveC
//
//  Created by Gines Sanchez Merono on 2020-04-22.
//  Copyright © 2020 Ginés Sanchez. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^jsonDictionaryResponse)(NSDictionary * response, NSError *error);
typedef void(^imageResponse)(UIImage *image, NSError *error);

@protocol NetworkManagerType <NSObject>

-(NSURL *) createURLWithSchema: (NSString *) schema apiHost: (NSString *) apiHost path: (NSString *) path parameters: (NSDictionary *) parameters;
-(void) getJsonDictionaryFromUrl: (NSURL *) url completionHandler: (jsonDictionaryResponse) completion;
-(void) getImageFrom: (NSURL *) url completionHandler: (imageResponse) completion;

@end

NS_ASSUME_NONNULL_BEGIN

@interface NetworkManager: NSObject <NetworkManagerType>

@end

NS_ASSUME_NONNULL_END
