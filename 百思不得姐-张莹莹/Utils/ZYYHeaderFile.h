//
//  ZYYHeaderFile.h
//  百思不得姐-张莹莹
//
//  Created by lanou3g on 14-9-30.
//  Copyright (c) 2014年 lanou3g. All rights reserved.
//

#import "ZYYHeaderFile.h"
#import "ZYYViewController.h"
#import "ZYYPictureViewController.h"
#import "ZYYVoiceViewController.h"
#import "ZYYVideoViewController.h"
#import "ZYYMyViewController.h"
#import "REMenu.h"
#import "ZYYEditorViewController.h"
#import "ZYYSearchViewController.h"
#import "AFNetworking.h"
#import "UIImageView+AFNetworking.h"
#import "ZYYHomeModel.h"
#import "ZYYPictureCell.h"
#import "SingLetonMethod.h"
#import "UMSocial.h"
#import "ZYYVoiceCell.h"
#import "UIScrollView+MJRefresh.h"
#import "ZYYPictureLatestController.h"
#import "ZYYPictureThroughController.h"
#import "ZYYVoiceLatestController.h"
#import "ZYYVoiceThroughController.h"




//图片精华
#define kPictureEssenceAPI @"http://api.budejie.com/api/api_open.php?a=list&appname=baisibudejie&asid=21C3F594-AE4B-4500-A4DD-CA0BC640ED01&c=data&client=iphone&device=iPhone%204S&from=ios&jbk=0&mac=02%3A00%3A00%3A00%3A00%3A00&market=&openudid=fc6b78904ed9c2cdfee6b087765917d3f65505d2&page=0&per=20&type=10&udid=&ver=3.0"
//图片最新
#define kPictureLatestAPI @"http://api.budejie.com/api/api_open.php?a=newlist&appname=baisibudejie&asid=21C3F594-AE4B-4500-A4DD-CA0BC640ED01&c=data&client=iphone&device=iPhone%204S&from=ios&jbk=0&mac=02%3A00%3A00%3A00%3A00%3A00&market=&openudid=fc6b78904ed9c2cdfee6b087765917d3f65505d2&page=0&per=20&type=10&udid=&ver=3.0"
//图片穿越
#define kPictureThroughAPI @"http://api.budejie.com/api/api_open.php?a=list&appname=baisibudejie&asid=21C3F594-AE4B-4500-A4DD-CA0BC640ED01&c=data&client=iphone&device=iPhone%204S&from=ios&jbk=0&mac=02%3A00%3A00%3A00%3A00%3A00&market=&openudid=fc6b78904ed9c2cdfee6b087765917d3f65505d2&order=timewarp&page=0&per=20&type=10&udid=&ver=3.0"
//声音精华
#define kVoiceEssenceAPI @"http://api.budejie.com/api/api_open.php?a=list&appname=baisibudejie&asid=21C3F594-AE4B-4500-A4DD-CA0BC640ED01&c=voice&client=iphone&device=iPhone%204S&from=ios&jbk=0&mac=02%3A00%3A00%3A00%3A00%3A00&market=&openudid=fc6b78904ed9c2cdfee6b087765917d3f65505d2&page=0&per=20&type=31&udid=&ver=3.0"
//声音最新
#define kVoiceLatestAPI @"http://api.budejie.com/api/api_open.php?a=newlist&appname=baisibudejie&asid=21C3F594-AE4B-4500-A4DD-CA0BC640ED01&c=voice&client=iphone&device=iPhone%204S&from=ios&jbk=0&mac=02%3A00%3A00%3A00%3A00%3A00&market=&openudid=fc6b78904ed9c2cdfee6b087765917d3f65505d2&page=0&per=20&type=31&udid=&ver=3.0"
//http://api.budejie.com/api/api_open.php?a=newlist&appname=baisibudejie&asid=D61CBE97-3958-400E-8B23-4D971A0CF676&c=voice&client=iphone&device=iTouch%205&from=ios&jbk=0&mac=02%3A00%3A00%3A00%3A00%3A00&market=&maxtime=1412394973&openudid=2b5e2843bdf303c7713e36604fa34c8cdffea8c3&page=2&per=20&type=31&udid=&ver=3.0
//声音穿越
#define kVoiceThroughAPI @"http://api.budejie.com/api/api_open.php?a=list&appname=baisibudejie&asid=21C3F594-AE4B-4500-A4DD-CA0BC640ED01&c=voice&client=iphone&device=iPhone%204S&from=ios&jbk=0&mac=02%3A00%3A00%3A00%3A00%3A00&market=&openudid=fc6b78904ed9c2cdfee6b087765917d3f65505d2&order=timewarp&page=0&per=20&type=31&udid=&ver=3.0"
//http://api.budejie.com/api/api_open.php?a=list&appname=baisibudejie&asid=D61CBE97-3958-400E-8B23-4D971A0CF676&c=voice&client=iphone&device=iTouch%205&from=ios&jbk=0&mac=02%3A00%3A00%3A00%3A00%3A00&market=&openudid=2b5e2843bdf303c7713e36604fa34c8cdffea8c3&order=timewarp&page=0&per=20&type=31&udid=&ver=3.0
//视频精华
#define kVideoEssenceAPI @"http://api.budejie.com/api/api_open.php?a=list&appname=baisibudejie&asid=21C3F594-AE4B-4500-A4DD-CA0BC640ED01&c=video&client=iphone&device=iPhone%204S&from=ios&jbk=0&mac=02%3A00%3A00%3A00%3A00%3A00&market=&openudid=fc6b78904ed9c2cdfee6b087765917d3f65505d2&page=0&per=20&type=41&udid=&ver=3.0"
//视频最新
#define kVideoLatestAPI @"http://api.budejie.com/api/api_open.php?a=newlist&appname=baisibudejie&asid=21C3F594-AE4B-4500-A4DD-CA0BC640ED01&c=video&client=iphone&device=iPhone%204S&from=ios&jbk=0&mac=02%3A00%3A00%3A00%3A00%3A00&market=&openudid=fc6b78904ed9c2cdfee6b087765917d3f65505d2&page=0&per=20&type=41&udid=&ver=3.0"
//视频穿越
#define kVideoThroughAPI @"http://api.budejie.com/api/api_open.php?a=list&appname=baisibudejie&asid=21C3F594-AE4B-4500-A4DD-CA0BC640ED01&c=video&client=iphone&device=iPhone%204S&from=ios&jbk=0&mac=02%3A00%3A00%3A00%3A00%3A00&market=&openudid=fc6b78904ed9c2cdfee6b087765917d3f65505d2&order=timewarp&page=0&per=20&type=41&udid=&ver=3.0"

#define kPictureEssencePage @"http://api.budejie.com/api/api_open.php?a=list&appname=baisibudejie&asid=D61CBE97-3958-400E-8B23-4D971A0CF676&c=data&client=iphone&device=iTouch%205&from=ios&jbk=0&mac=02%3A00%3A00%3A00%3A00%3A00&market=&maxtime=1412316002&openudid=2b5e2843bdf303c7713e36604fa34c8cdffea8c3&page=2&per=20&type=10&udid=&ver=3.0"




#define RGBA(R/*红*/,G/*绿*/,B/*蓝*/,A/*透明*/) \
[UIColor colorWithRed:R/255.f green:G/255.f blue:B/255.f alpha:A]