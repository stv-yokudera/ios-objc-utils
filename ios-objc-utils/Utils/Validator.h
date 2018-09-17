//
//  Validator.h
//  ios-objc-utils
//
//  Created by YukiOkudera on 2018/09/16.
//  Copyright © 2018年 OkuderaYuki. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol Validatable <NSObject>

- (BOOL)validate;
- (void)setEmptyStringIfNeed;
@end

typedef NS_ENUM(NSInteger, CharacterSize) {
    CharacterSizeFull,
    CharacterSizeHalf,
    CharacterSizeFullAndHalf
};

@interface Validator : NSObject

#pragma mark - Class methods

#pragma mark Character type validator

/**
 数字のみかどうか

 @param string 入力文字列
 @param minLength 最小桁数
 @param maxLength 最大桁数
 @param characterSize 全角 or 半角 or 全半角(全角のみ、半角のみでもOK)
 @return バリデーションの結果
 */
+ (BOOL)onlyNumbersString:(NSString *)string minLength:(NSNumber *)minLength maxLength:(NSNumber *)maxLength characterSize:(CharacterSize)characterSize;

/**
 英字のみかどうか

 @param string 入力文字列
 @param minLength 最小桁数
 @param maxLength 最大桁数
 @param characterSize 全角 or 半角 or 全半角(全角のみ、半角のみでもOK)
 @return バリデーションの結果
 */
+ (BOOL)onlyAlphabetsString:(NSString *)string minLength:(NSNumber *)minLength maxLength:(NSNumber *)maxLength characterSize:(CharacterSize)characterSize;

/**
 英数字のみかどうか

 @param string 入力文字列
 @param minLength 最小桁数
 @param maxLength 最大桁数
 @param characterSize 全角 or 半角 or 全半角(全角のみ、半角のみでもOK)
 @return バリデーションの結果
 */
+ (BOOL)alphanumericsString:(NSString *)string minLength:(NSNumber *)minLength maxLength:(NSNumber *)maxLength characterSize:(CharacterSize)characterSize;

#pragma mark Character size validator

/**
 半角文字のみかどうか

 @param string 入力文字列
 @param minLength 最小桁数
 @param maxLength 最大桁数
 @return バリデーションの結果
 */
+ (BOOL)onlyHalfSizeString:(NSString *)string minLength:(NSNumber *)minLength maxLength:(NSNumber *)maxLength;

/**
 半角文字を含まないか(全角文字のみか)

 @param string 入力文字列
 @param minLength 最小桁数
 @param maxLength 最大桁数
 @return バリデーションの結果
 */
+ (BOOL)notContainHalfSizeString:(NSString *)string minLength:(NSNumber *)minLength maxLength:(NSNumber *)maxLength;

#pragma mark Mail address validator

/**
 メールアドレス形式かどうか

 @param string 入力文字列
 @return バリデーションの結果
 */
+ (BOOL)validateMailAddress:(NSString *)string;

#pragma mark Length validator

/**
 文字列の長さをチェックする

 @param string 入力文字列
 @param minLength 最小桁数
 @param maxLength 最大桁数
 @return バリデーションの結果
 */
+ (BOOL)checkLengthString:(NSString *)string minLength:(NSNumber *)minLength maxLength:(NSNumber *)maxLength;

@end
