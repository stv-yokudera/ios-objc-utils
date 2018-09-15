//
//  APIClient.m
//  ios-objc-utils
//
//  Created by YukiOkudera on 2018/09/15.
//  Copyright © 2018年 OkuderaYuki. All rights reserved.
//

#import "APIClient.h"
#import "AFNetworking.h"
#import "Reachability.h"

@implementation APIClient

#pragma mark - APIRequest

+ (void)getRequestWithUrlString:(NSString *)urlString
                     parameters:(id)parameters
                        success:(APIRequestSuccess)success
                        failure:(APIRequestFailure)failure {

    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];

    // timeout interval
    manager.requestSerializer.timeoutInterval = 60.0;

    // HTTP Basic Authentication
//    NSString * const userName = @"UserName";
//    NSString * const password = @"Password";
//    [manager.requestSerializer setAuthorizationHeaderFieldWithUsername:userName password:password];

    // User-Agent
//    NSString * const userAgent = @"The User Agent";
//    [manager.requestSerializer setValue:userAgent forHTTPHeaderField:@"User-Agent"];

    [manager GET:urlString
      parameters:parameters
        progress:nil
         success:^(NSURLSessionDataTask *task, id responseObject) {
             DLOG(@"api success: %@", responseObject)
             success(responseObject);
         }
         failure:^(NSURLSessionDataTask *task, NSError *error) {
             DLOG(@"api failure: %@", error)
             failure(error);
         }
     ];
}

+ (void)uploadImageWithUrlString:(NSString *)urlString
                      parameters:(NSDictionary *)parameters
                       imageData:(NSDictionary *)imageDataDic
                         success:(APIRequestSuccess)success
                         failure:(APIRequestFailure)failure {

    DLOG(@"URL: %@",urlString)

    NSMutableURLRequest *urlRequest = [[NSMutableURLRequest alloc] init];
    urlRequest.URL = [NSURL URLWithString:urlString];

    // HTTP request method
    urlRequest.HTTPMethod = @"POST";

    // timeout interval
    urlRequest.timeoutInterval = 60.0;

    // HTTP Basic Authentication
//    NSString * const userName = @"UserName";
//    NSString * const password = @"Password";
//    NSString * const authString = [NSString stringWithFormat:@"%@:%@", userName, password];
//    NSData * const authData = [authString dataUsingEncoding:NSUTF8StringEncoding];
//    NSString * const authValue = [NSString stringWithFormat:@"Basic %@", [authData base64EncodedStringWithOptions:0]];
//    [urlRequest setValue:authValue forHTTPHeaderField:@"Authorization"];

    // User-Agent
//    NSString * const userAgent = @"The User Agent";
//    [urlRequest setValue:userAgent forHTTPHeaderField:@"User-Agent"];

    NSString * const boundary = @"---------------------------14737809831466499882746641449";
    NSString * const contentType = [NSString stringWithFormat:@"multipart/form-data; boundary=%@",boundary];
    [urlRequest addValue:contentType forHTTPHeaderField: @"Content-Type"];
//    [urlRequest setValue:contentType forHTTPHeaderField:@"Content-type: application/json"];

    NSMutableData *body = [NSMutableData data];
    [parameters enumerateKeysAndObjectsUsingBlock: ^(NSString *key, NSString *object, BOOL *stop) {
        [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"\r\n\r\n",key] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[[NSString stringWithFormat:@"%@",object] dataUsingEncoding:NSUTF8StringEncoding]];
    }];
    [imageDataDic enumerateKeysAndObjectsUsingBlock: ^(NSString *key, NSData *object, BOOL *stop) {
        if ([object isKindOfClass:[NSData class]]) {
            if (object.length > 0) {
                [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
                NSString * const timestamp = [self timestamp];
                DLOG(@"timestamp: %@", timestamp)
                [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"; filename=\"%@.jpg\"\r\n", key, timestamp] dataUsingEncoding:NSUTF8StringEncoding]];
                [body appendData:[[NSString stringWithFormat:@"Content-Type: application/octet-stream\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
                [body appendData:[NSData dataWithData:object]];
            }
        }
    }];
    [body appendData:[[NSString stringWithFormat:@"\r\n--%@--\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];

    [urlRequest setHTTPBody:body];

    AFHTTPSessionManager* manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = nil;

    NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:urlRequest uploadProgress:nil downloadProgress:nil completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {

        if (error) {
            DLOG(@"api failure: %@", error)
            failure(error);
        } else {
            DLOG(@"api success: %@", responseObject)
            success(responseObject);
        }
    }];
    [dataTask resume];
}

#pragma mark - NetworkReachability

+ (BOOL)isReachable {

    Reachability *currentReachability = [Reachability reachabilityForInternetConnection];
    const NetworkStatus currentReachabilityStatus = [currentReachability currentReachabilityStatus];

    switch (currentReachabilityStatus) {
        case NotReachable:
            return NO;
        case ReachableViaWiFi:
        case ReachableViaWWAN:
            return YES;
    }
}

#pragma mark - Timestamp

+ (NSString *)timestamp {

    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    [dateFormatter setCalendar:calendar];
    [dateFormatter setLocale:[NSLocale systemLocale]];
    [dateFormatter setDateFormat:@"yyyyMMddHHmmss"];
    return [dateFormatter stringFromDate:[NSDate date]];
}

@end
