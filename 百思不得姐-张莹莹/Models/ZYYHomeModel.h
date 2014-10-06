//
//  ZYYHomeModel.h
//  百思不得姐-张莹莹
//
//  Created by lanou3g on 14-9-30.
//  Copyright (c) 2014年 lanou3g. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZYYHomeModel : NSObject

@property (nonatomic,strong)NSString *profile_image;//头像照片
@property (nonatomic,strong)NSString *screen_name;//名字
@property (nonatomic,strong)NSString *created_at;//时间
@property (nonatomic,strong)NSString *text;//正文内容
@property (nonatomic,assign)CGFloat width;//照片的宽度
@property (nonatomic,assign)CGFloat height;//照片的高度
@property (nonatomic,strong)NSString *love;//赞
@property (nonatomic,strong)NSString *hate;//不赞
@property (nonatomic,strong)NSString *forward;//分享
@property (nonatomic,strong)NSString *comment;//评论
@property (nonatomic,strong)NSString *image0;//正文照片
@property (nonatomic,assign)NSInteger playcount;//播放次数
@property (nonatomic,strong)NSString *voicetime;//播放时间
@property (nonatomic,strong)NSString *voiceuri;//音频
@property (nonatomic,strong)NSString *voicelength;//音频长度

- (id)initWithDictionary:(NSDictionary *)dic;
@end
