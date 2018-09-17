//
//  ValidatorTests.m
//  ios-objc-utilsTests
//
//  Created by YukiOkudera on 2018/09/16.
//  Copyright © 2018年 OkuderaYuki. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Validator.h"

@interface ValidatorTests : XCTestCase

@end

@implementation ValidatorTests

#pragma mark - onlyNumbers

/// 全角数字のバリデーションをテスト
- (void)test_onlyNumbers_characterSizeFull {

    NSNumber * const minLength = @(1);
    NSNumber * const maxLength = @(10);
    CharacterSize fullSize = CharacterSizeFull;

    // 数字のみ(全角)
    XCTAssertTrue([Validator onlyNumbersString:@"０１２３４５６７８９" minLength:minLength maxLength:maxLength characterSize:fullSize]);

    // 数字のみ(半角)
    XCTAssertFalse([Validator onlyNumbersString:@"0123456789" minLength:minLength maxLength:maxLength characterSize:fullSize]);

    // 数字のみ(全角・半角)
    XCTAssertFalse([Validator onlyNumbersString:@"01234５６７８９" minLength:minLength maxLength:maxLength characterSize:fullSize]);

    // 0文字
    XCTAssertFalse([Validator onlyNumbersString:@"" minLength:minLength maxLength:maxLength characterSize:fullSize]);
    // 11文字
    XCTAssertFalse([Validator onlyNumbersString:@"００１２３４５６７８９" minLength:minLength maxLength:maxLength characterSize:fullSize]);

    // 全角数字+全角数字以外
    XCTAssertFalse([Validator onlyNumbersString:@"１a" minLength:minLength maxLength:maxLength characterSize:fullSize]);
    XCTAssertFalse([Validator onlyNumbersString:@"a１" minLength:minLength maxLength:maxLength characterSize:fullSize]);
    XCTAssertFalse([Validator onlyNumbersString:@"１ひらがな" minLength:minLength maxLength:maxLength characterSize:fullSize]);
    XCTAssertFalse([Validator onlyNumbersString:@"ひらがな１" minLength:minLength maxLength:maxLength characterSize:fullSize]);
    XCTAssertFalse([Validator onlyNumbersString:@"１カタカナ" minLength:minLength maxLength:maxLength characterSize:fullSize]);
    XCTAssertFalse([Validator onlyNumbersString:@"カタカナ１" minLength:minLength maxLength:maxLength characterSize:fullSize]);
    XCTAssertFalse([Validator onlyNumbersString:@"１ｶﾀｶﾅ" minLength:minLength maxLength:maxLength characterSize:fullSize]);
    XCTAssertFalse([Validator onlyNumbersString:@"ｶﾀｶﾅ１" minLength:minLength maxLength:maxLength characterSize:fullSize]);
    XCTAssertFalse([Validator onlyNumbersString:@"１漢字" minLength:minLength maxLength:maxLength characterSize:fullSize]);
    XCTAssertFalse([Validator onlyNumbersString:@"漢字１" minLength:minLength maxLength:maxLength characterSize:fullSize]);
    XCTAssertFalse([Validator onlyNumbersString:@"１ " minLength:minLength maxLength:maxLength characterSize:fullSize]);
    XCTAssertFalse([Validator onlyNumbersString:@" １" minLength:minLength maxLength:maxLength characterSize:fullSize]);
    XCTAssertFalse([Validator onlyNumbersString:@"１　" minLength:minLength maxLength:maxLength characterSize:fullSize]);
    XCTAssertFalse([Validator onlyNumbersString:@"　１" minLength:minLength maxLength:maxLength characterSize:fullSize]);
    XCTAssertFalse([Validator onlyNumbersString:@"１-^¥!\"#$%&'()=~|¡£¢∞§¶•ªº–≠\\_][:/.;@,_}{`*?>+<`«‘“æ/≥…≤" minLength:minLength maxLength:@(60) characterSize:fullSize]);
    XCTAssertFalse([Validator onlyNumbersString:@"-^¥!\"#$%&'()=~|¡£¢∞§¶•ªº–≠\\_][:/.;@,_}{`*?>+<`«‘“æ/≥…≤１" minLength:minLength maxLength:@(60) characterSize:fullSize]);

    // 全角数字以外のみ
    XCTAssertFalse([Validator onlyNumbersString:@"abcdefghijklmnopqrstuvwxyz" minLength:minLength maxLength:@(26) characterSize:fullSize]);
    XCTAssertFalse([Validator onlyNumbersString:@"ABCDEFGHIJKLMNOPQRSTUVWXYZ" minLength:minLength maxLength:@(26) characterSize:fullSize]);
    XCTAssertFalse([Validator onlyNumbersString:@"ひらがな" minLength:minLength maxLength:maxLength characterSize:fullSize]);
    XCTAssertFalse([Validator onlyNumbersString:@"カタカナ" minLength:minLength maxLength:maxLength characterSize:fullSize]);
    XCTAssertFalse([Validator onlyNumbersString:@"ｶﾀｶﾅ" minLength:minLength maxLength:maxLength characterSize:fullSize]);
    XCTAssertFalse([Validator onlyNumbersString:@"漢字" minLength:minLength maxLength:maxLength characterSize:fullSize]);
    XCTAssertFalse([Validator onlyNumbersString:@"-^¥!\"#$%&'()=~|¡£¢∞§¶•ªº–≠\\_][:/.;@,_}{`*?>+<`«‘“æ/≥…≤" minLength:minLength maxLength:@(60) characterSize:fullSize]);
}

/// 半角数字のバリデーションをテスト
- (void)test_onlyNumbers_characterSizeHalf {

    NSNumber * const minLength = @(1);
    NSNumber * const maxLength = @(10);
    CharacterSize halfSize = CharacterSizeHalf;

    // 数字のみ(半角)
    XCTAssertTrue([Validator onlyNumbersString:@"0123456789" minLength:minLength maxLength:maxLength characterSize:halfSize]);

    // 数字のみ(全角)
    XCTAssertFalse([Validator onlyNumbersString:@"０１２３４５６７８９" minLength:minLength maxLength:maxLength characterSize:halfSize]);

    // 数字のみ(全角・半角)
    XCTAssertFalse([Validator onlyNumbersString:@"01234５６７８９" minLength:minLength maxLength:maxLength characterSize:halfSize]);

    // 0文字
    XCTAssertFalse([Validator onlyNumbersString:@"" minLength:minLength maxLength:maxLength characterSize:halfSize]);
    // 11文字
    XCTAssertFalse([Validator onlyNumbersString:@"00123456789" minLength:minLength maxLength:maxLength characterSize:halfSize]);

    // 半角数字+半角数字以外
    XCTAssertFalse([Validator onlyNumbersString:@"1a" minLength:minLength maxLength:maxLength characterSize:halfSize]);
    XCTAssertFalse([Validator onlyNumbersString:@"a1" minLength:minLength maxLength:maxLength characterSize:halfSize]);
    XCTAssertFalse([Validator onlyNumbersString:@"1ひらがな" minLength:minLength maxLength:maxLength characterSize:halfSize]);
    XCTAssertFalse([Validator onlyNumbersString:@"ひらがな1" minLength:minLength maxLength:maxLength characterSize:halfSize]);
    XCTAssertFalse([Validator onlyNumbersString:@"1カタカナ" minLength:minLength maxLength:maxLength characterSize:halfSize]);
    XCTAssertFalse([Validator onlyNumbersString:@"カタカナ1" minLength:minLength maxLength:maxLength characterSize:halfSize]);
    XCTAssertFalse([Validator onlyNumbersString:@"1ｶﾀｶﾅ" minLength:minLength maxLength:maxLength characterSize:halfSize]);
    XCTAssertFalse([Validator onlyNumbersString:@"ｶﾀｶﾅ1" minLength:minLength maxLength:maxLength characterSize:halfSize]);
    XCTAssertFalse([Validator onlyNumbersString:@"1漢字" minLength:minLength maxLength:maxLength characterSize:halfSize]);
    XCTAssertFalse([Validator onlyNumbersString:@"漢字1" minLength:minLength maxLength:maxLength characterSize:halfSize]);
    XCTAssertFalse([Validator onlyNumbersString:@"1 " minLength:minLength maxLength:maxLength characterSize:halfSize]);
    XCTAssertFalse([Validator onlyNumbersString:@" 1" minLength:minLength maxLength:maxLength characterSize:halfSize]);
    XCTAssertFalse([Validator onlyNumbersString:@"1　" minLength:minLength maxLength:maxLength characterSize:halfSize]);
    XCTAssertFalse([Validator onlyNumbersString:@"　1" minLength:minLength maxLength:maxLength characterSize:halfSize]);
    XCTAssertFalse([Validator onlyNumbersString:@"1-^¥!\"#$%&'()=~|¡£¢∞§¶•ªº–≠\\_][:/.;@,_}{`*?>+<`«‘“æ/≥…≤" minLength:minLength maxLength:@(60) characterSize:halfSize]);
    XCTAssertFalse([Validator onlyNumbersString:@"-^¥!\"#$%&'()=~|¡£¢∞§¶•ªº–≠\\_][:/.;@,_}{`*?>+<`«‘“æ/≥…≤1" minLength:minLength maxLength:@(60) characterSize:halfSize]);

    // 半角数字以外のみ
    XCTAssertFalse([Validator onlyNumbersString:@"abcdefghijklmnopqrstuvwxyz" minLength:minLength maxLength:@(26) characterSize:halfSize]);
    XCTAssertFalse([Validator onlyNumbersString:@"ABCDEFGHIJKLMNOPQRSTUVWXYZ" minLength:minLength maxLength:@(26) characterSize:halfSize]);
    XCTAssertFalse([Validator onlyNumbersString:@"ひらがな" minLength:minLength maxLength:maxLength characterSize:halfSize]);
    XCTAssertFalse([Validator onlyNumbersString:@"カタカナ" minLength:minLength maxLength:maxLength characterSize:halfSize]);
    XCTAssertFalse([Validator onlyNumbersString:@"ｶﾀｶﾅ" minLength:minLength maxLength:maxLength characterSize:halfSize]);
    XCTAssertFalse([Validator onlyNumbersString:@"漢字" minLength:minLength maxLength:maxLength characterSize:halfSize]);
    XCTAssertFalse([Validator onlyNumbersString:@"-^¥!\"#$%&'()=~|¡£¢∞§¶•ªº–≠\\_][:/.;@,_}{`*?>+<`«‘“æ/≥…≤" minLength:minLength maxLength:@(60) characterSize:halfSize]);
}

/// 全半角数字のバリデーションをテスト
- (void)test_onlyNumbers_characterSizeFullAndHalf {

    NSNumber * const minLength = @(1);
    NSNumber * const maxLength = @(10);
    CharacterSize fullAndHalf = CharacterSizeFullAndHalf;

    // 数字のみ(半角)
    XCTAssertTrue([Validator onlyNumbersString:@"0123456789" minLength:minLength maxLength:maxLength characterSize:fullAndHalf]);

    // 数字のみ(全角)
    XCTAssertTrue([Validator onlyNumbersString:@"０１２３４５６７８９" minLength:minLength maxLength:maxLength characterSize:fullAndHalf]);

    // 数字のみ(全角・半角)
    XCTAssertTrue([Validator onlyNumbersString:@"01234５６７８９" minLength:minLength maxLength:maxLength characterSize:fullAndHalf]);

    // 0文字
    XCTAssertFalse([Validator onlyNumbersString:@"" minLength:minLength maxLength:maxLength characterSize:fullAndHalf]);
    // 11文字
    XCTAssertFalse([Validator onlyNumbersString:@"00123456789" minLength:minLength maxLength:maxLength characterSize:fullAndHalf]);

    // 全半角数字+全半角数字以外
    XCTAssertFalse([Validator onlyNumbersString:@"1a" minLength:minLength maxLength:maxLength characterSize:fullAndHalf]);
    XCTAssertFalse([Validator onlyNumbersString:@"a1" minLength:minLength maxLength:maxLength characterSize:fullAndHalf]);
    XCTAssertFalse([Validator onlyNumbersString:@"1ひらがな" minLength:minLength maxLength:maxLength characterSize:fullAndHalf]);
    XCTAssertFalse([Validator onlyNumbersString:@"ひらがな1" minLength:minLength maxLength:maxLength characterSize:fullAndHalf]);
    XCTAssertFalse([Validator onlyNumbersString:@"1カタカナ" minLength:minLength maxLength:maxLength characterSize:fullAndHalf]);
    XCTAssertFalse([Validator onlyNumbersString:@"カタカナ1" minLength:minLength maxLength:maxLength characterSize:fullAndHalf]);
    XCTAssertFalse([Validator onlyNumbersString:@"1ｶﾀｶﾅ" minLength:minLength maxLength:maxLength characterSize:fullAndHalf]);
    XCTAssertFalse([Validator onlyNumbersString:@"ｶﾀｶﾅ1" minLength:minLength maxLength:maxLength characterSize:fullAndHalf]);
    XCTAssertFalse([Validator onlyNumbersString:@"1漢字" minLength:minLength maxLength:maxLength characterSize:fullAndHalf]);
    XCTAssertFalse([Validator onlyNumbersString:@"漢字1" minLength:minLength maxLength:maxLength characterSize:fullAndHalf]);
    XCTAssertFalse([Validator onlyNumbersString:@"1 " minLength:minLength maxLength:maxLength characterSize:fullAndHalf]);
    XCTAssertFalse([Validator onlyNumbersString:@" 1" minLength:minLength maxLength:maxLength characterSize:fullAndHalf]);
    XCTAssertFalse([Validator onlyNumbersString:@"1　" minLength:minLength maxLength:maxLength characterSize:fullAndHalf]);
    XCTAssertFalse([Validator onlyNumbersString:@"　1" minLength:minLength maxLength:maxLength characterSize:fullAndHalf]);
    XCTAssertFalse([Validator onlyNumbersString:@"1-^¥!\"#$%&'()=~|¡£¢∞§¶•ªº–≠\\_][:/.;@,_}{`*?>+<`«‘“æ/≥…≤" minLength:minLength maxLength:@(60) characterSize:fullAndHalf]);
    XCTAssertFalse([Validator onlyNumbersString:@"-^¥!\"#$%&'()=~|¡£¢∞§¶•ªº–≠\\_][:/.;@,_}{`*?>+<`«‘“æ/≥…≤1" minLength:minLength maxLength:@(60) characterSize:fullAndHalf]);

    // 全半角数字以外のみ
    XCTAssertFalse([Validator onlyNumbersString:@"abcdefghijklmnopqrstuvwxyz" minLength:minLength maxLength:@(26) characterSize:fullAndHalf]);
    XCTAssertFalse([Validator onlyNumbersString:@"ABCDEFGHIJKLMNOPQRSTUVWXYZ" minLength:minLength maxLength:@(26) characterSize:fullAndHalf]);
    XCTAssertFalse([Validator onlyNumbersString:@"ひらがな" minLength:minLength maxLength:maxLength characterSize:fullAndHalf]);
    XCTAssertFalse([Validator onlyNumbersString:@"カタカナ" minLength:minLength maxLength:maxLength characterSize:fullAndHalf]);
    XCTAssertFalse([Validator onlyNumbersString:@"ｶﾀｶﾅ" minLength:minLength maxLength:maxLength characterSize:fullAndHalf]);
    XCTAssertFalse([Validator onlyNumbersString:@"漢字" minLength:minLength maxLength:maxLength characterSize:fullAndHalf]);
    XCTAssertFalse([Validator onlyNumbersString:@"-^¥!\"#$%&'()=~|¡£¢∞§¶•ªº–≠\\_][:/.;@,_}{`*?>+<`«‘“æ/≥…≤" minLength:minLength maxLength:@(60) characterSize:fullAndHalf]);
}

#pragma mark - onlyAlphabets

/// 全角英字のバリデーションをテスト
- (void)test_onlyAlphabets_characterSizeFull {

    NSNumber * const minLength = @(1);
    NSNumber * const maxLength = @(26);
    CharacterSize fullSize = CharacterSizeFull;

    // 英字のみ(全角)
    XCTAssertTrue([Validator onlyAlphabetsString:@"ａｂｃｄｅｆｇｈｉｊｋｌｍｎｏｐｑｒｓｔｕｖｗｘｙｚ" minLength:minLength maxLength:maxLength characterSize:fullSize]);
    XCTAssertTrue([Validator onlyAlphabetsString:@"ＡＢＣＤＥＦＧＨＩＪＫＬＭＮＯＰＱＲＳＴＵＶＷＸＹＺ" minLength:minLength maxLength:maxLength characterSize:fullSize]);

    // 英字のみ(半角)
    XCTAssertFalse([Validator onlyAlphabetsString:@"abcdefghijklmnopqrstuvwxyz" minLength:minLength maxLength:maxLength characterSize:fullSize]);
    XCTAssertFalse([Validator onlyAlphabetsString:@"ABCDEFGHIJKLMNOPQRSTUVWXYZ" minLength:minLength maxLength:maxLength characterSize:fullSize]);

    // 英字のみ(全角・半角)
    XCTAssertFalse([Validator onlyAlphabetsString:@"ａｂｃｄｅｆｇｈｉｊｋｌｍnopqrstuvwxyz" minLength:minLength maxLength:maxLength characterSize:fullSize]);
    XCTAssertFalse([Validator onlyAlphabetsString:@"ＡＢＣＤＥＦＧＨＩＪＫＬＭnopqrstuvwxyz" minLength:minLength maxLength:maxLength characterSize:fullSize]);

    // 0文字
    XCTAssertFalse([Validator onlyAlphabetsString:@"" minLength:minLength maxLength:maxLength characterSize:fullSize]);
    // 27文字
    XCTAssertFalse([Validator onlyAlphabetsString:@"ａａｂｃｄｅｆｇｈｉｊｋｌｍｎｏｐｑｒｓｔｕｖｗｘｙｚ" minLength:minLength maxLength:maxLength characterSize:fullSize]);

    // 全角英字+全角英字以外
    XCTAssertFalse([Validator onlyAlphabetsString:@"ａ0123456789" minLength:minLength maxLength:maxLength characterSize:fullSize]);
    XCTAssertFalse([Validator onlyAlphabetsString:@"ａ０１２３４５６７８９" minLength:minLength maxLength:maxLength characterSize:fullSize]);
    XCTAssertFalse([Validator onlyAlphabetsString:@"ａひらがな" minLength:minLength maxLength:maxLength characterSize:fullSize]);
    XCTAssertFalse([Validator onlyAlphabetsString:@"ａカタカナ" minLength:minLength maxLength:maxLength characterSize:fullSize]);
    XCTAssertFalse([Validator onlyAlphabetsString:@"ａｶﾀｶﾅ" minLength:minLength maxLength:maxLength characterSize:fullSize]);
    XCTAssertFalse([Validator onlyAlphabetsString:@"ａ漢字" minLength:minLength maxLength:maxLength characterSize:fullSize]);
    XCTAssertFalse([Validator onlyAlphabetsString:@"ａ-^¥!\"#$%&'()=~|¡£¢∞§¶•ªº–≠\\_][:/.;@,_}{`*?>+<`«‘“æ/≥…≤" minLength:minLength maxLength:@(60) characterSize:fullSize]);
    XCTAssertFalse([Validator onlyAlphabetsString:@"0123456789ａ" minLength:minLength maxLength:maxLength characterSize:fullSize]);
    XCTAssertFalse([Validator onlyAlphabetsString:@"０１２３４５６７８９ａ" minLength:minLength maxLength:maxLength characterSize:fullSize]);
    XCTAssertFalse([Validator onlyAlphabetsString:@"ひらがなａ" minLength:minLength maxLength:maxLength characterSize:fullSize]);
    XCTAssertFalse([Validator onlyAlphabetsString:@"カタカナａ" minLength:minLength maxLength:maxLength characterSize:fullSize]);
    XCTAssertFalse([Validator onlyAlphabetsString:@"ｶﾀｶﾅａ" minLength:minLength maxLength:maxLength characterSize:fullSize]);
    XCTAssertFalse([Validator onlyAlphabetsString:@"漢字ａ" minLength:minLength maxLength:maxLength characterSize:fullSize]);
    XCTAssertFalse([Validator onlyAlphabetsString:@"-^¥!\"#$%&'()=~|¡£¢∞§¶•ªº–≠\\_][:/.;@,_}{`*?>+<`«‘“æ/≥…≤ａ" minLength:minLength maxLength:@(60) characterSize:fullSize]);

    // 全角英字以外のみ
    XCTAssertFalse([Validator onlyAlphabetsString:@"0123456789" minLength:minLength maxLength:maxLength characterSize:fullSize]);
    XCTAssertFalse([Validator onlyAlphabetsString:@"０１２３４５６７８９" minLength:minLength maxLength:maxLength characterSize:fullSize]);
    XCTAssertFalse([Validator onlyAlphabetsString:@"ひらがな" minLength:minLength maxLength:maxLength characterSize:fullSize]);
    XCTAssertFalse([Validator onlyAlphabetsString:@"カタカナ" minLength:minLength maxLength:maxLength characterSize:fullSize]);
    XCTAssertFalse([Validator onlyAlphabetsString:@"ｶﾀｶﾅ" minLength:minLength maxLength:maxLength characterSize:fullSize]);
    XCTAssertFalse([Validator onlyAlphabetsString:@"漢字" minLength:minLength maxLength:maxLength characterSize:fullSize]);
    XCTAssertFalse([Validator onlyAlphabetsString:@"-^¥!\"#$%&'()=~|¡£¢∞§¶•ªº–≠\\_][:/.;@,_}{`*?>+<`«‘“æ/≥…≤" minLength:minLength maxLength:@(60) characterSize:fullSize]);
}

/// 半角英字のバリデーションをテスト
- (void)test_onlyAlphabets_characterSizeHalf {

    NSNumber * const minLength = @(1);
    NSNumber * const maxLength = @(26);
    CharacterSize halfSize = CharacterSizeHalf;

    // 英字のみ(半角)
    XCTAssertTrue([Validator onlyAlphabetsString:@"abcdefghijklmnopqrstuvwxyz" minLength:minLength maxLength:maxLength characterSize:halfSize]);
    XCTAssertTrue([Validator onlyAlphabetsString:@"ABCDEFGHIJKLMNOPQRSTUVWXYZ" minLength:minLength maxLength:maxLength characterSize:halfSize]);

    // 英字のみ(全角)
    XCTAssertFalse([Validator onlyAlphabetsString:@"ａｂｃｄｅｆｇｈｉｊｋｌｍｎｏｐｑｒｓｔｕｖｗｘｙｚ" minLength:minLength maxLength:maxLength characterSize:halfSize]);
    XCTAssertFalse([Validator onlyAlphabetsString:@"ＡＢＣＤＥＦＧＨＩＪＫＬＭＮＯＰＱＲＳＴＵＶＷＸＹＺ" minLength:minLength maxLength:maxLength characterSize:halfSize]);

    // 英字のみ(全角・半角)
    XCTAssertFalse([Validator onlyAlphabetsString:@"ａｂｃｄｅｆｇｈｉｊｋｌｍnopqrstuvwxyz" minLength:minLength maxLength:maxLength characterSize:halfSize]);
    XCTAssertFalse([Validator onlyAlphabetsString:@"ＡＢＣＤＥＦＧＨＩＪＫＬＭnopqrstuvwxyz" minLength:minLength maxLength:maxLength characterSize:halfSize]);

    // 0文字
    XCTAssertFalse([Validator onlyAlphabetsString:@"" minLength:minLength maxLength:maxLength characterSize:halfSize]);
    // 27文字
    XCTAssertFalse([Validator onlyAlphabetsString:@"aabcdefghijklmnopqrstuvwxyz" minLength:minLength maxLength:maxLength characterSize:halfSize]);

    // 半角英字+半角英字以外
    XCTAssertFalse([Validator onlyAlphabetsString:@"a0123456789" minLength:minLength maxLength:maxLength characterSize:halfSize]);
    XCTAssertFalse([Validator onlyAlphabetsString:@"a０１２３４５６７８９" minLength:minLength maxLength:maxLength characterSize:halfSize]);
    XCTAssertFalse([Validator onlyAlphabetsString:@"aひらがな" minLength:minLength maxLength:maxLength characterSize:halfSize]);
    XCTAssertFalse([Validator onlyAlphabetsString:@"aカタカナ" minLength:minLength maxLength:maxLength characterSize:halfSize]);
    XCTAssertFalse([Validator onlyAlphabetsString:@"aｶﾀｶﾅ" minLength:minLength maxLength:maxLength characterSize:halfSize]);
    XCTAssertFalse([Validator onlyAlphabetsString:@"a漢字" minLength:minLength maxLength:maxLength characterSize:halfSize]);
    XCTAssertFalse([Validator onlyAlphabetsString:@"a-^¥!\"#$%&'()=~|¡£¢∞§¶•ªº–≠\\_][:/.;@,_}{`*?>+<`«‘“æ/≥…≤" minLength:minLength maxLength:@(60) characterSize:halfSize]);
    XCTAssertFalse([Validator onlyAlphabetsString:@"0123456789a" minLength:minLength maxLength:maxLength characterSize:halfSize]);
    XCTAssertFalse([Validator onlyAlphabetsString:@"０１２３４５６７８９a" minLength:minLength maxLength:maxLength characterSize:halfSize]);
    XCTAssertFalse([Validator onlyAlphabetsString:@"ひらがなa" minLength:minLength maxLength:maxLength characterSize:halfSize]);
    XCTAssertFalse([Validator onlyAlphabetsString:@"カタカナa" minLength:minLength maxLength:maxLength characterSize:halfSize]);
    XCTAssertFalse([Validator onlyAlphabetsString:@"ｶﾀｶﾅa" minLength:minLength maxLength:maxLength characterSize:halfSize]);
    XCTAssertFalse([Validator onlyAlphabetsString:@"漢字a" minLength:minLength maxLength:maxLength characterSize:halfSize]);
    XCTAssertFalse([Validator onlyAlphabetsString:@"-^¥!\"#$%&'()=~|¡£¢∞§¶•ªº–≠\\_][:/.;@,_}{`*?>+<`«‘“æ/≥…≤a" minLength:minLength maxLength:@(60) characterSize:halfSize]);

    // 半角英字以外のみ
    XCTAssertFalse([Validator onlyAlphabetsString:@"0123456789" minLength:minLength maxLength:maxLength characterSize:halfSize]);
    XCTAssertFalse([Validator onlyAlphabetsString:@"０１２３４５６７８９" minLength:minLength maxLength:maxLength characterSize:halfSize]);
    XCTAssertFalse([Validator onlyAlphabetsString:@"ひらがな" minLength:minLength maxLength:maxLength characterSize:halfSize]);
    XCTAssertFalse([Validator onlyAlphabetsString:@"カタカナ" minLength:minLength maxLength:maxLength characterSize:halfSize]);
    XCTAssertFalse([Validator onlyAlphabetsString:@"ｶﾀｶﾅ" minLength:minLength maxLength:maxLength characterSize:halfSize]);
    XCTAssertFalse([Validator onlyAlphabetsString:@"漢字" minLength:minLength maxLength:maxLength characterSize:halfSize]);
    XCTAssertFalse([Validator onlyAlphabetsString:@"-^¥!\"#$%&'()=~|¡£¢∞§¶•ªº–≠\\_][:/.;@,_}{`*?>+<`«‘“æ/≥…≤" minLength:minLength maxLength:@(60) characterSize:halfSize]);
}

/// 全半角英字のバリデーションをテスト
- (void)test_onlyAlphabets_characterSizeFullAndHalf {

    NSNumber * const minLength = @(1);
    NSNumber * const maxLength = @(26);
    CharacterSize fullAndHalf = CharacterSizeFullAndHalf;

    // 英字のみ(半角)
    XCTAssertTrue([Validator onlyAlphabetsString:@"abcdefghijklmnopqrstuvwxyz" minLength:minLength maxLength:maxLength characterSize:fullAndHalf]);
    XCTAssertTrue([Validator onlyAlphabetsString:@"ABCDEFGHIJKLMNOPQRSTUVWXYZ" minLength:minLength maxLength:maxLength characterSize:fullAndHalf]);

    // 英字のみ(全角)
    XCTAssertTrue([Validator onlyAlphabetsString:@"ａｂｃｄｅｆｇｈｉｊｋｌｍｎｏｐｑｒｓｔｕｖｗｘｙｚ" minLength:minLength maxLength:maxLength characterSize:fullAndHalf]);
    XCTAssertTrue([Validator onlyAlphabetsString:@"ＡＢＣＤＥＦＧＨＩＪＫＬＭＮＯＰＱＲＳＴＵＶＷＸＹＺ" minLength:minLength maxLength:maxLength characterSize:fullAndHalf]);

    // 英字のみ(全角・半角)
    XCTAssertTrue([Validator onlyAlphabetsString:@"ａｂｃｄｅｆｇｈｉｊｋｌｍnopqrstuvwxyz" minLength:minLength maxLength:maxLength characterSize:fullAndHalf]);
    XCTAssertTrue([Validator onlyAlphabetsString:@"ＡＢＣＤＥＦＧＨＩＪＫＬＭnopqrstuvwxyz" minLength:minLength maxLength:maxLength characterSize:fullAndHalf]);

    // 0文字
    XCTAssertFalse([Validator onlyAlphabetsString:@"" minLength:minLength maxLength:maxLength characterSize:fullAndHalf]);
    // 27文字
    XCTAssertFalse([Validator onlyAlphabetsString:@"ａａｂｃｄｅｆｇｈｉｊｋｌｍnopqrstuvwxyz" minLength:minLength maxLength:maxLength characterSize:fullAndHalf]);

    // 全半角英字+全半角英字以外
    XCTAssertFalse([Validator onlyAlphabetsString:@"ａa0123456789" minLength:minLength maxLength:maxLength characterSize:fullAndHalf]);
    XCTAssertFalse([Validator onlyAlphabetsString:@"ａa０１２３４５６７８９" minLength:minLength maxLength:maxLength characterSize:fullAndHalf]);
    XCTAssertFalse([Validator onlyAlphabetsString:@"ａaひらがな" minLength:minLength maxLength:maxLength characterSize:fullAndHalf]);
    XCTAssertFalse([Validator onlyAlphabetsString:@"ａaカタカナ" minLength:minLength maxLength:maxLength characterSize:fullAndHalf]);
    XCTAssertFalse([Validator onlyAlphabetsString:@"ａaｶﾀｶﾅ" minLength:minLength maxLength:maxLength characterSize:fullAndHalf]);
    XCTAssertFalse([Validator onlyAlphabetsString:@"ａa漢字" minLength:minLength maxLength:maxLength characterSize:fullAndHalf]);
    XCTAssertFalse([Validator onlyAlphabetsString:@"ａa-^¥!\"#$%&'()=~|¡£¢∞§¶•ªº–≠\\_][:/.;@,_}{`*?>+<`«‘“æ/≥…≤" minLength:minLength maxLength:@(60) characterSize:fullAndHalf]);
    XCTAssertFalse([Validator onlyAlphabetsString:@"0123456789ａa" minLength:minLength maxLength:maxLength characterSize:fullAndHalf]);
    XCTAssertFalse([Validator onlyAlphabetsString:@"０１２３４５６７８９ａa" minLength:minLength maxLength:maxLength characterSize:fullAndHalf]);
    XCTAssertFalse([Validator onlyAlphabetsString:@"ひらがなａa" minLength:minLength maxLength:maxLength characterSize:fullAndHalf]);
    XCTAssertFalse([Validator onlyAlphabetsString:@"カタカナａa" minLength:minLength maxLength:maxLength characterSize:fullAndHalf]);
    XCTAssertFalse([Validator onlyAlphabetsString:@"ｶﾀｶﾅａa" minLength:minLength maxLength:maxLength characterSize:fullAndHalf]);
    XCTAssertFalse([Validator onlyAlphabetsString:@"漢字ａa" minLength:minLength maxLength:maxLength characterSize:fullAndHalf]);
    XCTAssertFalse([Validator onlyAlphabetsString:@"-^¥!\"#$%&'()=~|¡£¢∞§¶•ªº–≠\\_][:/.;@,_}{`*?>+<`«‘“æ/≥…≤ａa" minLength:minLength maxLength:@(60) characterSize:fullAndHalf]);

    // 全半角英字以外のみ
    XCTAssertFalse([Validator onlyAlphabetsString:@"0123456789" minLength:minLength maxLength:maxLength characterSize:fullAndHalf]);
    XCTAssertFalse([Validator onlyAlphabetsString:@"０１２３４５６７８９" minLength:minLength maxLength:maxLength characterSize:fullAndHalf]);
    XCTAssertFalse([Validator onlyAlphabetsString:@"ひらがな" minLength:minLength maxLength:maxLength characterSize:fullAndHalf]);
    XCTAssertFalse([Validator onlyAlphabetsString:@"カタカナ" minLength:minLength maxLength:maxLength characterSize:fullAndHalf]);
    XCTAssertFalse([Validator onlyAlphabetsString:@"ｶﾀｶﾅ" minLength:minLength maxLength:maxLength characterSize:fullAndHalf]);
    XCTAssertFalse([Validator onlyAlphabetsString:@"漢字" minLength:minLength maxLength:maxLength characterSize:fullAndHalf]);
    XCTAssertFalse([Validator onlyAlphabetsString:@"-^¥!\"#$%&'()=~|¡£¢∞§¶•ªº–≠\\_][:/.;@,_}{`*?>+<`«‘“æ/≥…≤" minLength:minLength maxLength:@(60) characterSize:fullAndHalf]);
}

#pragma mark - alphanumerics

/// 全角英数字のバリデーションをテスト
- (void)test_alphanumerics_characterSizeFull {

    NSNumber * const minLength = @(1);
    NSNumber * const maxLength = @(36);
    CharacterSize fullSize = CharacterSizeFull;

    // 英数字(全角)
    XCTAssertTrue([Validator alphanumericsString:@"ａｂｃｄｅｆｇｈｉｊｋｌｍｎｏｐｑｒｓｔｕｖｗｘｙｚ" minLength:minLength maxLength:maxLength characterSize:fullSize]);
    XCTAssertTrue([Validator alphanumericsString:@"ＡＢＣＤＥＦＧＨＩＪＫＬＭＮＯＰＱＲＳＴＵＶＷＸＹＺ" minLength:minLength maxLength:maxLength characterSize:fullSize]);
    XCTAssertTrue([Validator alphanumericsString:@"０１２３４５６７８９ａｂｃｄｅｆｇｈｉｊｋｌｍｎｏｐｑｒｓｔｕｖｗｘｙｚ" minLength:minLength maxLength:maxLength characterSize:fullSize]);
    XCTAssertTrue([Validator alphanumericsString:@"０１２３４５６７８９ＡＢＣＤＥＦＧＨＩＪＫＬＭＮＯＰＱＲＳＴＵＶＷＸＹＺ" minLength:minLength maxLength:maxLength characterSize:fullSize]);

    // 英数字(半角)
    XCTAssertFalse([Validator alphanumericsString:@"abcdefghijklmnopqrstuvwxyz" minLength:minLength maxLength:maxLength characterSize:fullSize]);
    XCTAssertFalse([Validator alphanumericsString:@"ABCDEFGHIJKLMNOPQRSTUVWXYZ" minLength:minLength maxLength:maxLength characterSize:fullSize]);
    XCTAssertFalse([Validator alphanumericsString:@"0123456789abcdefghijklmnopqrstuvwxyz" minLength:minLength maxLength:maxLength characterSize:fullSize]);
    XCTAssertFalse([Validator alphanumericsString:@"0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ" minLength:minLength maxLength:maxLength characterSize:fullSize]);

    // 0文字
    XCTAssertFalse([Validator alphanumericsString:@"" minLength:minLength maxLength:maxLength characterSize:fullSize]);
    // 37文字
    XCTAssertFalse([Validator alphanumericsString:@"００１２３４５６７８９ａｂｃｄｅｆｇｈｉｊｋｌｍｎｏｐｑｒｓｔｕｖｗｘｙｚ" minLength:minLength maxLength:maxLength characterSize:fullSize]);

    // 全角英数字+全角英数字以外
    XCTAssertFalse([Validator alphanumericsString:@"ａ０ひらがな" minLength:minLength maxLength:maxLength characterSize:fullSize]);
    XCTAssertFalse([Validator alphanumericsString:@"ａ０カタカナ" minLength:minLength maxLength:maxLength characterSize:fullSize]);
    XCTAssertFalse([Validator alphanumericsString:@"ａ０ｶﾀｶﾅ" minLength:minLength maxLength:maxLength characterSize:fullSize]);
    XCTAssertFalse([Validator alphanumericsString:@"ａ０漢字" minLength:minLength maxLength:maxLength characterSize:fullSize]);
    XCTAssertFalse([Validator alphanumericsString:@"ａ０-^¥!\"#$%&'()=~|¡£¢∞§¶•ªº–≠\\_][:/.;@,_}{`*?>+<`«‘“æ/≥…≤" minLength:minLength maxLength:@(60) characterSize:fullSize]);
    XCTAssertFalse([Validator alphanumericsString:@"ひらがなａ０" minLength:minLength maxLength:maxLength characterSize:fullSize]);
    XCTAssertFalse([Validator alphanumericsString:@"カタカナａ０" minLength:minLength maxLength:maxLength characterSize:fullSize]);
    XCTAssertFalse([Validator alphanumericsString:@"ｶﾀｶﾅａ０" minLength:minLength maxLength:maxLength characterSize:fullSize]);
    XCTAssertFalse([Validator alphanumericsString:@"漢字ａ０" minLength:minLength maxLength:maxLength characterSize:fullSize]);
    XCTAssertFalse([Validator alphanumericsString:@"-^¥!\"#$%&'()=~|¡£¢∞§¶•ªº–≠\\_][:/.;@,_}{`*?>+<`«‘“æ/≥…≤ａ０" minLength:minLength maxLength:@(60) characterSize:fullSize]);

    // 全角英数字以外のみ
    XCTAssertFalse([Validator alphanumericsString:@"ひらがな" minLength:minLength maxLength:maxLength characterSize:fullSize]);
    XCTAssertFalse([Validator alphanumericsString:@"カタカナ" minLength:minLength maxLength:maxLength characterSize:fullSize]);
    XCTAssertFalse([Validator alphanumericsString:@"ｶﾀｶﾅ" minLength:minLength maxLength:maxLength characterSize:fullSize]);
    XCTAssertFalse([Validator alphanumericsString:@"漢字" minLength:minLength maxLength:maxLength characterSize:fullSize]);
    XCTAssertFalse([Validator alphanumericsString:@"-^¥!\"#$%&'()=~|¡£¢∞§¶•ªº–≠\\_][:/.;@,_}{`*?>+<`«‘“æ/≥…≤" minLength:minLength maxLength:@(60) characterSize:fullSize]);
}

/// 半角英数字のバリデーションをテスト
- (void)test_alphanumerics_characterSizeHalf {

    NSNumber * const minLength = @(1);
    NSNumber * const maxLength = @(36);
    CharacterSize halfSize = CharacterSizeHalf;

    // 英数字(半角)
    XCTAssertTrue([Validator alphanumericsString:@"abcdefghijklmnopqrstuvwxyz" minLength:minLength maxLength:maxLength characterSize:halfSize]);
    XCTAssertTrue([Validator alphanumericsString:@"ABCDEFGHIJKLMNOPQRSTUVWXYZ" minLength:minLength maxLength:maxLength characterSize:halfSize]);
    XCTAssertTrue([Validator alphanumericsString:@"0123456789abcdefghijklmnopqrstuvwxyz" minLength:minLength maxLength:maxLength characterSize:halfSize]);
    XCTAssertTrue([Validator alphanumericsString:@"0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ" minLength:minLength maxLength:maxLength characterSize:halfSize]);

    // 英数字(全角)
    XCTAssertFalse([Validator alphanumericsString:@"ａｂｃｄｅｆｇｈｉｊｋｌｍｎｏｐｑｒｓｔｕｖｗｘｙｚ" minLength:minLength maxLength:maxLength characterSize:halfSize]);
    XCTAssertFalse([Validator alphanumericsString:@"ＡＢＣＤＥＦＧＨＩＪＫＬＭＮＯＰＱＲＳＴＵＶＷＸＹＺ" minLength:minLength maxLength:maxLength characterSize:halfSize]);
    XCTAssertFalse([Validator alphanumericsString:@"０１２３４５６７８９ａｂｃｄｅｆｇｈｉｊｋｌｍｎｏｐｑｒｓｔｕｖｗｘｙｚ" minLength:minLength maxLength:maxLength characterSize:halfSize]);
    XCTAssertFalse([Validator alphanumericsString:@"０１２３４５６７８９ＡＢＣＤＥＦＧＨＩＪＫＬＭＮＯＰＱＲＳＴＵＶＷＸＹＺ" minLength:minLength maxLength:maxLength characterSize:halfSize]);

    // 0文字
    XCTAssertFalse([Validator alphanumericsString:@"" minLength:minLength maxLength:maxLength characterSize:halfSize]);
    // 37文字
    XCTAssertFalse([Validator alphanumericsString:@"00123456789abcdefghijklmnopqrstuvwxyz" minLength:minLength maxLength:maxLength characterSize:halfSize]);

    // 半角英数字+半角英数字以外
    XCTAssertFalse([Validator alphanumericsString:@"a0ひらがな" minLength:minLength maxLength:maxLength characterSize:halfSize]);
    XCTAssertFalse([Validator alphanumericsString:@"a0カタカナ" minLength:minLength maxLength:maxLength characterSize:halfSize]);
    XCTAssertFalse([Validator alphanumericsString:@"a0ｶﾀｶﾅ" minLength:minLength maxLength:maxLength characterSize:halfSize]);
    XCTAssertFalse([Validator alphanumericsString:@"a0漢字" minLength:minLength maxLength:maxLength characterSize:halfSize]);
    XCTAssertFalse([Validator alphanumericsString:@"a0-^¥!\"#$%&'()=~|¡£¢∞§¶•ªº–≠\\_][:/.;@,_}{`*?>+<`«‘“æ/≥…≤" minLength:minLength maxLength:@(60) characterSize:halfSize]);
    XCTAssertFalse([Validator alphanumericsString:@"ひらがなa0" minLength:minLength maxLength:maxLength characterSize:halfSize]);
    XCTAssertFalse([Validator alphanumericsString:@"カタカナa0" minLength:minLength maxLength:maxLength characterSize:halfSize]);
    XCTAssertFalse([Validator alphanumericsString:@"ｶﾀｶﾅa0" minLength:minLength maxLength:maxLength characterSize:halfSize]);
    XCTAssertFalse([Validator alphanumericsString:@"漢字a0" minLength:minLength maxLength:maxLength characterSize:halfSize]);
    XCTAssertFalse([Validator alphanumericsString:@"-^¥!\"#$%&'()=~|¡£¢∞§¶•ªº–≠\\_][:/.;@,_}{`*?>+<`«‘“æ/≥…≤a0" minLength:minLength maxLength:@(60) characterSize:halfSize]);

    // 半角英数字以外のみ
    XCTAssertFalse([Validator alphanumericsString:@"ひらがな" minLength:minLength maxLength:maxLength characterSize:halfSize]);
    XCTAssertFalse([Validator alphanumericsString:@"カタカナ" minLength:minLength maxLength:maxLength characterSize:halfSize]);
    XCTAssertFalse([Validator alphanumericsString:@"ｶﾀｶﾅ" minLength:minLength maxLength:maxLength characterSize:halfSize]);
    XCTAssertFalse([Validator alphanumericsString:@"漢字" minLength:minLength maxLength:maxLength characterSize:halfSize]);
    XCTAssertFalse([Validator alphanumericsString:@"-^¥!\"#$%&'()=~|¡£¢∞§¶•ªº–≠\\_][:/.;@,_}{`*?>+<`«‘“æ/≥…≤" minLength:minLength maxLength:@(60) characterSize:halfSize]);
}

/// 全半角英数字のバリデーションをテスト
- (void)test_alphanumerics_characterSizeFullAndHalf {

    NSNumber * const minLength = @(1);
    NSNumber * const maxLength = @(36);
    CharacterSize fullAndHalf = CharacterSizeFullAndHalf;

    // 英数字(半角)
    XCTAssertTrue([Validator alphanumericsString:@"abcdefghijklmnopqrstuvwxyz" minLength:minLength maxLength:maxLength characterSize:fullAndHalf]);
    XCTAssertTrue([Validator alphanumericsString:@"ABCDEFGHIJKLMNOPQRSTUVWXYZ" minLength:minLength maxLength:maxLength characterSize:fullAndHalf]);
    XCTAssertTrue([Validator alphanumericsString:@"0123456789abcdefghijklmnopqrstuvwxyz" minLength:minLength maxLength:maxLength characterSize:fullAndHalf]);
    XCTAssertTrue([Validator alphanumericsString:@"0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ" minLength:minLength maxLength:maxLength characterSize:fullAndHalf]);

    // 英数字(全角)
    XCTAssertTrue([Validator alphanumericsString:@"ａｂｃｄｅｆｇｈｉｊｋｌｍｎｏｐｑｒｓｔｕｖｗｘｙｚ" minLength:minLength maxLength:maxLength characterSize:fullAndHalf]);
    XCTAssertTrue([Validator alphanumericsString:@"ＡＢＣＤＥＦＧＨＩＪＫＬＭＮＯＰＱＲＳＴＵＶＷＸＹＺ" minLength:minLength maxLength:maxLength characterSize:fullAndHalf]);
    XCTAssertTrue([Validator alphanumericsString:@"０１２３４５６７８９ａｂｃｄｅｆｇｈｉｊｋｌｍｎｏｐｑｒｓｔｕｖｗｘｙｚ" minLength:minLength maxLength:maxLength characterSize:fullAndHalf]);
    XCTAssertTrue([Validator alphanumericsString:@"０１２３４５６７８９ＡＢＣＤＥＦＧＨＩＪＫＬＭＮＯＰＱＲＳＴＵＶＷＸＹＺ" minLength:minLength maxLength:maxLength characterSize:fullAndHalf]);

    // 英数字(全半角)
    XCTAssertTrue([Validator alphanumericsString:@"ａｂｃｄｅｆｇｈｉｊｋｌｍnopqrstuvwxyz" minLength:minLength maxLength:maxLength characterSize:fullAndHalf]);
    XCTAssertTrue([Validator alphanumericsString:@"ＡＢＣＤＥＦＧＨＩＪＫＬＭNOPQRSTUVWXYZ" minLength:minLength maxLength:maxLength characterSize:fullAndHalf]);
    XCTAssertTrue([Validator alphanumericsString:@"０１２３４５６７８９abcdefghijklmnopqrstuvwxyz" minLength:minLength maxLength:maxLength characterSize:fullAndHalf]);
    XCTAssertTrue([Validator alphanumericsString:@"０１２３４５６７８９ABCDEFGHIJKLMNOPQRSTUVWXYZ" minLength:minLength maxLength:maxLength characterSize:fullAndHalf]);

    // 0文字
    XCTAssertFalse([Validator alphanumericsString:@"" minLength:minLength maxLength:maxLength characterSize:fullAndHalf]);
    // 37文字
    XCTAssertFalse([Validator alphanumericsString:@"００１２３４５６７８９abcdefghijklmnopqrstuvwxyz" minLength:minLength maxLength:maxLength characterSize:fullAndHalf]);

    // 全半角英数字+全半角英数字以外
    XCTAssertFalse([Validator alphanumericsString:@"a０ひらがな" minLength:minLength maxLength:maxLength characterSize:fullAndHalf]);
    XCTAssertFalse([Validator alphanumericsString:@"a０カタカナ" minLength:minLength maxLength:maxLength characterSize:fullAndHalf]);
    XCTAssertFalse([Validator alphanumericsString:@"a０ｶﾀｶﾅ" minLength:minLength maxLength:maxLength characterSize:fullAndHalf]);
    XCTAssertFalse([Validator alphanumericsString:@"a０漢字" minLength:minLength maxLength:maxLength characterSize:fullAndHalf]);
    XCTAssertFalse([Validator alphanumericsString:@"a０-^¥!\"#$%&'()=~|¡£¢∞§¶•ªº–≠\\_][:/.;@,_}{`*?>+<`«‘“æ/≥…≤" minLength:minLength maxLength:@(60) characterSize:fullAndHalf]);
    XCTAssertFalse([Validator alphanumericsString:@"ひらがなa０" minLength:minLength maxLength:maxLength characterSize:fullAndHalf]);
    XCTAssertFalse([Validator alphanumericsString:@"カタカナa０" minLength:minLength maxLength:maxLength characterSize:fullAndHalf]);
    XCTAssertFalse([Validator alphanumericsString:@"ｶﾀｶﾅa０" minLength:minLength maxLength:maxLength characterSize:fullAndHalf]);
    XCTAssertFalse([Validator alphanumericsString:@"漢字a０" minLength:minLength maxLength:maxLength characterSize:fullAndHalf]);
    XCTAssertFalse([Validator alphanumericsString:@"-^¥!\"#$%&'()=~|¡£¢∞§¶•ªº–≠\\_][:/.;@,_}{`*?>+<`«‘“æ/≥…≤a０" minLength:minLength maxLength:@(60) characterSize:fullAndHalf]);

    // 全半角英数字以外のみ
    XCTAssertFalse([Validator alphanumericsString:@"ひらがな" minLength:minLength maxLength:maxLength characterSize:fullAndHalf]);
    XCTAssertFalse([Validator alphanumericsString:@"カタカナ" minLength:minLength maxLength:maxLength characterSize:fullAndHalf]);
    XCTAssertFalse([Validator alphanumericsString:@"ｶﾀｶﾅ" minLength:minLength maxLength:maxLength characterSize:fullAndHalf]);
    XCTAssertFalse([Validator alphanumericsString:@"漢字" minLength:minLength maxLength:maxLength characterSize:fullAndHalf]);
    XCTAssertFalse([Validator alphanumericsString:@"-^¥!\"#$%&'()=~|¡£¢∞§¶•ªº–≠\\_][:/.;@,_}{`*?>+<`«‘“æ/≥…≤" minLength:minLength maxLength:@(60) characterSize:fullAndHalf]);
}

#pragma mark - onlyHalfSize

/// 半角文字のバリデーションをテスト
- (void)test_onlyHalfSize {

    NSNumber * const minLength = @(1);
    NSNumber * const maxLength = @(36);

    // 半角のみ
    XCTAssertTrue([Validator onlyHalfSizeString:@"abcdefghijklmnopqrstuvwxyz" minLength:minLength maxLength:maxLength]);
    XCTAssertTrue([Validator onlyHalfSizeString:@"ABCDEFGHIJKLMNOPQRSTUVWXYZ" minLength:minLength maxLength:maxLength]);
    XCTAssertTrue([Validator onlyHalfSizeString:@"0123456789abcdefghijklmnopqrstuvwxyz" minLength:minLength maxLength:maxLength]);
    XCTAssertTrue([Validator onlyHalfSizeString:@"0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ" minLength:minLength maxLength:maxLength]);
    XCTAssertTrue([Validator onlyHalfSizeString:@"ｶﾀｶﾅ" minLength:minLength maxLength:maxLength]);

    // 全角のみ
    XCTAssertFalse([Validator onlyHalfSizeString:@"ひらがな" minLength:minLength maxLength:maxLength]);
    XCTAssertFalse([Validator onlyHalfSizeString:@"カタカナ" minLength:minLength maxLength:maxLength]);
    XCTAssertFalse([Validator onlyHalfSizeString:@"漢字" minLength:minLength maxLength:maxLength]);
    XCTAssertFalse([Validator onlyHalfSizeString:@"ａｂｃｄｅｆｇｈｉｊｋｌｍｎｏｐｑｒｓｔｕｖｗｘｙｚ" minLength:minLength maxLength:maxLength]);
    XCTAssertFalse([Validator onlyHalfSizeString:@"ＡＢＣＤＥＦＧＨＩＪＫＬＭＮＯＰＱＲＳＴＵＶＷＸＹＺ" minLength:minLength maxLength:maxLength]);
    XCTAssertFalse([Validator onlyHalfSizeString:@"０１２３４５６７８９ａｂｃｄｅｆｇｈｉｊｋｌｍｎｏｐｑｒｓｔｕｖｗｘｙｚ" minLength:minLength maxLength:maxLength]);
    XCTAssertFalse([Validator onlyHalfSizeString:@"０１２３４５６７８９ＡＢＣＤＥＦＧＨＩＪＫＬＭＮＯＰＱＲＳＴＵＶＷＸＹＺ" minLength:minLength maxLength:maxLength]);

    // 全半角
    XCTAssertFalse([Validator onlyHalfSizeString:@"ａｂｃｄｅｆｇｈｉｊｋｌｍnopqrstuvwxyz" minLength:minLength maxLength:maxLength]);
    XCTAssertFalse([Validator onlyHalfSizeString:@"ＡＢＣＤＥＦＧＨＩＪＫＬＭNOPQRSTUVWXYZ" minLength:minLength maxLength:maxLength]);
    XCTAssertFalse([Validator onlyHalfSizeString:@"０１２３４５６７８９abcdefghijklmnopqrstuvwxyz" minLength:minLength maxLength:maxLength]);
    XCTAssertFalse([Validator onlyHalfSizeString:@"０１２３４５６７８９ABCDEFGHIJKLMNOPQRSTUVWXYZ" minLength:minLength maxLength:maxLength]);

    // 許容記号
    XCTAssertTrue([Validator onlyHalfSizeString:@"-" minLength:minLength maxLength:maxLength]);
    XCTAssertTrue([Validator onlyHalfSizeString:@"^" minLength:minLength maxLength:maxLength]);
    XCTAssertTrue([Validator onlyHalfSizeString:@"!" minLength:minLength maxLength:maxLength]);
    XCTAssertTrue([Validator onlyHalfSizeString:@"\"" minLength:minLength maxLength:maxLength]);
    XCTAssertTrue([Validator onlyHalfSizeString:@"#" minLength:minLength maxLength:maxLength]);
    XCTAssertTrue([Validator onlyHalfSizeString:@"$" minLength:minLength maxLength:maxLength]);
    XCTAssertTrue([Validator onlyHalfSizeString:@"%" minLength:minLength maxLength:maxLength]);
    XCTAssertTrue([Validator onlyHalfSizeString:@"&" minLength:minLength maxLength:maxLength]);
    XCTAssertTrue([Validator onlyHalfSizeString:@"'" minLength:minLength maxLength:maxLength]);
    XCTAssertTrue([Validator onlyHalfSizeString:@"(" minLength:minLength maxLength:maxLength]);
    XCTAssertTrue([Validator onlyHalfSizeString:@")" minLength:minLength maxLength:maxLength]);
    XCTAssertTrue([Validator onlyHalfSizeString:@"=" minLength:minLength maxLength:maxLength]);
    XCTAssertTrue([Validator onlyHalfSizeString:@"~" minLength:minLength maxLength:maxLength]);
    XCTAssertTrue([Validator onlyHalfSizeString:@"|" minLength:minLength maxLength:maxLength]);
    XCTAssertTrue([Validator onlyHalfSizeString:@"\\" minLength:minLength maxLength:maxLength]);
    XCTAssertTrue([Validator onlyHalfSizeString:@"_" minLength:minLength maxLength:maxLength]);
    XCTAssertTrue([Validator onlyHalfSizeString:@"]" minLength:minLength maxLength:maxLength]);
    XCTAssertTrue([Validator onlyHalfSizeString:@"[" minLength:minLength maxLength:maxLength]);
    XCTAssertTrue([Validator onlyHalfSizeString:@":" minLength:minLength maxLength:maxLength]);
    XCTAssertTrue([Validator onlyHalfSizeString:@"/" minLength:minLength maxLength:maxLength]);
    XCTAssertTrue([Validator onlyHalfSizeString:@"." minLength:minLength maxLength:maxLength]);
    XCTAssertTrue([Validator onlyHalfSizeString:@";" minLength:minLength maxLength:maxLength]);
    XCTAssertTrue([Validator onlyHalfSizeString:@"@" minLength:minLength maxLength:maxLength]);
    XCTAssertTrue([Validator onlyHalfSizeString:@"," minLength:minLength maxLength:maxLength]);
    XCTAssertTrue([Validator onlyHalfSizeString:@"}" minLength:minLength maxLength:maxLength]);
    XCTAssertTrue([Validator onlyHalfSizeString:@"{" minLength:minLength maxLength:maxLength]);
    XCTAssertTrue([Validator onlyHalfSizeString:@"`" minLength:minLength maxLength:maxLength]);
    XCTAssertTrue([Validator onlyHalfSizeString:@"*" minLength:minLength maxLength:maxLength]);
    XCTAssertTrue([Validator onlyHalfSizeString:@"?" minLength:minLength maxLength:maxLength]);
    XCTAssertTrue([Validator onlyHalfSizeString:@">" minLength:minLength maxLength:maxLength]);
    XCTAssertTrue([Validator onlyHalfSizeString:@"+" minLength:minLength maxLength:maxLength]);
    XCTAssertTrue([Validator onlyHalfSizeString:@"<" minLength:minLength maxLength:maxLength]);

    XCTAssertTrue([Validator onlyHalfSizeString:@"¥" minLength:minLength maxLength:maxLength]);
    XCTAssertTrue([Validator onlyHalfSizeString:@"¡" minLength:minLength maxLength:maxLength]);
    XCTAssertTrue([Validator onlyHalfSizeString:@"£" minLength:minLength maxLength:maxLength]);
    XCTAssertTrue([Validator onlyHalfSizeString:@"¢" minLength:minLength maxLength:maxLength]);
    XCTAssertTrue([Validator onlyHalfSizeString:@"∞" minLength:minLength maxLength:maxLength]);
    XCTAssertTrue([Validator onlyHalfSizeString:@"§" minLength:minLength maxLength:maxLength]);
    XCTAssertTrue([Validator onlyHalfSizeString:@"¶" minLength:minLength maxLength:maxLength]);
    XCTAssertTrue([Validator onlyHalfSizeString:@"•" minLength:minLength maxLength:maxLength]);
    XCTAssertTrue([Validator onlyHalfSizeString:@"ª" minLength:minLength maxLength:maxLength]);
    XCTAssertTrue([Validator onlyHalfSizeString:@"º" minLength:minLength maxLength:maxLength]);
    XCTAssertTrue([Validator onlyHalfSizeString:@"–" minLength:minLength maxLength:maxLength]);
    XCTAssertTrue([Validator onlyHalfSizeString:@"≠" minLength:minLength maxLength:maxLength]);
    XCTAssertTrue([Validator onlyHalfSizeString:@"«" minLength:minLength maxLength:maxLength]);
    XCTAssertTrue([Validator onlyHalfSizeString:@"‘" minLength:minLength maxLength:maxLength]);
    XCTAssertTrue([Validator onlyHalfSizeString:@"“" minLength:minLength maxLength:maxLength]);
    XCTAssertTrue([Validator onlyHalfSizeString:@"æ" minLength:minLength maxLength:maxLength]);
    XCTAssertTrue([Validator onlyHalfSizeString:@"≥" minLength:minLength maxLength:maxLength]);
    XCTAssertTrue([Validator onlyHalfSizeString:@"…" minLength:minLength maxLength:maxLength]);
    XCTAssertTrue([Validator onlyHalfSizeString:@"≤" minLength:minLength maxLength:maxLength]);

    // 0文字
    XCTAssertFalse([Validator onlyHalfSizeString:@"" minLength:minLength maxLength:maxLength]);
    // 37文字
    XCTAssertFalse([Validator onlyHalfSizeString:@"00123456789abcdefghijklmnopqrstuvwxyz" minLength:minLength maxLength:maxLength]);
}

#pragma mark - notContainHalfSize

/// 全角文字のバリデーションをテスト
- (void)test_notContainHalfSize {

    NSNumber * const minLength = @(1);
    NSNumber * const maxLength = @(36);

    // 全角のみ
    XCTAssertTrue([Validator notContainHalfSizeString:@"ひらがな" minLength:minLength maxLength:maxLength]);
    XCTAssertTrue([Validator notContainHalfSizeString:@"カタカナ" minLength:minLength maxLength:maxLength]);
    XCTAssertTrue([Validator notContainHalfSizeString:@"漢字" minLength:minLength maxLength:maxLength]);
    XCTAssertTrue([Validator notContainHalfSizeString:@"ａｂｃｄｅｆｇｈｉｊｋｌｍｎｏｐｑｒｓｔｕｖｗｘｙｚ" minLength:minLength maxLength:maxLength]);
    XCTAssertTrue([Validator notContainHalfSizeString:@"ＡＢＣＤＥＦＧＨＩＪＫＬＭＮＯＰＱＲＳＴＵＶＷＸＹＺ" minLength:minLength maxLength:maxLength]);
    XCTAssertTrue([Validator notContainHalfSizeString:@"０１２３４５６７８９ａｂｃｄｅｆｇｈｉｊｋｌｍｎｏｐｑｒｓｔｕｖｗｘｙｚ" minLength:minLength maxLength:maxLength]);
    XCTAssertTrue([Validator notContainHalfSizeString:@"０１２３４５６７８９ＡＢＣＤＥＦＧＨＩＪＫＬＭＮＯＰＱＲＳＴＵＶＷＸＹＺ" minLength:minLength maxLength:maxLength]);

    // 半角のみ
    XCTAssertFalse([Validator notContainHalfSizeString:@"abcdefghijklmnopqrstuvwxyz" minLength:minLength maxLength:maxLength]);
    XCTAssertFalse([Validator notContainHalfSizeString:@"ABCDEFGHIJKLMNOPQRSTUVWXYZ" minLength:minLength maxLength:maxLength]);
    XCTAssertFalse([Validator notContainHalfSizeString:@"0123456789abcdefghijklmnopqrstuvwxyz" minLength:minLength maxLength:maxLength]);
    XCTAssertFalse([Validator notContainHalfSizeString:@"0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ" minLength:minLength maxLength:maxLength]);
    XCTAssertFalse([Validator notContainHalfSizeString:@"ｶﾀｶﾅ" minLength:minLength maxLength:maxLength]);

    // 全半角
    XCTAssertFalse([Validator notContainHalfSizeString:@"ａｂｃｄｅｆｇｈｉｊｋｌｍnopqrstuvwxyz" minLength:minLength maxLength:maxLength]);
    XCTAssertFalse([Validator notContainHalfSizeString:@"ＡＢＣＤＥＦＧＨＩＪＫＬＭNOPQRSTUVWXYZ" minLength:minLength maxLength:maxLength]);
    XCTAssertFalse([Validator notContainHalfSizeString:@"０１２３４５６７８９abcdefghijklmnopqrstuvwxyz" minLength:minLength maxLength:maxLength]);
    XCTAssertFalse([Validator notContainHalfSizeString:@"０１２３４５６７８９ABCDEFGHIJKLMNOPQRSTUVWXYZ" minLength:minLength maxLength:maxLength]);

    // 許容記号
    XCTAssertFalse([Validator notContainHalfSizeString:@"-" minLength:minLength maxLength:maxLength]);
    XCTAssertFalse([Validator notContainHalfSizeString:@"^" minLength:minLength maxLength:maxLength]);
    XCTAssertFalse([Validator notContainHalfSizeString:@"!" minLength:minLength maxLength:maxLength]);
    XCTAssertFalse([Validator notContainHalfSizeString:@"\"" minLength:minLength maxLength:maxLength]);
    XCTAssertFalse([Validator notContainHalfSizeString:@"#" minLength:minLength maxLength:maxLength]);
    XCTAssertFalse([Validator notContainHalfSizeString:@"$" minLength:minLength maxLength:maxLength]);
    XCTAssertFalse([Validator notContainHalfSizeString:@"%" minLength:minLength maxLength:maxLength]);
    XCTAssertFalse([Validator notContainHalfSizeString:@"&" minLength:minLength maxLength:maxLength]);
    XCTAssertFalse([Validator notContainHalfSizeString:@"'" minLength:minLength maxLength:maxLength]);
    XCTAssertFalse([Validator notContainHalfSizeString:@"(" minLength:minLength maxLength:maxLength]);
    XCTAssertFalse([Validator notContainHalfSizeString:@")" minLength:minLength maxLength:maxLength]);
    XCTAssertFalse([Validator notContainHalfSizeString:@"=" minLength:minLength maxLength:maxLength]);
    XCTAssertFalse([Validator notContainHalfSizeString:@"~" minLength:minLength maxLength:maxLength]);
    XCTAssertFalse([Validator notContainHalfSizeString:@"|" minLength:minLength maxLength:maxLength]);
    XCTAssertFalse([Validator notContainHalfSizeString:@"\\" minLength:minLength maxLength:maxLength]);
    XCTAssertFalse([Validator notContainHalfSizeString:@"_" minLength:minLength maxLength:maxLength]);
    XCTAssertFalse([Validator notContainHalfSizeString:@"]" minLength:minLength maxLength:maxLength]);
    XCTAssertFalse([Validator notContainHalfSizeString:@"[" minLength:minLength maxLength:maxLength]);
    XCTAssertFalse([Validator notContainHalfSizeString:@":" minLength:minLength maxLength:maxLength]);
    XCTAssertFalse([Validator notContainHalfSizeString:@"/" minLength:minLength maxLength:maxLength]);
    XCTAssertFalse([Validator notContainHalfSizeString:@"." minLength:minLength maxLength:maxLength]);
    XCTAssertFalse([Validator notContainHalfSizeString:@";" minLength:minLength maxLength:maxLength]);
    XCTAssertFalse([Validator notContainHalfSizeString:@"@" minLength:minLength maxLength:maxLength]);
    XCTAssertFalse([Validator notContainHalfSizeString:@"," minLength:minLength maxLength:maxLength]);
    XCTAssertFalse([Validator notContainHalfSizeString:@"}" minLength:minLength maxLength:maxLength]);
    XCTAssertFalse([Validator notContainHalfSizeString:@"{" minLength:minLength maxLength:maxLength]);
    XCTAssertFalse([Validator notContainHalfSizeString:@"`" minLength:minLength maxLength:maxLength]);
    XCTAssertFalse([Validator notContainHalfSizeString:@"*" minLength:minLength maxLength:maxLength]);
    XCTAssertFalse([Validator notContainHalfSizeString:@"?" minLength:minLength maxLength:maxLength]);
    XCTAssertFalse([Validator notContainHalfSizeString:@">" minLength:minLength maxLength:maxLength]);
    XCTAssertFalse([Validator notContainHalfSizeString:@"+" minLength:minLength maxLength:maxLength]);
    XCTAssertFalse([Validator notContainHalfSizeString:@"<" minLength:minLength maxLength:maxLength]);

    XCTAssertFalse([Validator notContainHalfSizeString:@"¥" minLength:minLength maxLength:maxLength]);
    XCTAssertFalse([Validator notContainHalfSizeString:@"¡" minLength:minLength maxLength:maxLength]);
    XCTAssertFalse([Validator notContainHalfSizeString:@"£" minLength:minLength maxLength:maxLength]);
    XCTAssertFalse([Validator notContainHalfSizeString:@"¢" minLength:minLength maxLength:maxLength]);
    XCTAssertFalse([Validator notContainHalfSizeString:@"∞" minLength:minLength maxLength:maxLength]);
    XCTAssertFalse([Validator notContainHalfSizeString:@"§" minLength:minLength maxLength:maxLength]);
    XCTAssertFalse([Validator notContainHalfSizeString:@"¶" minLength:minLength maxLength:maxLength]);
    XCTAssertFalse([Validator notContainHalfSizeString:@"•" minLength:minLength maxLength:maxLength]);
    XCTAssertFalse([Validator notContainHalfSizeString:@"ª" minLength:minLength maxLength:maxLength]);
    XCTAssertFalse([Validator notContainHalfSizeString:@"º" minLength:minLength maxLength:maxLength]);
    XCTAssertFalse([Validator notContainHalfSizeString:@"–" minLength:minLength maxLength:maxLength]);
    XCTAssertFalse([Validator notContainHalfSizeString:@"≠" minLength:minLength maxLength:maxLength]);
    XCTAssertFalse([Validator notContainHalfSizeString:@"«" minLength:minLength maxLength:maxLength]);
    XCTAssertFalse([Validator notContainHalfSizeString:@"‘" minLength:minLength maxLength:maxLength]);
    XCTAssertFalse([Validator notContainHalfSizeString:@"“" minLength:minLength maxLength:maxLength]);
    XCTAssertFalse([Validator notContainHalfSizeString:@"æ" minLength:minLength maxLength:maxLength]);
    XCTAssertFalse([Validator notContainHalfSizeString:@"≥" minLength:minLength maxLength:maxLength]);
    XCTAssertFalse([Validator notContainHalfSizeString:@"…" minLength:minLength maxLength:maxLength]);
    XCTAssertFalse([Validator notContainHalfSizeString:@"≤" minLength:minLength maxLength:maxLength]);

    // 0文字
    XCTAssertFalse([Validator notContainHalfSizeString:@"" minLength:minLength maxLength:maxLength]);
    // 37文字
    XCTAssertFalse([Validator notContainHalfSizeString:@"００１２３４５６７８９ａｂｃｄｅｆｇｈｉｊｋｌｍｎｏｐｑｒｓｔｕｖｗｘｙｚ" minLength:minLength maxLength:maxLength]);
}

#pragma mark - mailAddress

/// メールアドレス形式のバリデーションをテスト
- (void)test_mailAddress {

    XCTAssertTrue([Validator validateMailAddress:@"test@co.jp"]);
    XCTAssertTrue([Validator validateMailAddress:@"test@a.bc"]);

    // 半角スペースを含む
    XCTAssertFalse([Validator validateMailAddress:@"t est@co.jp"]);
    // 全角スペースを含む
    XCTAssertFalse([Validator validateMailAddress:@"t　est@co.jp"]);

    // ローカルパートが全角
    XCTAssertFalse([Validator validateMailAddress:@"ｔｅｓｕｔｏ@co.jp"]);
    // @が全角
    XCTAssertFalse([Validator validateMailAddress:@"test＠co.jp"]);
    // ドメインが全角
    XCTAssertFalse([Validator validateMailAddress:@"test@ｃｏ．ｊｐ"]);

    // @無し
    XCTAssertFalse([Validator validateMailAddress:@"testco.jp"]);
    // ドメイン無し
    XCTAssertFalse([Validator validateMailAddress:@"test@"]);
    // ローカルパート無し
    XCTAssertFalse([Validator validateMailAddress:@"@co.jp"]);

    // ドメインにドット無し
    XCTAssertFalse([Validator validateMailAddress:@"test@co"]);
    // @とドットの間に英数字無し
    XCTAssertFalse([Validator validateMailAddress:@"test@.jp"]);

    // ドメインのドット以降が2~4文字の英字ではない
    XCTAssertFalse([Validator validateMailAddress:@"test@co."]);
    XCTAssertFalse([Validator validateMailAddress:@"test@co.b"]);
    XCTAssertFalse([Validator validateMailAddress:@"test@co.b1"]);
    XCTAssertFalse([Validator validateMailAddress:@"test@co.b.c"]);
    XCTAssertFalse([Validator validateMailAddress:@"test@co.cdefg"]);
}

#pragma mark - checkLength

/// 文字列の長さのバリデーションをテスト
- (void)test_checkLength {

    NSNumber * const minLength = @(5);
    NSNumber * const maxLength = @(10);

    XCTAssertTrue([Validator checkLengthString:@"01234" minLength:minLength maxLength:maxLength]);
    XCTAssertTrue([Validator checkLengthString:@"0123456789" minLength:minLength maxLength:maxLength]);
    XCTAssertFalse([Validator checkLengthString:@"0123" minLength:minLength maxLength:maxLength]);
    XCTAssertFalse([Validator checkLengthString:@"00123456789" minLength:minLength maxLength:maxLength]);

    XCTAssertTrue([Validator checkLengthString:@"０１２３４" minLength:minLength maxLength:maxLength]);
    XCTAssertTrue([Validator checkLengthString:@"０１２３４５６７８９" minLength:minLength maxLength:maxLength]);
    XCTAssertFalse([Validator checkLengthString:@"０１２３" minLength:minLength maxLength:maxLength]);
    XCTAssertFalse([Validator checkLengthString:@"００１２３４５６７８９" minLength:minLength maxLength:maxLength]);

    XCTAssertTrue([Validator checkLengthString:@"abcde" minLength:minLength maxLength:maxLength]);
    XCTAssertTrue([Validator checkLengthString:@"abcdefghij" minLength:minLength maxLength:maxLength]);
    XCTAssertFalse([Validator checkLengthString:@"abcd" minLength:minLength maxLength:maxLength]);
    XCTAssertFalse([Validator checkLengthString:@"abcdefghijk" minLength:minLength maxLength:maxLength]);

    XCTAssertTrue([Validator checkLengthString:@"ａｂｃｄｅ" minLength:minLength maxLength:maxLength]);
    XCTAssertTrue([Validator checkLengthString:@"ａｂｃｄｅｆｇｈｉｊ" minLength:minLength maxLength:maxLength]);
    XCTAssertFalse([Validator checkLengthString:@"ａｂｃｄ" minLength:minLength maxLength:maxLength]);
    XCTAssertFalse([Validator checkLengthString:@"ａｂｃｄｅｆｇｈｉｊｋ" minLength:minLength maxLength:maxLength]);

    XCTAssertTrue([Validator checkLengthString:@"あいうえお" minLength:minLength maxLength:maxLength]);
    XCTAssertTrue([Validator checkLengthString:@"あいうえおかきくけこ" minLength:minLength maxLength:maxLength]);
    XCTAssertFalse([Validator checkLengthString:@"あいうえ" minLength:minLength maxLength:maxLength]);
    XCTAssertFalse([Validator checkLengthString:@"あいうえおかきくけこさ" minLength:minLength maxLength:maxLength]);

    XCTAssertTrue([Validator checkLengthString:@"アイウエオ" minLength:minLength maxLength:maxLength]);
    XCTAssertTrue([Validator checkLengthString:@"アイウエオカキクケコ" minLength:minLength maxLength:maxLength]);
    XCTAssertFalse([Validator checkLengthString:@"アイウエ" minLength:minLength maxLength:maxLength]);
    XCTAssertFalse([Validator checkLengthString:@"アイウエオカキクケコサ" minLength:minLength maxLength:maxLength]);

    XCTAssertTrue([Validator checkLengthString:@"ｱｲｳｴｵ" minLength:minLength maxLength:maxLength]);
    XCTAssertTrue([Validator checkLengthString:@"ｱｲｳｴｵｶｷｸｹｺ" minLength:minLength maxLength:maxLength]);
    XCTAssertFalse([Validator checkLengthString:@"ｱｲｳｴ" minLength:minLength maxLength:maxLength]);
    XCTAssertFalse([Validator checkLengthString:@"ｱｲｳｴｵｶｷｸｹｺｻ" minLength:minLength maxLength:maxLength]);

    XCTAssertTrue([Validator checkLengthString:@"一二三四五" minLength:minLength maxLength:maxLength]);
    XCTAssertTrue([Validator checkLengthString:@"一二三四五六七八九十" minLength:minLength maxLength:maxLength]);
    XCTAssertFalse([Validator checkLengthString:@"一二三四" minLength:minLength maxLength:maxLength]);
    XCTAssertFalse([Validator checkLengthString:@"〇一二三四五六七八九十" minLength:minLength maxLength:maxLength]);
}
@end
