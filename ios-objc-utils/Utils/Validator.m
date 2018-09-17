//
//  Validator.m
//  ios-objc-utils
//
//  Created by YukiOkudera on 2018/09/16.
//  Copyright © 2018年 OkuderaYuki. All rights reserved.
//

#import "Validator.h"
#import "NSString+EmojiCheck.h"

static NSString * const numbersOfFullSize = @"^[０-９]";
static NSString * const numbersOfHalfSize = @"^[0-9]";
static NSString * const numbersOfFullSizeAndHalfSize = @"^[0-9０-９]";

static NSString * const alphabetsOfFullSize = @"^[ａ-ｚＡ-Ｚ]";
static NSString * const alphabetsOfHalfSize = @"^[a-zA-Z]";
static NSString * const alphabetsOfFullSizeAndHalfSize = @"^[a-zA-Zａ-ｚＡ-Ｚ]";

static NSString * const alphanumericsOfFullSize = @"^[ａ-ｚＡ-Ｚ０-９]";
static NSString * const alphanumericsOfHalfSize = @"^[a-zA-Z0-9]";
static NSString * const alphanumericsOfFullSizeAndHalfSize = @"^[a-zA-Z0-9ａ-ｚＡ-Ｚ０-９]";

static NSString * const onlyHalfSize = @"^[ -~｡-ﾟ¥¡£¢∞§¶•ªº–≠«‘“æ≥…≤]";
static NSString * const notContainHalfSize = @"^[^ -~｡-ﾟ¥¡£¢∞§¶•ªº–≠«‘“æ≥…≤]";

static NSString * const mailAddressFormat = @"^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}$";

@implementation Validator

/**
 数字のみかどうか

 @param string 入力文字列
 @param minLength 最小桁数
 @param maxLength 最大桁数
 @param characterSize 全角 or 半角 or 全半角(全角のみ、半角のみでもOK)
 @return バリデーションの結果
 */
+ (BOOL)onlyNumbersString:(NSString *)string minLength:(NSNumber *)minLength maxLength:(NSNumber *)maxLength characterSize:(CharacterSize)characterSize {

    NSString *baseExpression = @"";
    switch (characterSize) {
        case CharacterSizeFull:
            baseExpression = numbersOfFullSize;
            break;
        case CharacterSizeHalf:
            baseExpression = numbersOfHalfSize;
            break;
        case CharacterSizeFullAndHalf:
            baseExpression = numbersOfFullSizeAndHalfSize;
            break;
    }

    return [self validateWithBaseExpression:baseExpression string:string minLength:minLength maxLength:maxLength];
}

/**
 英字のみかどうか

 @param string 入力文字列
 @param minLength 最小桁数
 @param maxLength 最大桁数
 @param characterSize 全角 or 半角 or 全半角(全角のみ、半角のみでもOK)
 @return バリデーションの結果
 */
+ (BOOL)onlyAlphabetsString:(NSString *)string minLength:(NSNumber *)minLength maxLength:(NSNumber *)maxLength characterSize:(CharacterSize)characterSize {

    NSString *baseExpression = @"";
    switch (characterSize) {
        case CharacterSizeFull:
            baseExpression = alphabetsOfFullSize;
            break;
        case CharacterSizeHalf:
            baseExpression = alphabetsOfHalfSize;
            break;
        case CharacterSizeFullAndHalf:
            baseExpression = alphabetsOfFullSizeAndHalfSize;
            break;
    }

    return [self validateWithBaseExpression:baseExpression string:string minLength:minLength maxLength:maxLength];
}

/**
 英数字のみかどうか

 @param string 入力文字列
 @param minLength 最小桁数
 @param maxLength 最大桁数
 @param characterSize 全角 or 半角 or 全半角(全角のみ、半角のみでもOK)
 @return バリデーションの結果
 */
+ (BOOL)alphanumericsString:(NSString *)string minLength:(NSNumber *)minLength maxLength:(NSNumber *)maxLength characterSize:(CharacterSize)characterSize {

    NSString *baseExpression = @"";
    switch (characterSize) {
        case CharacterSizeFull:
            baseExpression = alphanumericsOfFullSize;
            break;
        case CharacterSizeHalf:
            baseExpression = alphanumericsOfHalfSize;
            break;
        case CharacterSizeFullAndHalf:
            baseExpression = alphanumericsOfFullSizeAndHalfSize;
            break;
    }

    return [self validateWithBaseExpression:baseExpression string:string minLength:minLength maxLength:maxLength];
}

/**
 半角文字のみかどうか

 @param string 入力文字列
 @param minLength 最小桁数
 @param maxLength 最大桁数
 @return バリデーションの結果
 */
+ (BOOL)onlyHalfSizeString:(NSString *)string minLength:(NSNumber *)minLength maxLength:(NSNumber *)maxLength {

    NSString *const baseExpression = onlyHalfSize;
    return [self validateWithBaseExpression:baseExpression string:string minLength:minLength maxLength:maxLength];
}

/**
 半角文字を含まないか(全角文字のみか)

 @param string 入力文字列
 @param minLength 最小桁数
 @param maxLength 最大桁数
 @return バリデーションの結果
 */
+ (BOOL)notContainHalfSizeString:(NSString *)string minLength:(NSNumber *)minLength maxLength:(NSNumber *)maxLength {

    NSString *const baseExpression = notContainHalfSize;
    return [self validateWithBaseExpression:baseExpression string:string minLength:minLength maxLength:maxLength];
}

/**
 メールアドレス形式かどうか

 @param string 入力文字列
 @return バリデーションの結果
 */
+ (BOOL)validateMailAddress:(NSString *)string {
    
    NSString *const expression = mailAddressFormat;
    
    NSError *error = nil;
    NSRegularExpression *const regex = [NSRegularExpression regularExpressionWithPattern:expression
                                                                                 options:NSRegularExpressionCaseInsensitive
                                                                                   error:&error];
    if (error && error.code != 0) {
        return NO;
    }
    
    NSTextCheckingResult * const match = [regex firstMatchInString:string
                                                           options:NSMatchingReportProgress
                                                             range:NSMakeRange(0, string.length)];
    return match ? YES : NO;
}

#pragma mark - Only length check

/**
 文字列の長さをチェックする

 @param string 入力文字列
 @param minLength 最小桁数
 @param maxLength 最大桁数
 @return バリデーションの結果
 */
+ (BOOL)checkLengthString:(NSString *)string minLength:(NSNumber *)minLength maxLength:(NSNumber *)maxLength {

    NSAssert(minLength.integerValue <= maxLength.integerValue, @"最小桁数が最大桁数より大きい");
    
    NSInteger length = string.graphemeLength;

    if (length < minLength.integerValue) {
        return NO;
    }
    if (length > maxLength.integerValue) {
        return NO;
    }
    return YES;
}

#pragma mark - Match pattern

/**
 バリデーション

 @param baseExpression 正規表現のベース
 @param string 入力文字列
 @param minLength 最小桁数
 @param maxLength 最大桁数
 @return バリデーションの結果
 */
+ (BOOL)validateWithBaseExpression:(NSString *)baseExpression
                            string:(NSString *)string
                          minLength:(NSNumber *)minLength
                          maxLength:(NSNumber *)maxLength {

    DLOG(@"min:%@", minLength.stringValue);
    DLOG(@"max:%@", maxLength.stringValue);

    // min, max両方nil
    if (!minLength && !maxLength) {
        NSString * const expression = [NSString stringWithFormat:@"%@*$", baseExpression];
        DLOG(@"expression:%@", expression)
        return [self matchPattern:expression string:string];;
    }

    // minのみnil
    if (!minLength) {
        NSString * const expression = [NSString stringWithFormat:@"%@{0,%@}$", baseExpression, maxLength.stringValue];
        DLOG(@"expression:%@", expression)
        return [self matchPattern:expression string:string];;
    }

    // maxのみnil
    if (!maxLength) {
        NSString * const expression = [NSString stringWithFormat:@"%@{%@,}$", baseExpression, minLength.stringValue];
        DLOG(@"expression:%@", expression)
        return [self matchPattern:expression string:string];;
    }

    // min, max両方nilではない
    NSAssert(minLength.integerValue <= maxLength.integerValue, @"最小桁数が最大桁数より大きい");

    if (minLength == maxLength) {
        NSString * const expression = [NSString stringWithFormat:@"%@{%@}$", baseExpression, minLength.stringValue];
        DLOG(@"expression:%@", expression)
        return [self matchPattern:expression string:string];;
    } else {
        NSString * const expression = [NSString stringWithFormat:@"%@{%@,%@}$", baseExpression, minLength.stringValue, maxLength.stringValue];
        DLOG(@"expression:%@", expression)
        return [self matchPattern:expression string:string];;
    }
}

/**
 正規表現のパターンにマッチするかどうか

 @param expression 正規表現
 @param string 入力文字列
 @return YES: マッチする, NO: マッチしない
 */
+ (BOOL)matchPattern:(NSString *)expression string:(NSString *)string {

    // 検証対象の文字列がnilの場合は、NOを返却する
    if (!string) {
        return NO;
    }

    NSError *error = nil;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:expression
                                                                           options:NSRegularExpressionCaseInsensitive
                                                                             error:&error];
    if (error && error.code != 0) {
        return NO;
    }

    NSTextCheckingResult * const match = [regex firstMatchInString:string
                                                           options:NSMatchingReportProgress
                                                             range:NSMakeRange(0, string.length)];
    if (match) {
        NSRange matchRange = match.range;

        // マッチした数と文字列の長さが同じかどうか
        return (matchRange.length == string.length) ? YES : NO;
    }
    return NO;
}

@end
