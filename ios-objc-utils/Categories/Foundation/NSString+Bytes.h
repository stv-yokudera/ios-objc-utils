//
//  NSString+Bytes.h
//  ios-objc-sampler
//
//  Created by YukiOkudera on 2018/10/04.
//  Copyright © 2018 YukiOkudera. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Bytes)

/**
 UTF-8エンコーディングして、バイト数を取得する

 @warning エンコードエラー時は、0が返却される
 */
@property (nonatomic, readonly) NSUInteger bytes;

/**
 4バイト文字のみを抽出する

 @return 4バイト文字のみの配列(重複除去)
 */
- (NSArray<NSString *> *)contain4BytesCharacters;
@end

NS_ASSUME_NONNULL_END
