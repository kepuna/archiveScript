//
//  MBSpyUILayoutModuleProtocol.h
//  Pods
//
//  Created by MOMO on 2020.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol MBSpyUILayoutModuleProtocol <MBSpyBaseModuleProtocol>

@required;
/**
 * 最底层视图(房间背景和公共模块使用)
 */
@property (nonatomic, strong, readonly) UIView *baseView;

/**
 * 房间模式层(不同模式内容使用)
 */
@property (nonatomic, strong, readonly) UIView *containerView;

/**
 * 用户操作层(显示用户操作面板等页面(公告详情、在线列表、礼物面板等))
 */
@property (nonatomic, strong, readonly) UIView *actionView;

/**
 *  礼物动效层
 */
@property (nonatomic, strong, readonly) UIView *giftEffectView;

/**
 * 弹窗层(显示跑马灯、魅力提升动画)
 */
@property (nonatomic, strong, readonly) UIView *alertView;

/**
 * 输入层
 */
@property (nonatomic, strong, readonly) UIView *inputView;


///** 房间顶部高度 */
- (CGFloat)roomTopBarHeight;

- (CGRect)roomBottomBarHeight;

@end

NS_ASSUME_NONNULL_END
