//
//  UIViewController+Validate4BytesCharacters.m
//  ios-objc-sampler
//
//  Created by YukiOkudera on 2018/10/04.
//  Copyright © 2018 YukiOkudera. All rights reserved.
//

#import "UIViewController+Validate4BytesCharacters.h"
#import "NSString+Bytes.h"

@implementation UIViewController (Validate4BytesCharacters)

- (nullable UIAlertController *)validate4BytesCharacters {

    NSMutableArray<NSString *> *mutableStringArray = [@[] mutableCopy];

    NSArray<__kindof UITextField *> *textFields = [self subTextFieldsWithView:self.view];
    NSArray<__kindof UITextView *> *textViews = [self subTextViewsWithView:self.view];

    for (__kindof UITextField *textField in textFields) {

        NSString *text = textField.text ?: @"";
        [mutableStringArray addObjectsFromArray:[text contain4BytesCharacters]];
    }

    for (__kindof UITextView *textView in textViews) {

        NSString *text = textView.text ?: @"";
        [mutableStringArray addObjectsFromArray:[text contain4BytesCharacters]];
    }

    // 重複除去した文字列配列
    NSArray<NSString *> *stringArray = [[NSSet setWithArray:mutableStringArray.copy] allObjects];

    if (stringArray.count == 0) {
        return nil;
    }

    NSMutableString *mutableString = [@"" mutableCopy];
    for (NSString *str in stringArray) {
        [mutableString appendFormat:@"%@、", str];
    }

    NSString *formattedString = [mutableString substringToIndex:(mutableString.length - 1)].copy;

    NSString * const message = [NSString stringWithFormat:@"入力項目にご入力いただいた\n以下の文字は使用できません。\n\n「%@」", formattedString];

    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:message
                                                                             message:@""
                                                                      preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK"
                                                       style:UIAlertActionStyleDefault
                                                     handler:nil];
    [alertController addAction:okAction];
    return alertController;
}

#pragma mark - Private methods

- (NSArray <__kindof UITextField *> *)subTextFieldsWithView:(__kindof UIView *)view {

    NSMutableArray<__kindof UITextField *> *textFields = [@[] mutableCopy];
    NSArray<__kindof UIView *> *subviews = view.subviews;

    for (__kindof UIView *subview in subviews) {

        if ([subview isKindOfClass:UITextField.class]) {
            [textFields addObject:subview];
        }
        [textFields addObjectsFromArray:[self subTextFieldsWithView:subview]];
    }

    return textFields.copy;
}

- (NSArray <__kindof UITextView *> *)subTextViewsWithView:(__kindof UIView *)view {

    NSMutableArray<__kindof UITextView *> *textViews = [@[] mutableCopy];
    NSArray<__kindof UIView *> *subviews = view.subviews;

    for (__kindof UIView *subview in subviews) {

        if ([subview isKindOfClass:UITextView.class]) {
            [textViews addObject:subview];
        }
        [textViews addObjectsFromArray:[self subTextViewsWithView:subview]];
    }

    return textViews.copy;
}

@end
