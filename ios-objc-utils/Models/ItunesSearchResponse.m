//
//  ItunesSearchResponse.m
//  ios-objc-utils
//
//  Created by YukiOkudera on 2018/09/16.
//  Copyright © 2018年 OkuderaYuki. All rights reserved.
//

#import "ItunesSearchResponse.h"

@interface ItunesSearchResponse ()

@property (nonatomic, readwrite) NSInteger resultCount;
@property (nonatomic, readwrite) NSArray <Track *> *results;
@end

@implementation ItunesSearchResponse

- (instancetype)initWithResponseObject:(id)responseObject {
    [super self];
    if (self) {

        self.resultCount = [responseObject[@"resultCount"] integerValue];
        NSMutableArray <Track *> *results = [@[] mutableCopy];

        NSArray *resultObjects = [responseObject[@"results"] nullToNil];
        if (resultObjects) {
            for (NSDictionary <NSString *, id> *result in resultObjects) {
                Track *newTrack = [[Track alloc] initWithTrackId:[result[@"trackId"] integerValue]
                                                            name:[result[@"trackName"] nullToNil]
                                                      artistName:[result[@"artistName"] nullToNil]
                                                   artworkUrl100:[result[@"artworkUrl100"] nullToNil]];
                [results addObject:newTrack];
            }
        }

        self.results = results.copy;
    }
    return self;
}
@end
