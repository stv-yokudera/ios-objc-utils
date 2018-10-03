//
//  UIViewController+Validate4BytesCharacters.h
//  ios-objc-sampler
//
//  Created by YukiOkudera on 2018/10/04.
//  Copyright © 2018 YukiOkudera. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (Validate4BytesCharacters)

/**
 UITextField, UITextViewの入力文字列に4バイト文字が含まれているかチェックする

 @return チェックOK: nil, チェックNG: UIAlertController *
 */
- (nullable UIAlertController *)validate4BytesCharacters;
@end
