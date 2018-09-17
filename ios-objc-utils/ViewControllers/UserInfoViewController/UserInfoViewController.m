//
//  UserInfoViewController.m
//  ios-objc-utils
//
//  Created by YukiOkudera on 2018/09/17.
//  Copyright © 2018年 OkuderaYuki. All rights reserved.
//

#import "UserInfoViewController.h"
#import "UserInfoModel.h"

typedef NS_ENUM(NSInteger, UserInfoTextFieldTag) {
    UserIDField = 100,
    UserDisplayNameField,
    PasswordField,
    EnglishCommentsField,
    JapaneseCommentsField
};

@interface UserInfoViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UITextField *userIDField;
@property (weak, nonatomic) IBOutlet UITextField *userDisplayNameField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (weak, nonatomic) IBOutlet UITextField *englishCommentsField;
@property (weak, nonatomic) IBOutlet UITextField *japaneseCommentsField;

@property (nonatomic) UserInfoModel *userInfoModel;
@end

@implementation UserInfoViewController

#pragma mark - Life cycle

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setup];
}

- (void)dealloc {
    [NSNotificationCenter.defaultCenter removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    [NSNotificationCenter.defaultCenter removeObserver:self name:UIKeyboardWillHideNotification object:nil];
}

#pragma mark - IBActions

- (IBAction)didTapDone:(UIButton *)sender {

    BOOL validationResult = [self.userInfoModel validate];

    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"検証結果"
                                                                             message:validationResult ? @"検証OK" : @"検証NG"
                                                                      preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
    [alertController addAction:ok];
    [self presentViewController:alertController animated:YES completion:nil];
}

#pragma mark - Selectors

- (void)keyboardWillShow:(NSNotification *)notification {

    NSDictionary *userInfo = notification.userInfo;
    NSValue *keyboardInfo = userInfo[UIKeyboardFrameEndUserInfoKey];
    double duration = [userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    CGSize keyboardSize = keyboardInfo.CGRectValue.size;
    UIEdgeInsets contentInsets = UIEdgeInsetsMake(0, 0, keyboardSize.height, 0);
    [UIView animateWithDuration:duration animations:^{
        self.scrollView.contentInset = contentInsets;
        self.scrollView.scrollIndicatorInsets = contentInsets;
        [self.view layoutIfNeeded];
    }];
}

- (void)keyboardWillHide:(NSNotification *)notification {
    self.scrollView.contentInset = UIEdgeInsetsZero;
    self.scrollView.scrollIndicatorInsets = UIEdgeInsetsZero;
}

#pragma mark - Private methods

- (void)setup {

    self.navigationItem.title = @"UserInfo";
    self.userInfoModel = [[UserInfoModel alloc] init];

    self.userIDField.tag = UserIDField;
    self.userDisplayNameField.tag = UserDisplayNameField;
    self.passwordField.tag = PasswordField;
    self.englishCommentsField.tag = EnglishCommentsField;
    self.japaneseCommentsField.tag = JapaneseCommentsField;

    [NSNotificationCenter.defaultCenter addObserver:self
                                           selector:@selector(keyboardWillShow:)
                                               name:UIKeyboardWillShowNotification
                                             object:nil];

    [NSNotificationCenter.defaultCenter addObserver:self
                                           selector:@selector(keyboardWillHide:)
                                               name:UIKeyboardWillHideNotification
                                             object:nil];
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {

    if (textField.tag == JapaneseCommentsField) {
        [textField resignFirstResponder];
    } else {
        [[self.view viewWithTag:textField.tag + 1] becomeFirstResponder];
    }

    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    DLOG()

    switch (textField.tag) {
        case UserIDField:
            self.userInfoModel.userID = textField.text;
            break;
        case UserDisplayNameField:
            self.userInfoModel.userDisplayName = textField.text;
            break;
        case PasswordField:
            self.userInfoModel.password = textField.text;
            break;
        case EnglishCommentsField:
            self.userInfoModel.englishComments = textField.text;
            break;
        case JapaneseCommentsField:
            self.userInfoModel.japaneseComments = textField.text;
            break;
        default:
            break;
    }
}

@end
