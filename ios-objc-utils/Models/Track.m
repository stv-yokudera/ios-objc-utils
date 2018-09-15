//
//  Track.m
//  ios-objc-utils
//
//  Created by YukiOkudera on 2018/09/16.
//  Copyright © 2018年 OkuderaYuki. All rights reserved.
//

#import "Track.h"

@interface Track ()

@property (nonatomic, readwrite) NSInteger trackId;
@property (nonatomic, readwrite) NSString *trackName;
@property (nonatomic, readwrite) NSString *artistName;
@property (nonatomic, readwrite) NSString *artworkUrl100;
@end

@implementation Track

- (instancetype)initWithTrackId:(NSInteger)trackId
                           name:(NSString *)name
                     artistName:(NSString *)artistName
                  artworkUrl100:(NSString *)artworkUrl100 {
    
    self = [super init];
    if (self) {
        self.trackId = trackId;
        self.trackName = name;
        self.artistName = artistName;
        self.artworkUrl100 = artworkUrl100;
    }
    return self;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"\ntrackId:%ld\ntrackName:%@\nartistName:%@\nartworkUrl100:%@",
            (long)self.trackId,
            self.trackName,
            self.artistName,
            self.artworkUrl100];
}
@end
