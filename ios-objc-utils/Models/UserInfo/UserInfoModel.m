//
//  UserInfoModel.m
//  ios-objc-utils
//
//  Created by YukiOkudera on 2018/09/17.
//  Copyright © 2018年 OkuderaYuki. All rights reserved.
//

#import "UserInfoModel.h"
#import "Validator.h"

@interface UserInfoModel () <Validatable>
@end

@implementation UserInfoModel

- (void)setEmptyStringIfNeed {
    
    // 各項目nilの場合は、空文字を代入する
    self.userID = self.userID == nil ? @"" : self.userID;
    self.userDisplayName = self.userDisplayName == nil ? @"" : self.userDisplayName;
    self.password = self.password == nil ? @"" : self.password;
    self.englishComments = self.englishComments == nil ? @"" : self.englishComments;
    self.japaneseComments = self.japaneseComments == nil ? @"" : self.japaneseComments;
}

- (BOOL)validate {
    
    [self setEmptyStringIfNeed];
    
    // 各項目のバリデーションを実行する
    BOOL userIDValidate = [Validator onlyNumbersString:self.userID
                                             minLength:@(8)
                                             maxLength:@(8)
                                         characterSize:CharacterSizeHalf];
    DLOG(@"userIDValidate: %@", userIDValidate ? @"YES" : @"NO")
    
    BOOL userDisplayNameValidate = [Validator onlyAlphabetsString:self.userDisplayName
                                                        minLength:@(5)
                                                        maxLength:@(10)
                                                    characterSize:CharacterSizeHalf];
    DLOG(@"userDisplayNameValidate: %@", userDisplayNameValidate ? @"YES" : @"NO")
    
    BOOL passwordValidate = [Validator alphanumericsString:self.password
                                                 minLength:@(1)
                                                 maxLength:@(8)
                                             characterSize:CharacterSizeHalf];
    DLOG(@"passwordValidate: %@", passwordValidate ? @"YES" : @"NO")
    
    BOOL englishCommentsValidate = [Validator onlyHalfSizeString:self.englishComments
                                                       minLength:nil
                                                       maxLength:@(50)];
    DLOG(@"englishCommentsValidate: %@", englishCommentsValidate ? @"YES" : @"NO")
    
    BOOL japaneseCommentsValidate = [Validator notContainHalfSizeString:self.japaneseComments
                                                              minLength:nil
                                                              maxLength:@(50)];
    DLOG(@"japaneseCommentsValidate: %@", japaneseCommentsValidate ? @"YES" : @"NO")
    
    return userIDValidate
    && userDisplayNameValidate
    && passwordValidate
    && englishCommentsValidate
    && japaneseCommentsValidate;
}
@end
