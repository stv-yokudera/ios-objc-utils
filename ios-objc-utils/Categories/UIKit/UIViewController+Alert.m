//
//  UIViewController+Alert.m
//  ios-objc-utils
//
//  Created by OkuderaYuki on 2018/05/04.
//  Copyright © 2018年 OkuderaYuki. All rights reserved.
//

#import "UIViewController+Alert.h"

@implementation UIViewController (Alert)

- (void)singleButtonAlertWithTitle:(NSString *)title
                           message:(NSString *)message
                           handler:(void (^)(UIAlertAction *action))handler {

    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title
                                                                   message:message
                                                            preferredStyle:UIAlertControllerStyleAlert];

    // 引数でもらったhandlerをOKボタンタップ時のhandlerに使用する
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK"
                                                       style:UIAlertActionStyleDefault
                                                     handler:handler];

    [alert addAction:okAction];
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)singleButtonAlertWithTitle:(NSString *)title
                           message:(NSString *)message
                          selector:(SEL)callbackSelector {

    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title
                                                                   message:message
                                                            preferredStyle:UIAlertControllerStyleAlert];

    __weak typeof(self) weakSelf = self;
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK"
                                                       style:UIAlertActionStyleDefault
                                                     handler:^(UIAlertAction *action)
                               {
                                   if ([weakSelf respondsToSelector:callbackSelector]) {

                                       // [weakSelf performSelector:callbackSelector]; のように
                                       // performSelector: にSEL型変数を指定すると、ARC環境下ではWarningが出てしまう。
                                       // 対策として、performSelector: withObject: afterDelay:を使用する
                                       [weakSelf performSelector:callbackSelector withObject:nil afterDelay:0.0f];
                                   }
                               }];

    [alert addAction:okAction];
    [self presentViewController:alert animated:YES completion:nil];
}

@end
