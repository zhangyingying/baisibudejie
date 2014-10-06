//
//  ZYYAppDelegate.m
//  百思不得姐-张莹莹
//
//  Created by lanou3g on 14-9-30.
//  Copyright (c) 2014年 ___FULLUSERNAME___. All rights reserved.
//

#import "ZYYAppDelegate.h"

@implementation ZYYAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    
    [self.window makeKeyAndVisible];
    
    //添加启动动画
    self.splashView = [[UIImageView alloc] initWithFrame:CGRectMake(0,0, 320, self.window.frame.size.height)];
    self.splashView.image = [UIImage imageNamed:@"Default.png"];
    [self.window addSubview:self.splashView];
    [self.window bringSubviewToFront:self.splashView];
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:4];
    [UIView setAnimationTransition:UIViewAnimationTransitionNone forView: self.window cache:YES];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(startupAnimationDone:finished:context:)];
    self.splashView.alpha = 0.0;
    self.splashView.frame = CGRectMake(-60, -85, self.window.frame.size.width+100, self.window.frame.size.height+200);
    [UIView commitAnimations];
    return YES;
}

- (void)startupAnimationDone:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context {
	[self.splashView removeFromSuperview];
}
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
