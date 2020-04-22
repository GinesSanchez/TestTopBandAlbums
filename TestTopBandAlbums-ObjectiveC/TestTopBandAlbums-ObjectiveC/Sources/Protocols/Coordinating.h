//
//  Coordinating.h
//  TestTopBandAlbums-ObjectiveC
//
//  Created by Gines Sanchez Merono on 2020-04-22.
//  Copyright © 2020 Ginés Sanchez. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol Coordinating <NSObject>

@property (nonatomic) UINavigationController *navigationController;

-(void) start;
-(void) stop;
-(instancetype) initWithNavigationController: (UINavigationController *) navigationController;

@end
