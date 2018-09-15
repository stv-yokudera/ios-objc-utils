//
//  ItunesSearchResponse.h
//  ios-objc-utils
//
//  Created by YukiOkudera on 2018/09/16.
//  Copyright © 2018年 OkuderaYuki. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Track.h"

@interface ItunesSearchResponse : NSObject

@property (nonatomic, readonly) NSInteger resultCount;
@property (nonatomic, readonly) NSArray <Track *> *results;

- (instancetype)initWithResponseObject:(id)responseObject;
@end
