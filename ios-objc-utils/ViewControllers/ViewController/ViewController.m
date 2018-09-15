//
//  ViewController.m
//  ios-objc-utils
//
//  Created by OkuderaYuki on 2018/05/04.
//  Copyright © 2018年 OkuderaYuki. All rights reserved.
//

#import "ViewController.h"
#import "APIClient.h"
#import "ItunesSearchAPI.h"
#import "NextViewController.h"

@interface ViewController () <ItunesSearchResult>

@property (nonatomic) ItunesSearchAPI *itunesSearchAPI;
@end

@implementation ViewController

#pragma mark - Life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    self.itunesSearchAPI = [[ItunesSearchAPI alloc] init];
    self.itunesSearchAPI.delegate = self;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

#pragma mark UIView+Gradation Usage

    UIColor * const whiteColor = UIColor.whiteColor;
    UIColor * const magentaColor = UIColor.magentaColor;
    [self.view gradationWithTopColor:whiteColor bottomColor:magentaColor];
}

#pragma mark - IBActions

- (IBAction)didTapShowAlertUsingBlock:(UIButton *)sender {
    [self showAlertCallbackBlock];
}

- (IBAction)didTapShowAlertUsingSelector:(UIButton *)sender {
    [self showAlertCallbackSelector];
}

- (IBAction)didTapGetRequest:(UIButton *)sender {

    [self.itunesSearchAPI loadWithTerm:@"テスト"];
}

- (IBAction)didTapPostImage:(UIButton *)sender {

    NSString * const urlString = @"https://httpbin.org/post";
    UIImage *testImage = [UIImage imageNamed:@"testImage"];
    NSDictionary *imageDataDic = @{ @"picture": UIImageJPEGRepresentation(testImage, 0) };

    [APIClient uploadImageWithUrlString:urlString
                             parameters:nil
                              imageData:imageDataDic
                                success:^(id responseObject) {
                                    DLOG(@"success!!!")
                                } failure:^(NSError *error) {
                                    DLOG(@"failure!!!")
                                    DLOG(@"error:%@", error)
                                }];
}

- (IBAction)didTapToNextViewController:(UIButton *)sender {

    DLOG();

#pragma mark UIViewController+Storyboard Usage

    // Storyboard名を指定して、NextViewControllerのインスタンスを生成
    NSString * const storyboardName = @"NextViewController";
    NextViewController *nextViewController = [NextViewController initialViewControllerWithStoryboardName:storyboardName];

    [self presentViewController:nextViewController animated:YES completion:nil];
}

#pragma mark UIViewController+Alert Usage

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

#pragma mark - ItunesSearchResult

- (void)itunesSearchResultSuccess:(ItunesSearchResponse *)response {
    DLOG(@"success!!!")
    DLOG(@"resultCount:%ld", (long)response.resultCount)
    DLOG(@"firstObject:%@", response.results.firstObject)
}

- (void)itunesSearchResultFailure:(NSString *)errorMessage {
    DLOG(@"failure!!!")
    DLOG(@"%@", errorMessage)
}

- (void)itunesSearchOffline:(NSString *)message {
    DLOG(@"offline!!!")
    DLOG(@"%@", message)
}
@end
