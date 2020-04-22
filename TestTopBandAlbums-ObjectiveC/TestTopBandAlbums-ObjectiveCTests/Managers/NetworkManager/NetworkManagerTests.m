//
//  NetworkManagerTests.m
//  TestTopBandAlbums-ObjectiveCTests
//
//  Created by Gines Sanchez Merono on 2020-04-22.
//  Copyright © 2020 Ginés Sanchez. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NetWorkManager.h"

@interface NetworkManagerTests: XCTestCase

@end

@implementation NetworkManagerTests

NetworkManager *networkManager;

- (void)setUp {
    networkManager = [NetworkManager new];
}

- (void)tearDown {
    networkManager = nil;
}

- (void)testNetworkManager_CreateURLWithoutParameters_Success {
    NSURL *url = [networkManager createURLWithSchema: @"https"
                                             apiHost: @"ws.audioscrobbler.com"
                                                path: @"/2.0/"
                                          parameters: nil];
    XCTAssertTrue([url.absoluteString isEqualToString: @"https://ws.audioscrobbler.com/2.0/"]);
    XCTAssertNil(url.query);
}

- (void)testNetworkManager_CreateURLWithParameters_Success {
    NSURL *url = [networkManager createURLWithSchema: @"https"
                                             apiHost: @"ws.audioscrobbler.com"
                                                path: @"/2.0/"
                                          parameters: @{
                                              @"method": @"artist.gettopalbums",
                                              @"artist": @"h.e.a.t",
                                              @"api_key": @"801b215af974882c6deb0ef9325163a7",
                                              @"format": @"json"
                                          }];

    XCTAssertTrue([url.absoluteString isEqualToString: @"https://ws.audioscrobbler.com/2.0/?format=json&method=artist.gettopalbums&api_key=801b215af974882c6deb0ef9325163a7&artist=h.e.a.t"]);
    XCTAssertNotNil(url.query);
    XCTAssertTrue([url.query isEqualToString: @"format=json&method=artist.gettopalbums&api_key=801b215af974882c6deb0ef9325163a7&artist=h.e.a.t"]);
}
@end
