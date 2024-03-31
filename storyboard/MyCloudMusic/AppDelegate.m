//
//  AppDelegate.m
//  MyCloudMusic
//
//  Created by mac on 2024/2/29.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

#pragma mark - 下载相关
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    return YES;
}


+(instancetype)shared{
    return UIApplication.sharedApplication.delegate;
}

/// 启动登陆主界面
- (void)toLoginHome{
    [self setRootViewController:@"LoginHomeNav"];
}

/// 设置跟控制器
/// @param data <#data description#>
- (void)setRootViewController:(NSString *)data{
    //获取到Main.storyboard
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];

    //实例化场景
    //因为场景关联了控制器
    //所以说也可以说实例化了一个控制
    //只是这个过程是系统创建的
    //不是我们手动完成
    UIViewController *target = [storyboard instantiateViewControllerWithIdentifier:data];

    //替换掉原来的根控制器
    //目的是，我们不希望用户还能返回到原来的界面
    self.window.rootViewController=target;
}

@end
