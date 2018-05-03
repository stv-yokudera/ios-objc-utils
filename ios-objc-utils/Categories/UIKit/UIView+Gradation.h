//
//  UIView+Gradation.h
//  ios-objc-utils
//
//  Created by OkuderaYuki on 2018/05/04.
//  Copyright © 2018年 OkuderaYuki. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Gradation)

/**
 グラデーションする

 @param topColor グラデーション開始位置の色
 @param bottomColor グラデーション終了位置の色
 */
- (void)gradationWithTopColor:(UIColor *)topColor bottomColor:(UIColor *)bottomColor;
@end
