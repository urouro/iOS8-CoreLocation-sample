//
//  ViewController.m
//  ShootLater
//
//  Created by Kenta Nakai on 2014/10/17.
//  Copyright (c) 2014年 UROURO. All rights reserved.
//

#import "ViewController.h"
#import <CoreLocation/CoreLocation.h>

@interface ViewController ()
<CLLocationManagerDelegate>

@property(nonatomic,strong) CLLocationManager *locationManager;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if (![CLLocationManager isMonitoringAvailableForClass:[CLCircularRegion class]]) {
        LOG(@"Geographical Region Monitoring ダメです");
    }
    
    if ([CLLocationManager authorizationStatus] != kCLAuthorizationStatusAuthorizedAlways) {
        LOG(@"位置情報常に取得ダメです");
    }
    
    if ([UIApplication sharedApplication].backgroundRefreshStatus != UIBackgroundRefreshStatusAvailable) {
        LOG(@"Appのバックグラウンド更新ダメです");
    }
    
    self.locationManager = [CLLocationManager new];
    self.locationManager.delegate = self;
    [self.locationManager requestAlwaysAuthorization];
    
    CLCircularRegion *region = [[CLCircularRegion alloc] initWithCenter:CLLocationCoordinate2DMake(1.0, 1.0)
                                                                 radius:1.0
                                                             identifier:@"net.urouro.ios8corelocationsample.testregion"];
    [self.locationManager startMonitoringForRegion:region];
}


#pragma mark - CLLocationManagerDelegate

- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status
{
    LOG(@"status=%d", status);
    
    if (status != kCLAuthorizationStatusAuthorizedAlways) {
        LOG(@"位置情報常に取得ダメです");
    }
}

- (void)locationManager:(CLLocationManager *)manager didStartMonitoringForRegion:(CLRegion *)region
{
    LOG(@"region=%@", region);
}

- (void)locationManager:(CLLocationManager *)manager didEnterRegion:(CLRegion *)region
{
    LOG(@"region=%@", region);
}

- (void)locationManager:(CLLocationManager *)manager didExitRegion:(CLRegion *)region
{
    LOG(@"region=%@", region);
}

@end
