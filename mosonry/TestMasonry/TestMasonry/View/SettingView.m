//
//  SettingView.m
//  TestMasonry
//
//  Created by mac on 2024/4/5.
//
#import "SettingView.h"

@implementation SettingView

- (instancetype)init{
    self=[super init];
    if (self) {
        [self innerInit];
    }
    return self;
}

-(void)innerInit{
    self.backgroundColor=[UIColor whiteColor];
    [self addSubview:self.iconView];
    [self addSubview:self.titleView];
    [self addSubview:self.moreIconView];
}

/// 当视图加入父视图时 / 当视图从父视图移除时调用
- (void)didMoveToSuperview{
    [super didMoveToSuperview];

    [self.iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(16);
        make.centerY.equalTo(self);
        make.width.mas_equalTo(20);
        make.height.equalTo(@(20));
    }];

    [self.titleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.iconView.mas_right).offset(16);
        make.centerY.equalTo(self);
    }];

    [self.moreIconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).offset(-16);
        make.centerY.equalTo(self);
        make.width.mas_equalTo(20);
        make.height.equalTo(@(20));
    }];
}

#pragma mark - 创建控件
- (UIImageView *)iconView{
    if (!_iconView) {
        _iconView=[UIImageView new];
        _iconView.image=[UIImage imageNamed:@"Setting"];
    }
    return _iconView;
}

- (UILabel *)titleView{
    if (!_titleView) {
        _titleView=[UILabel new];
        _titleView.text=@"设置";
    }
    return _titleView;
}

- (UIImageView *)moreIconView{
    if (!_moreIconView) {
        _moreIconView=[UIImageView new];
        _moreIconView.image=[UIImage imageNamed:@"Arrow"];
    }
    return _moreIconView;
}
@end
