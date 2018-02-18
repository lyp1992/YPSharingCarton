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
#import "MapManager.h"
@interface LYPMapViewController ()<AMapLocationManagerDelegate,MAMapViewDelegate>
@property (nonatomic, strong) MAMapView *mapView;
@property (nonatomic, strong) AMapLocationManager *locationManager;
@end

@implementation LYPMapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self setUPMap];//设置地图
//    [self setUPLocation];
    [self loadMapSelf];
}

-(void)loadMapSelf{
    
    MapManager *manager =[MapManager sharedManager];
    manager.controller = self;
    [manager initMapView];
}
//-(void)viewDidAppear:(BOOL)animated{
//    [super viewDidAppear:animated];
//
//}
//-(void)viewDidLayoutSubviews{
//    [super viewDidLayoutSubviews];
//
//}
//-(void)setUPMap{
//    [AMapServices sharedServices].enableHTTPS = YES;
//    self.mapView = [[MAMapView alloc]initWithFrame:self.view.bounds];
//    [self.view addSubview:self.mapView];
//
//    self.mapView.showsUserLocation = YES;
//    self.mapView.userTrackingMode = MAUserTrackingModeFollowWithHeading;
//    self.mapView.showsIndoorMap = YES;    //YES：显示室内地图；NO：不显示；
//    [self.mapView setZoomLevel:17 animated:YES];//设置缩放水平
//    self.mapView.delegate = self;
//
//    MAUserLocationRepresentation *r = [[MAUserLocationRepresentation alloc] init];
//    r.showsAccuracyRing = NO;///精度圈是否显示，默认YES
//    r.image = [UIImage imageNamed:@"userPosition"]; ///定位图标, 与蓝色原点互斥
//    r.showsHeadingIndicator = NO;///是否显示方向指示(MAUserTrackingModeFollowWithHeading模式开启)。默认为YES
//    [self.mapView updateUserLocationRepresentation:r];
//
//    MAPointAnnotation *pointAnnotation = [[MAPointAnnotation alloc] init];
//    pointAnnotation.coordinate = CLLocationCoordinate2DMake(39.869645, 116.460052);
//    pointAnnotation.title = @"京瑞大厦";
//    pointAnnotation.subtitle = @"阜通东大街6号";
//
////    39.8684600000,116.4597400000 联合国际大厦 北京市朝阳区十八里店地区十里河村北方向
//    MAPointAnnotation *pointAnnotation1 = [[MAPointAnnotation alloc] init];
//    pointAnnotation1.coordinate = CLLocationCoordinate2DMake(39.8684600000, 116.4597400000);
//    pointAnnotation1.title = @"联合国际大厦";
//    pointAnnotation1.subtitle = @"阜通东大街6号";
////    39.8703900000,116.4599600000 五环大酒店  北京市朝阳区潘家园街道华威里社区东南方向
//    MAPointAnnotation *pointAnnotation2 = [[MAPointAnnotation alloc] init];
//    pointAnnotation2.coordinate = CLLocationCoordinate2DMake(39.8703900000, 116.4599600000);
//    pointAnnotation2.title = @"五环大酒店";
//    pointAnnotation2.subtitle = @"阜通东大街6号";
//
//    [self.mapView addAnnotation:pointAnnotation];
//    [self.mapView addAnnotation:pointAnnotation1];
//    [self.mapView addAnnotation:pointAnnotation2];
//
//
//}
//
//-(void)setUPLocation{
//
//    self.locationManager = [[AMapLocationManager alloc]init];
//    self.locationManager.delegate = self;
//    self.locationManager.distanceFilter = 20;
//    self.locationManager.locatingWithReGeocode = YES;
//
//    [self.locationManager startUpdatingLocation];
//}
//#pragma mark AMapLocationManagerDelegate
//-(void)amapLocationManager:(AMapLocationManager *)manager didUpdateLocation:(CLLocation *)location reGeocode:(AMapLocationReGeocode *)reGeocode{
//
//    NSLog(@"%@",reGeocode);
//
//}
//
//#pragma mark MAMapViewDelegate
//-(MAAnnotationView *)mapView:(MAMapView *)mapView viewForAnnotation:(id<MAAnnotation>)annotation{
//
//    if ([annotation isKindOfClass:[MAPointAnnotation class]])
//    {
//        static NSString *reuseIndetifier = @"annotationReuseIndetifier";
//        MAAnnotationView *annotationView = (MAAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:reuseIndetifier];
//        if (annotationView == nil)
//        {
//            annotationView = [[MAAnnotationView alloc] initWithAnnotation:annotation
//                                                          reuseIdentifier:reuseIndetifier];
//        }
//        annotationView.image = [UIImage imageNamed:@"fixed_point_normal"];
//        //设置中心点偏移，使得标注底部中间点成为经纬度对应点
//        annotationView.centerOffset = CGPointMake(0, -18);
//        return annotationView;
//    }
//    return nil;
//}

@end
