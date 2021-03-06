//
//  AppDelegate.m
//  13-性能优化
//
//  Created by 朱双泉 on 2020/9/30.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

+ (void)load {
    NSLog(@"%s", __func__);
}


+ (void)initialize {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSLog(@"%s", __func__);
    });
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    NSLog(@"%s", __func__);
    
#if DEBUG
    [[NSBundle bundleWithPath:@"/Applications/InjectionIII.app/Contents/Resources/iOSInjection.bundle"] load];
#endif    
    /**
     启动阶段2
     
     main() 函数执行后的阶段，指的是从 main() 函数执行开始，到 appDelegate 的 didFinishLaunchingWithOptions 方法里首屏渲染相关方法执行完成。
     
     首页的业务代码都是要在这个阶段，也就是首屏渲染前执行的，主要包括了：
     
     1. 首屏初始化所需配置文件的读写操作；
     2. 首屏列表大数据的读取；
     3. 首屏渲染的大量计算等。
     
     很多时候，开发者会把各种初始化工作都放到这个阶段执行，导致渲染完成滞后。
     更加优化的开发方式，应该是从功能上梳理出哪些是首屏渲染必要的初始化功能，哪些是 App 启动必要的初始化功能，而哪些是只需要在对应功能开始使用时才需要初始化的。
     梳理完之后，将这些初始化功能分别放到合适的阶段进行。
     
     功能级别的启动优化
     优化的思路是： main() 函数开始执行后到首屏渲染完成前只处理首屏相关的业务，
     其他非首屏业务的初始化、监听注册、配置文件读取等都放到首屏渲染完成后去做。
     */
    
    return YES;
}


#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
    NSLog(@"%s", __func__);
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
    NSLog(@"%s", __func__);
}


@end
