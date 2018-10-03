//
//  NSString+Bytes.m
//  ios-objc-sampler
//
//  Created by YukiOkudera on 2018/10/04.
//  Copyright © 2018 YukiOkudera. All rights reserved.
//

#import <objc/runtime.h>
#import "NSString+Bytes.h"

@implementation NSString (Bytes)

- (NSUInteger)bytes {
    return [self lengthOfBytesUsingEncoding:NSUTF8StringEncoding];
}

- (NSArray<NSString *> *)contain4BytesCharacters {
    
    __block NSMutableArray<NSString *> *strings = [@[] mutableCopy];

    [self enumerateSubstringsInRange:NSMakeRange(0, self.length)
                             options:NSStringEnumerationByComposedCharacterSequences
                          usingBlock: ^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {

                              if (substring.bytes == 4 && ![strings containsObject:substring]) {
                                  [strings addObject:substring];
                              }
                          }];
    return strings.copy;
}

@end
