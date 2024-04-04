//
//  ViewController.m
//  TestMasonry
//
//  Created by mac on 2024/3/31.
//

//布局框架
#import <Masonry.h>

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) UIView *container;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    #pragma mark - 控件
    //添加一个根容器
    self.container=[UIView new];
    self.container.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.container];
    
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


}


@end
