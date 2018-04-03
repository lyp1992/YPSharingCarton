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
#import <CoreLocation/CoreLocation.h>
#import "MapManager.h"

#import "LYPListNeteworkTool.h"
#import "LYPSavePList.h"
#import "LYPDeviceListModel.h"
#import "LYPDataListModel.h"

@interface LYPMapViewController ()<CLLocationManagerDelegate>

@property (nonatomic, strong) NSMutableArray *deviceListArr;
@property (nonatomic, strong) MapManager *manager;
@property (nonatomic, strong) CLLocationManager *locationManager;
@property (nonatomic, strong) CLLocation *location;

@end

@implementation LYPMapViewController

-(NSMutableArray *)deviceListArr{
    if (!_deviceListArr) {
        _deviceListArr = [NSMutableArray array];
    }
    return _deviceListArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadMapSelf];
    
//    添加标记点
     [self startLocation];
    

}

-(void)loadMapSelf{
    
    MapManager *manager =[MapManager sharedManager];
    manager.controller = self;
    [manager initMapView];
    self.manager = manager;
}
-(BOOL)isLocationServiceOpen {
    if ([ CLLocationManager authorizationStatus] == kCLAuthorizationStatusDenied) {
        return NO;
    } else
        return YES;
}
//开始定位
- (void)startLocation {
    if ([self isLocationServiceOpen]) {
        if ([CLLocationManager locationServicesEnabled]) {
            //        CLog(@"--------开始定位");
            self.locationManager = [[CLLocationManager alloc]init];
            self.locationManager.delegate = self;
            //控制定位精度,越高耗电量越
            self.locationManager.desiredAccuracy = kCLLocationAccuracyKilometer;
            // 总是授权
            [self.locationManager requestAlwaysAuthorization];
            self.locationManager.distanceFilter = 10.0f;
            [self.locationManager requestAlwaysAuthorization];
            [self.locationManager startUpdatingLocation];
        }
    }else{
        
        UIAlertController *alertVc = [UIAlertController alertSureWithMessage:@"请允许\"共享纸盒\"获取您的位置" AndTitle:@"" sureblock:^{
            NSURL *url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
            if([[UIApplication sharedApplication] canOpenURL:url]) {
                NSURL*url =[NSURL URLWithString:UIApplicationOpenSettingsURLString];
                //此处可以做一下版本适配，至于为何要做版本适配，大家应该很清楚
                [[UIApplication sharedApplication] openURL:url];
            }
        }];
        
        [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alertVc animated:YES completion:nil];
    }
    
}

-(void)getDeviceList:(CLLocation*)location{

//    NSString *token = [LYPSavePList readTokenPlist];
    LYPListNeteworkTool *tool = [[LYPListNeteworkTool alloc]init];
//    if ([StringEXtension isBlankString:token]) {
//        return;
//    }
//    参数，token，自己的位置
    NSDictionary *parame = [NSDictionary dictionaryWithObjectsAndKeys:@(location.coordinate.longitude),@"lon",@(location.coordinate.latitude),@"lat", nil];
    [tool getEquipmentListWithDic:parame success:^(id responseData, NSInteger responseCode) {
        NSLog(@"=%@",responseData);
        LYPDeviceListModel *listModel = [LYPDeviceListModel mj_objectWithKeyValues:responseData];
//        创建位置
        [[MapManager sharedManager]addAnomationWithArray:listModel.data];

    } failure:^(id responseData, NSInteger responseCode) {
        NSLog(@"err==%@",responseData);
    }];
    
}
- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    if ([error code] == kCLErrorDenied) {
        NSLog(@"访问被拒绝");
    }
    if ([error code] == kCLErrorLocationUnknown) {
        NSLog(@"无法获取位置信息");
    }
}
//定位代理经纬度回调
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
    
    CLLocation *newLocation = locations[0];
    [self getDeviceList:newLocation];
    
//    // 获取当前所在的城市名
//    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
//    //根据经纬度反向地理编译出地址信息
//    [geocoder reverseGeocodeLocation:newLocation completionHandler:^(NSArray *array, NSError *error){
//        if (array.count > 0){
//            CLPlacemark *placemark = [array objectAtIndex:0];
//
//            //获取城市
//            NSString *city = placemark.locality;
//            if (!city) {
//                //四大直辖市的城市信息无法通过locality获得，只能通过获取省份的方法来获得（如果city为空，则可知为直辖市）
//                city = placemark.administrativeArea;
//            }
//            NSLog(@"city = %@", city);
//
//        }
//        else if (error == nil && [array count] == 0)
//        {
//            NSLog(@"No results were returned.");
//        }
//        else if (error != nil)
//        {
//            NSLog(@"An error occurred = %@", error);
//        }
//    }];
    //系统会一直更新数据，直到选择停止更新，因为我们只需要获得一次经纬度即可，所以获取之后就停止更新
    [manager stopUpdatingLocation];
    
}


@end
