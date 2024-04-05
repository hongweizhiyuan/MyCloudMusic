//
//  SettingView.h
//  设置itemView
//
//  Created by mac on 2024/4/5.
//

#import <UIKit/UIKit.h>

// 布局框架
#import <Masonry.h>

NS_ASSUME_NONNULL_BEGIN

@interface SettingView : UIView

/// 左侧图标
@property (nonatomic,strong) UIImageView *iconView;

/// 左侧图标
@property (nonatomic,strong) UILabel *titleView;

/// 右侧图标
@property (nonatomic,strong) UIImageView *moreIconView;

@end

NS_ASSUME_NONNULL_END
