//
//  ViewController.m
//  ios-objc-utils
//
//  Created by OkuderaYuki on 2018/05/04.
//  Copyright © 2018年 OkuderaYuki. All rights reserved.
//

#import "ViewController.h"
#import "NextViewController.h"

@interface ViewController ()

@end

@implementation ViewController

#pragma mark - Life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];

    [self showAlertCallbackBlock];
//    [self showAlertCallbackSelector];
}

#pragma mark - IBActions

#pragma mark UIViewController+Storyboard.h Usage

- (IBAction)didTapToNextViewController:(UIButton *)sender {

    DLOG();

    // Storyboard名を指定して、NextViewControllerのインスタンスを生成
    NSString * const storyboardName = @"NextViewController";
    NextViewController *nextViewController = [NextViewController initialViewControllerWithStoryboardName:storyboardName];

    [self presentViewController:nextViewController animated:YES completion:nil];
}

#pragma mark - UIViewController+Alert Usage

- (void)showAlertCallbackBlock {

    NSString * const title = @"エラー";
    NSString * const message = @"ユーザIDが入力されていません。";
    [self singleButtonAlertWithTitle:title message:message handler:^(UIAlertAction *action) {
        DLOG(@"Block Callback");
    }];
}

- (void)showAlertCallbackSelector {

    NSString * const title = @"エラー";
    NSString * const message = @"パスワードが入力されていません。";
    [self singleButtonAlertWithTitle:title message:message selector:@selector(didTapOK)];
}

#pragma mark Selector method

- (void)didTapOK {
    DLOG(@"Selector Callback");
}
@end
