//
//  ItunesSearchAPI.m
//  ios-objc-utils
//
//  Created by YukiOkudera on 2018/09/16.
//  Copyright © 2018年 OkuderaYuki. All rights reserved.
//

#import "ItunesSearchAPI.h"
#import "APIClient.h"

static NSString * const ItunesSearchAPIOfflineMSG = @"通信環境の良い場所で再度お試しください。";
static NSString * const ItunesSearchAPIErrorMSG = @"検索に失敗しました。";

@implementation ItunesSearchAPI

- (void)loadWithTerm:(NSString *)term {

    // ネットワーク接続状態確認
    if (![APIClient isReachable]) {
        [self.delegate itunesSearchOffline:ItunesSearchAPIOfflineMSG];
        return;
    }

    __weak typeof(self) wself = self;
    [APIClient getRequestWithUrlString:[self urlString]
                            parameters:[self parametersWithTerm:term]
                               success:^(id responseObject) {

                                   DLOG(@"%@", responseObject)
                                   ItunesSearchResponse *response = [[ItunesSearchResponse alloc] initWithResponseObject:responseObject];
                                   [wself.delegate itunesSearchResultSuccess:response];
                               }
                               failure:^(NSError *error) {

                                   DLOG(@"%@", error)
                                   [wself.delegate itunesSearchResultFailure:ItunesSearchAPIErrorMSG];
                               }];
}

- (NSString *)urlString {
    return @"https://itunes.apple.com/search";
}

- (NSDictionary *)parametersWithTerm:(NSString *)term {
    return @{
             @"term" : term,
             @"country" : @"JP",
             @"lang" : @"ja_jp",
             @"media" : @"music",
             };
}

@end
