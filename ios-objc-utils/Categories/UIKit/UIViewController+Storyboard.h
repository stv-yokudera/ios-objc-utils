//
//  UIViewController+Storyboard.h
//  ios-objc-utils
//
//  Created by OkuderaYuki on 2018/05/04.
//  Copyright © 2018年 OkuderaYuki. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (Storyboard)

/**
 Storyboard名を指定して、InitialViewControllerのインスタンスを取得する

 @param storyboardName Storyboard名
 @return InitialViewControllerのインスタンス
 */
+ (__kindof UIViewController *)initialViewControllerWithStoryboardName:(NSString *)storyboardName;
@end
