//
//  NSObject+NullToNil.h
//  ios-objc-utils
//
//  Created by YukiOkudera on 2018/09/16.
//  Copyright © 2018年 OkuderaYuki. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (NullToNil)

- (__kindof NSObject *)nullToNil;
@end
