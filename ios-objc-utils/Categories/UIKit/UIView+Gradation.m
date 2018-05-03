//
//  UIView+Gradation.m
//  ios-objc-utils
//
//  Created by OkuderaYuki on 2018/05/04.
//  Copyright © 2018年 OkuderaYuki. All rights reserved.
//

#import "UIView+Gradation.h"

@implementation UIView (Gradation)

- (void)gradationWithTopColor:(UIColor *)topColor bottomColor:(UIColor *)bottomColor {

    // グラデーションカラーの配列
    NSArray *gradationColors = @[(id)topColor.CGColor, (id)bottomColor.CGColor];

    CAGradientLayer *gradientLayer = [[CAGradientLayer alloc] init];

    // グラデーションカラーの配列をレイヤーに割り当てる
    gradientLayer.colors = gradationColors;

    // グラデーションレイヤーをスクリーンサイズにする
    gradientLayer.frame = self.bounds;

    // グラデーションレイヤーをViewの一番下に配置
    [self.layer insertSublayer:gradientLayer atIndex:0];
}
@end
