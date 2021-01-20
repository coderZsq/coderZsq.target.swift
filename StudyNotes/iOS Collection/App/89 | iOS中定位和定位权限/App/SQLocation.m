//
//  SQLocation.m
//  App
//
//  Created by 朱双泉 on 2021/1/20.
//

#import "SQLocation.h"
#import <CoreLocation/CoreLocation.h>

@interface SQLocation () <CLLocationManagerDelegate>
@property (nonatomic, strong, readwrite) CLLocationManager *manager;
@end

@implementation SQLocation

+ (SQLocation *)locationManager {
    static SQLocation *location;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        location = [[SQLocation alloc] init];
    });
    return location;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.manager = [[CLLocationManager alloc] init];
        self.manager.delegate = self;
    }
    return self;
}

- (void)checkLocationAuthorization {
    // 判断系统是否开启
    if (![CLLocationManager locationServicesEnabled]) {
        // 引导弹窗
        //
    }
}

- (void)locationManagerDidChangeAuthorization:(CLLocationManager *)manager {
    if (manager.authorizationStatus == kCLAuthorizationStatusNotDetermined) {
        [self.manager requestWhenInUseAuthorization];
    } else if (manager.authorizationStatus == kCLAuthorizationStatusAuthorizedWhenInUse) {
        //
    } else if (manager.authorizationStatus == kCLAuthorizationStatusDenied) {
        //
    }
}

@end
