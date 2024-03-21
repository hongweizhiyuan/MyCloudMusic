//
//  SplashController.m
//  MyCloudMusic
//
//  Created by mac on 2024/3/15.
//

#import "SplashController.h"
#import "SceneDelegate.h"

@interface SplashController ()

@end

@implementation SplashController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // [[SceneDelegate shared] toLoginHome];
    // [SceneDelegate.shared toLoginHome];
    
    //延时3秒
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [SceneDelegate.shared toLoginHome];
    });
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
