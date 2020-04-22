//
//  AbumManagerTests.m
//  TestTopBandAlbums-ObjectiveCTests
//
//  Created by Gines Sanchez Merono on 2020-04-22.
//  Copyright © 2020 Ginés Sanchez. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "AlbumManager.h"

@interface AbumManagerTests : XCTestCase

@end

@implementation AbumManagerTests

AlbumManager *albumManager;

- (void)setUp {
    albumManager = [[AlbumManager alloc] initWithNetworkManager];
}

- (void)tearDown {
    albumManager = nil;
}

- (void)testNetworkManager_getJSON_Success {
    XCTestExpectation *expectation = [self expectationWithDescription:@"asynchronous request"];

    [albumManager getTopAlbumsFromBandName: @"H.e.a.t" completionHandler: ^(NSArray *albumsList, NSError *error) {
        XCTAssertNil(error);
        XCTAssertNotNil(albumsList);

        [expectation fulfill];
    }];

    [self waitForExpectationsWithTimeout: 2.0 handler:nil];

}

//TODO: Add unit tests with mock data.

@end
