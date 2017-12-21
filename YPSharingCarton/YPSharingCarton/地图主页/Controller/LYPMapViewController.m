//
//  LYPMapViewController.m
//  YPSharingCarton
//
//  Created by laiyp on 2017/12/19.
//  Copyright © 2017年 laiyongpeng. All rights reserved.
//

#import "LYPMapViewController.h"
#import <MAMapKit/MAMapKit.h>
#import <AMapFoundationKit/AMapFoundationKit.h>
#import <AMapLocationKit/AMapLocationKit.h>

@interface LYPMapViewController ()<AMapLocationManagerDelegate>
@property (nonatomic, strong) MAMapView *mapView;
@property (nonatomic, strong) AMapLocationManager *locationManager;
@end

@implementation LYPMapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUPMap];//设置地图
    [self setUPLocation];
    
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];

}
-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
 
}
-(void)setUPMap{
    [AMapServices sharedServices].enableHTTPS = YES;
    self.mapView = [[MAMapView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:self.mapView];
    
    self.mapView.showsUserLocation = YES;
    self.mapView.userTrackingMode = MAUserTrackingModeFollowWithHeading;
    self.mapView.showsIndoorMap = YES;    //YES：显示室内地图；NO：不显示；
    
    MAUserLocationRepresentation *r = [[MAUserLocationRepresentation alloc] init];
    r.showsAccuracyRing = NO;///精度圈是否显示，默认YES
    r.image = [UIImage imageNamed:@"userPosition"]; ///定位图标, 与蓝色原点互斥
    r.showsHeadingIndicator = NO;///是否显示方向指示(MAUserTrackingModeFollowWithHeading模式开启)。默认为YES
    [self.mapView updateUserLocationRepresentation:r];
}

-(void)setUPLocation{
    
    self.locationManager = [[AMapLocationManager alloc]init];
    self.locationManager.delegate = self;
    self.locationManager.distanceFilter = 20;
    self.locationManager.locatingWithReGeocode = YES;
    
    [self.locationManager startUpdatingLocation];
}
#pragma mark AMapLocationManagerDelegate
-(void)amapLocationManager:(AMapLocationManager *)manager didUpdateLocation:(CLLocation *)location reGeocode:(AMapLocationReGeocode *)reGeocode{
    
    NSLog(@"%@",reGeocode);
    
}

@end
