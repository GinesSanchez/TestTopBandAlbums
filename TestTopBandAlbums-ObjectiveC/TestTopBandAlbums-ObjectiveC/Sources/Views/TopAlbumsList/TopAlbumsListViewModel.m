//
//  TopAlbumsListViewModel.m
//  TestTopBandAlbums-ObjectiveC
//
//  Created by Gines Sanchez Merono on 2020-04-22.
//  Copyright © 2020 Ginés Sanchez. All rights reserved.
//

#import "TopAlbumsListViewModel.h"

@interface TopAlbumsListViewModel ()

@property (nonatomic) ViewModelState state;
@property (nonatomic) ViewModelEvent event;
@property (nonatomic) dispatch_queue_t syncQueue;
@property (nonatomic) NSArray *albumsArray;

@end

@implementation TopAlbumsListViewModel

@synthesize albumManager;

-(instancetype) initWithAlbumManager: (id<AlbumManagerType>) albumManager {
    self = [super init];
    if (self) {
        self.albumManager = albumManager;
        self.syncQueue = dispatch_queue_create("com.testAlbums.syncQueue", NULL);
        self.albumsArray = [NSArray new];
        self.event = init;
        return self;
    }

    return  nil;
}

//MARK: - DidSet
-(void) setState: (ViewModelState)state {
    _state = state;
    [self performActionForState: state];
}

-(void) setEvent: (ViewModelEvent)event {
    _event = event;
    [self updateStateWithEvent: event];
}

//MARK: - TopAlbumListViewControllerDelegate
-(void) viewDidLoad {
    self.event = viewDidLoad;
}

//MARK: - State Machine
-(void) updateStateWithEvent: (ViewModelEvent) event {
    __weak TopAlbumsListViewModel *weakSelf = self;
    dispatch_sync(self.syncQueue, ^{
        switch (weakSelf.event) {
            case init: {
                weakSelf.state = initialized;
                break;
            }
            case viewDidLoad: {
                weakSelf.state = loading;
                break;
            }
            case didGetEmptyArray: {
                weakSelf.state = empty;
                break;
            }
            case didGetArray: {
                weakSelf.state = ready;
                break;
            }
            case didGetError: {
                weakSelf.state = stateError;
                break;
            }
        }
    });
}

-(void) performActionForState: (ViewModelState) state {
    switch (self.state) {
        case initialized:
            break;
        case loading: {
            __weak TopAlbumsListViewModel *weakSelf = self;
            [self.albumManager getTopAlbumsFromBandName: @"h.e.a.t" completionHandler: ^(NSArray *albumsList, NSError *error) {
                if (albumsList) {
                    if (albumsList == 0) {
                        weakSelf.event = didGetEmptyArray;
                    }
                    weakSelf.albumsArray = albumsList;
                    weakSelf.event = didGetArray;
                } else {
                    weakSelf.event = didGetError;
                }
            }];
            break;
        }
        case ready:
            break;
        case empty:
            break;
        case stateError:
            break;
    }

    [self notifyDidUpdateState: state albumsArray: self.albumsArray];
}

//MARK: - NSNotifications
-(void) notifyDidUpdateState: (ViewModelState) state albumsArray: (NSArray *) array {
    NSNumber *stateNumber = [NSNumber numberWithInt: (int) state];
    NSDictionary *userInfo = @{ @"state": stateNumber,
                                @"albumsArray": array
    };
    [[NSNotificationCenter defaultCenter] postNotificationName: @"didUpdateViewModelState"
                                                        object: nil
                                                      userInfo: userInfo];
}

@end
