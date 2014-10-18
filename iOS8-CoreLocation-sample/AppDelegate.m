//
//  AppDelegate.m
//  ShootLater
//
//  Created by Kenta Nakai on 2014/10/17.
//  Copyright (c) 2014年 UROURO. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    return YES;
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    UILocalNotification *notification = [UILocalNotification new];
    notification.fireDate = [NSDate date];
    notification.timeZone = [NSTimeZone defaultTimeZone];
    notification.alertBody = @"アプリが終了します(˘ω˘ )";
    // notification.alertAction = @"OK";
    // notification.soundName = UILocalNotificationDefaultSoundName;
    [[UIApplication sharedApplication] scheduleLocalNotification:notification];
}

@end
