//
//  ViewController.m
//  TestMasonry
//
//  Created by mac on 2024/3/31.
//

//布局框架
#import <Masonry.h>

#import "ViewController.h"
#import "SettingController.h"

@interface ViewController ()
@property (strong, nonatomic) UIView *container;
@property (strong, nonatomic) UIButton *phoneLoginButton;
@property (strong, nonatomic) UIButton *primaryButton;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    #pragma mark - 控件
    //添加一个根容器
    self.container=[UIView new];
    //    self.container.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.container];
    
    //logo
    UIImageView *logoView = [[UIImageView alloc] init];
    logoView.image = [UIImage imageNamed:@"Logo"];
    [self.container addSubview:logoView];
    
    #pragma mark - 手机号登陆按钮
    self.phoneLoginButton=[UIButton buttonWithType:UIButtonTypeSystem];
    
    //设置标题
    [self.phoneLoginButton setTitle:@"手机号登陆" forState:UIControlStateNormal];
    
    //设置点击事件
    [self.phoneLoginButton addTarget:self action:@selector(phoneLoginClick:) forControlEvents:UIControlEventTouchUpInside];
    
    self.phoneLoginButton.backgroundColor = [UIColor redColor];
    
    self.phoneLoginButton.layer.cornerRadius = 5;
    
    [self.phoneLoginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    //按下文本颜色
    [self.phoneLoginButton setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    
    [self.container addSubview:self.phoneLoginButton];
    
    #pragma mark - 登陆按钮
    self.primaryButton=[UIButton buttonWithType:UIButtonTypeSystem];
    
    //设置标题
    [self.primaryButton setTitle:@"用户名和密码登陆" forState:UIControlStateNormal];
    [self.primaryButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    
    //设置点击事件
    [self.primaryButton addTarget:self action:@selector(primaryClick:) forControlEvents:UIControlEventTouchUpInside];
    
    self.primaryButton.backgroundColor = [UIColor clearColor];
    self.primaryButton.layer.cornerRadius = 21;
    self.primaryButton.layer.borderWidth = 1;
    self.primaryButton.layer.borderColor = [UIColor redColor].CGColor;
    [self.container addSubview:self.primaryButton];
    
    #pragma mark - 第三方登陆容器
    UIView *otherLoginContainer=[UIView new];
    otherLoginContainer.backgroundColor = [UIColor orangeColor];
    [self.container addSubview:otherLoginContainer];
    
    //第三方登录按钮
    NSMutableArray *otherLoginButtonViews = [NSMutableArray new];
    for (NSInteger i=0; i<4; i++) {
        UIButton *buttonView=[UIButton new];
        [buttonView setImage:[UIImage imageNamed:@"LoginQqSelected"] forState:UIControlStateNormal];
        [otherLoginContainer addSubview:buttonView];
        buttonView.backgroundColor=[UIColor greenColor];
        [otherLoginButtonViews addObject:buttonView];
    }
    
    #pragma mark - 协议
    //创建控件，如果要实现居中，那就要手动计算获取用自动布局
    UILabel *agrementLabelView = [[UILabel alloc] init];
    
    //设置标题
    agrementLabelView.text=@"登录即表示你同意《用户协议》和《隐私政策》";
    
    agrementLabelView.font = [UIFont systemFontOfSize:12];
    agrementLabelView.textColor=[UIColor grayColor];
    
    [self.container addSubview:agrementLabelView];
    
    
    #pragma mark - 约束
    //根容器
    [self.container mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_safeAreaLayoutGuideTop).offset(16);
        
        //负数表示向上
        make.bottom.equalTo(self.view.mas_safeAreaLayoutGuideBottom).offset(-16);
        
        //正数表示向下
        make.left.equalTo(self.view.mas_safeAreaLayoutGuideLeft).offset(16);
        make.right.equalTo(self.view.mas_safeAreaLayoutGuideRight).offset(-16);
    }];
    
    #pragma mark - logo
    [logoView mas_makeConstraints:^(MASConstraintMaker *make) {
        //宽高
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(100);
        
        //距离顶部
        make.top.mas_equalTo(100);
        
        //水平居中
        make.centerX.equalTo(self.view.mas_centerX);
    }];
    
    
    #pragma mark - 协议
    [agrementLabelView mas_makeConstraints:^(MASConstraintMaker *make) {
        //距离底部
        make.bottom.mas_equalTo(0);
        
        //水平居中
        make.centerX.equalTo(self.view.mas_centerX);
    }];
    
    #pragma mark - 第三方登陆容器
    [otherLoginContainer mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.container.mas_width);
        make.height.mas_equalTo(50);
        
        make.bottom.equalTo(agrementLabelView.mas_top).offset(-30);
    }];
    
    //水平排列,每个控件固定尺寸
    //leadSpacing：左侧边距
    //tailSpacing：右侧边距
    [otherLoginButtonViews mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedItemLength:50 leadSpacing:0 tailSpacing:0];
    
    //同时设置多个控件约束
    [otherLoginButtonViews mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(otherLoginContainer);
        //make.size.mas_equalTo(CGSizeMake(50, 50));
        make.height.mas_equalTo(50);
    }];
    
    //水平排列,间距固定尺寸
    //[otherLoginButtonViews mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:20 leadSpacing:0 tailSpacing:0];
    
    #pragma mark - 登陆按钮
    [self.primaryButton mas_makeConstraints:^(MASConstraintMaker *make) {
        //宽和父窗体一样
        make.width.equalTo(self.container.mas_width);
        make.height.mas_equalTo(42);
        
        //底部
        make.bottom.equalTo(otherLoginContainer.mas_top).offset(-30);
    }];
    
    #pragma mark - 手机号登陆
    [self.phoneLoginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.container.mas_width);
        make.height.mas_equalTo(42);
        
        make.bottom.equalTo(self.primaryButton.mas_top).offset(-30);
    }];
}

- (void)phoneLoginClick:(UIButton *)sender {
    NSLog(@"ViewController phoneLoginClick %@",sender);
    
    // 点击跳转
    SettingController *target = [SettingController new];
    
    [self.navigationController pushViewController:target animated:YES];
    
}

/// 登陆按钮点击
/// @param sender sender description
- (void)primaryClick:(UIButton *)sender {
    NSLog(@"ViewController primaryClick %@",sender);
}

@end
