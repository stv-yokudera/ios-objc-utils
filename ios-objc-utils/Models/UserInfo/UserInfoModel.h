//
//  UserInfoModel.h
//  ios-objc-utils
//
//  Created by YukiOkudera on 2018/09/17.
//  Copyright © 2018年 OkuderaYuki. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserInfoModel : NSObject

@property (nonatomic) NSString *userID;
@property (nonatomic) NSString *userDisplayName;
@property (nonatomic) NSString *password;
@property (nonatomic) NSString *englishComments;
@property (nonatomic) NSString *japaneseComments;

- (BOOL)validate;
@end
