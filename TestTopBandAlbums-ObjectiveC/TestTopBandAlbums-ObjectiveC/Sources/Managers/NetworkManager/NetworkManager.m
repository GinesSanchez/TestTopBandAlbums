//
//  NetworkManager.m
//  TestTopBandAlbums-ObjectiveC
//
//  Created by Gines Sanchez Merono on 2020-04-22.
//  Copyright © 2020 Ginés Sanchez. All rights reserved.
//

#import "NetworkManager.h"

@implementation NetworkManager

- (NSURL *)createURLWithSchema:(NSString *)schema apiHost:(NSString *)apiHost path:(NSString *)path parameters:(NSDictionary *)parameters {
    NSURLComponents *components = [NSURLComponents new];
    components.scheme = schema;
    components.host = apiHost;
    components.path = path;

    if ([parameters count] > 0) {
        NSMutableArray *parametersArray = [NSMutableArray new];
        [parameters enumerateKeysAndObjectsUsingBlock: ^(NSString* key, NSString* obj, BOOL *stop) {
            [parametersArray addObject: [NSURLQueryItem queryItemWithName: key value: obj]];
        }];

        components.queryItems = parametersArray;
    }

    return components.URL;
}

- (void)getJsonDictionaryFromUrl:(NSURL *)url completionHandler:(jsonDictionaryResponse)completion {
    NSURLSessionTask *task = [NSURLSession.sharedSession dataTaskWithURL: url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (data) {
            NSError *jsonParsingError;
            NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData: data options: NSJSONReadingFragmentsAllowed error: &jsonParsingError];
            if (dictionary) {
                completion(dictionary, nil);
            } else if (jsonParsingError) {
                completion(nil, jsonParsingError);
            } else {
                completion(nil, nil);
            }
        } else {
            completion(nil, error);
        }
    }];

    [task resume];
}

- (void)getImageFrom:(NSURL *)url completionHandler:(imageResponse)completion {
    NSURLSessionTask *task = [NSURLSession.sharedSession dataTaskWithURL: url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (data) {
            UIImage *image = [UIImage imageWithData: data];
            if (image) {
                completion(image, nil);
            } else {
                completion(nil, nil);
            }
        } else {
            completion(nil, error);
        }
    }];

    [task resume];
}


@end
