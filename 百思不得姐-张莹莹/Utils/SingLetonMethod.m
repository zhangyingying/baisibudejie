//
//  SingLetonMethod.m
//  xiangmu-实战
//
//  Created by 张莹莹 on 14-9-4.
//  Copyright (c) 2014年 www.lanou3g.com. All rights reserved.
//

#import "SingLetonMethod.h"

@implementation SingLetonMethod

+ (SingLetonMethod *)shareSingleton{

    static SingLetonMethod *singleton = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        singleton = [[SingLetonMethod alloc] init];
    });
    return singleton;

}



@end
