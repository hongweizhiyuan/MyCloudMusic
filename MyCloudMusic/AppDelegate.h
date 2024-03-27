//
//  AppDelegate.h
//  MyCloudMusic
//
//  Created by mac on 2024/2/29.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow * window;


/// 获取单例对象
+(instancetype)shared;

/// 启动登录主界面
-(void)toLoginHome;

@end

