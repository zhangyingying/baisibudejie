//
//  SingLetonMethod.h
//  xiangmu-实战
//
//  Created by 张莹莹 on 14-9-4.
//  Copyright (c) 2014年 www.lanou3g.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SingLetonMethod : NSObject


@property (nonatomic,strong) UIImageView *singleImage;
@property (nonatomic,retain) UINavigationController *navigation;
@property (nonatomic,assign) CGFloat height;

+ (SingLetonMethod *)shareSingleton;


@end
