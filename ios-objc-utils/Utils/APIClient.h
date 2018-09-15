//
//  APIClient.h
//  ios-objc-utils
//
//  Created by YukiOkudera on 2018/09/15.
//  Copyright © 2018年 OkuderaYuki. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^APIRequestSuccess)(id responseObject);
typedef void (^APIRequestFailure)(NSError *error);

@interface APIClient : NSObject

#pragma mark - APIRequest

/**
 GETリクエスト
 @param urlString リクエストURL
 @param parameters リクエストパラメータ
 @param success 成功時のハンドラー (void (^)(id responseObject))
 @param failure 失敗時のハンドラー (void (^)(NSError *error))
 */
+ (void)getRequestWithUrlString:(NSString *)urlString
                     parameters:(id)parameters
                        success:(APIRequestSuccess)success
                        failure:(APIRequestFailure)failure;

/**
 multipart/form-dataで画像をアップロードする

 @param urlString リクエストURL
 @param parameters リクエストパラメータ
 @param imageDataDic 画像のデータを保持するDictionary
 @param success 成功時のハンドラー (void (^)(id responseObject))
 @param failure 失敗時のハンドラー (void (^)(NSError *error))
 */
+ (void)uploadImageWithUrlString:(NSString *)urlString
                      parameters:(NSDictionary *)parameters
                       imageData:(NSDictionary *)imageDataDic
                         success:(APIRequestSuccess)success
                         failure:(APIRequestFailure)failure;

#pragma mark - NetworkReachability

/**
 ネットワーク接続状態確認

 @return YES: オンライン, NO: オフライン
 */
+ (BOOL)isReachable;

@end
