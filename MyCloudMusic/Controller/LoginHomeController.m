//
//  LoginHomeController.m
//  MyCloudMusic
//
//  Created by mac on 2024/3/15.
//

#import "LoginHomeController.h"
#import "LoginController.h"

@interface LoginHomeController ()


/// 主按钮
@property (weak, nonatomic) IBOutlet UIButton *primaryButton;

@end

@implementation LoginHomeController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    // 圆角
    self.primaryButton.layer.cornerRadius = 21;
    
    // 边框
    self.primaryButton.layer.borderColor = [UIColor redColor].CGColor;
    self.primaryButton.layer.borderWidth = 1;
    
}

/// 主按钮点击
/// - Parameter sender: <#sender description#>
- (IBAction)primaryClick:(UIButton *)sender {
    NSLog(@"LoginHomeController primaryClick");
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];

    UIViewController *target = [storyboard instantiateViewControllerWithIdentifier:@"Login"];
    
    // 跳转到指定界面
    [self.navigationController pushViewController:target animated:YES];

}

@end
