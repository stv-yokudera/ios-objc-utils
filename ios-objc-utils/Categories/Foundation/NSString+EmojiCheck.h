//
//  NSString+EmojiCheck.h
//  ios-objc-utils
//
//  Created by YukiOkudera on 2018/09/16.
//  Copyright © 2018年 OkuderaYuki. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (EmojiCheck)

/**
 Apple Color Emojiを含むかどうか
 */
@property (nonatomic, readonly) BOOL hasEmoji;

/**
 見た目通りの文字数を返す
 
 絵文字などNSStringのlengthでは2文字扱いになってしまう文字を含む文字列向け
 */
@property (nonatomic, readonly) NSInteger graphemeLength;

/**
 Apple Color Emojiを取り除いた文字列を取得する
 @return Apple Color Emojiを取り除いた文字列
 */
- (NSString *)removeEmoji;

@end
