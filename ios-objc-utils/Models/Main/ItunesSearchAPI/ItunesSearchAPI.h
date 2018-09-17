//
//  ItunesSearchAPI.h
//  ios-objc-utils
//
//  Created by YukiOkudera on 2018/09/16.
//  Copyright © 2018年 OkuderaYuki. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ItunesSearchResponse.h"

/**
 APIリクエスト結果を通知するプロトコル
 */
@protocol ItunesSearchResult <NSObject>
- (void)itunesSearchResultSuccess:(ItunesSearchResponse *)response;
- (void)itunesSearchResultFailure:(NSString *)errorMessage;
- (void)itunesSearchOffline:(NSString *)message;
@end

@interface ItunesSearchAPI : NSObject

@property (weak, nonatomic) id<ItunesSearchResult> delegate;
- (void)loadWithTerm:(NSString *)term;
@end
