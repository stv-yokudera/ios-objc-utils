//
//  Track.h
//  ios-objc-utils
//
//  Created by YukiOkudera on 2018/09/16.
//  Copyright © 2018年 OkuderaYuki. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Track : NSObject

@property (nonatomic, readonly) NSInteger trackId;
@property (nonatomic, readonly) NSString *trackName;
@property (nonatomic, readonly) NSString *artistName;
@property (nonatomic, readonly) NSString *artworkUrl100;

- (instancetype)initWithTrackId:(NSInteger)trackId
                           name:(NSString *)name
                     artistName:(NSString *)artistName
                  artworkUrl100:(NSString *)artworkUrl100;
@end
