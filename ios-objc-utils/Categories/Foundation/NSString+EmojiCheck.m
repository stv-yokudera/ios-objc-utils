//
//  NSString+EmojiCheck.m
//  ios-objc-utils
//
//  Created by YukiOkudera on 2018/09/16.
//  Copyright © 2018年 OkuderaYuki. All rights reserved.
//

#import <objc/runtime.h>
#import <CoreText/CoreText.h>
#import "NSString+EmojiCheck.h"

@implementation NSString (EmojiCheck)

- (BOOL)hasEmoji {

    __block BOOL hasEmoji = NO;

    [self enumerateSubstringsInRange:NSMakeRange(0, self.length)
                             options:NSStringEnumerationByComposedCharacterSequences
                          usingBlock: ^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
                              if ([substring isEmoji]) {
                                  hasEmoji = YES;
                                  return;
                              }
                          }];
    return hasEmoji;
}

- (NSInteger)graphemeLength {

    __block NSInteger length = 0;

    [self enumerateSubstringsInRange:NSMakeRange(0, self.length)
                             options:NSStringEnumerationByComposedCharacterSequences
                          usingBlock: ^(NSString* substring, NSRange substringRange, NSRange enclosingRange, BOOL* stop) {
                              length++;
                          }];
    return length;
}

- (NSString *)removeEmoji {

    __block NSMutableString *mutableString = [NSMutableString stringWithCapacity:self.length];

    [self enumerateSubstringsInRange:NSMakeRange(0, self.length)
                             options:NSStringEnumerationByComposedCharacterSequences
                          usingBlock: ^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {

                              [mutableString appendString:[substring isEmoji] ? @"" : substring];
                          }];
    return mutableString.copy;
}

#pragma mark - private

- (BOOL)isEmoji {

    NSUInteger length = self.length;
    unichar characters[length];
    for(int i = 0; i < length; i++) {
        characters[i] = [self characterAtIndex:i];
    }
    if (length == 1 && characters[0] <= 57) {
        return NO;
    }

    NSString const *fontName = @"AppleColorEmoji";
    const CGFloat fontSize = 20.0;
    CTFontRef fontRef = CTFontCreateWithName((CFStringRef)fontName, fontSize, NULL);

    CGGlyph glyphs[length];
    const bool result = CTFontGetGlyphsForCharacters(fontRef, characters, glyphs, length);
    CFRelease(fontRef);
    return result;
}

@end
