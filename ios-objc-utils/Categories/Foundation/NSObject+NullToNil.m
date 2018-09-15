//
//  NSObject+NullToNil.m
//  ios-objc-utils
//
//  Created by YukiOkudera on 2018/09/16.
//  Copyright © 2018年 OkuderaYuki. All rights reserved.
//

#import "NSObject+NullToNil.h"

@implementation NSObject (NullToNil)

- (__kindof NSObject *)nullToNil {
    return [self isEqual:[NSNull null]] ? nil : self;
}
@end
