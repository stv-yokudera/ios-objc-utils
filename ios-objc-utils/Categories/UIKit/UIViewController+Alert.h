//
//  UIViewController+Alert.h
//  ios-objc-utils
//
//  Created by OkuderaYuki on 2018/05/04.
//  Copyright © 2018年 OkuderaYuki. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (Alert)

/**
 OKボタンのみのアラートを表示する(Blocks)

 @param title アラートのタイトル
 @param message アラートのメッセージ
 @param handler OKボタンタップ時に実行する処理
 */
- (void)singleButtonAlertWithTitle:(NSString *)title
                           message:(NSString *)message
                           handler:(void (^)(UIAlertAction *action))handler;

/**
 OKボタンのみのアラートを表示する(Selector)

 @param title アラートのタイトル
 @param message アラートのメッセージ
 @param callbackSelector OKボタンタップ時に実行する処理
 */
- (void)singleButtonAlertWithTitle:(NSString *)title
                           message:(NSString *)message
                          selector:(SEL)callbackSelector;

@end
