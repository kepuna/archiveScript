//
//  MBSpyUILayoutReqeuestModule.m
//  MBSpyRoom
//
//  Created by MOMO on 2020.
//

#import "MBSpyUILayoutModule.h"
#import <MBCommonModuleMediator/MBCommonModuleMediator.h>
#import <MMUIBaseFoundation/UIColor+HEX.h>
#import <SDWebImage_MMExt/UIImageView+mmsd.h>

@interface MBSpyRoomContainer : UIView

@end

@implementation MBSpyRoomContainer


- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    if (!self.userInteractionEnabled || self.hidden || self.alpha < 0.01) {
        return nil;
    }
    if ([self pointInside:point withEvent:event]) {
        for (UIView *subView in [self.subviews reverseObjectEnumerator]) {
            CGPoint convertPoint = [subView convertPoint:point fromView:self];
            UIView *hitTestView = [subView hitTest:convertPoint withEvent:event];
            if (hitTestView) {
                return hitTestView;
            }
        }
    }
    return nil;
}

@end

@interface MBSpyUILayoutModule ()

@end

@implementation MBSpyUILayoutModule
@synthesize baseView = _baseView, containerView =_containerView,
actionView = _actionView, giftEffectView = _giftEffectView,
alertView = _alertView, inputView = _inputView;

- (instancetype)initWithModuleContext:(MBSpyModuleContext *)moduleContext
{
    self = [super initWithModuleContext:moduleContext];
    if (self) {
        [self configBaseUIViews:moduleContext];
    }
    return self;
}


#pragma mark - LiftCycle

- (void)viewDidLoad:(__kindof UIViewController *)vc
{
    // 布局其他的Module
//    MBCommonGetModule(MBCarRoomTopBarProtocol);
//    MBCommonGetModule(MBCarBottomBarModuleProtocol);
//    MBCommonGetModule(MBCarRoomSeatModuleProtocol);
//    MBCommonGetModule(MBCarTipStateViewModuleProtocol);
//    MBCommonGetModule(MBCarRoomMessageModuleProtocol);
    // 视图创建完成后再请求接口
//    [MBCommonGetModule(MBCarRoomModuleProtocol) joinRoom];
    
}

#pragma mark - Public Methods

- (CGFloat)roomTopBarHeight
{
//    CGFloat topBarHeight = [MBCarRoomTopBar contentHeight];
//    return topBarHeight + STATUS_BAR_HEIGHT;
    return 100;
}

- (CGFloat)roomBottomBarHeight
{
    return 100;
//    CGFloat bottomBarHeight = [MBCommonGetModule(MBCarBottomBarModuleProtocol) bottomBarHeight];
//    return bottomBarHeight + SAFEAREA_BOTTOM_MARGIN;
}

#pragma mark -privateMethod

- (void)configBaseUIViews:(MBCommonModuleContext *)moduleContext
{
    CGRect superViewBounds = moduleContext.inView.bounds;
    _baseView = [[UIView alloc] initWithFrame:superViewBounds];
    [moduleContext.inView addSubview:_baseView];
    
    _containerView = [[MBSpyRoomContainer alloc] initWithFrame:superViewBounds];
    _containerView.backgroundColor = [UIColor clearColor];
    [moduleContext.inView addSubview:_containerView];
            
//    self.baseView.backgroundColor = RGBCOLOR(28, 30, 34);
//    UIImageView *imageView = [[UIImageView alloc] initWithFrame:_baseView.bounds];
//    [imageView setImageWithURL:[NSURL URLWithString:@"https://s.momocdn.com/w/u/others/custom/yao.tiancheng/gangup/1.0/bg_image.png"]];
//    [self.baseView addSubview:imageView];
    
    [self configBackgroundViewWithFrame:superViewBounds];
}

- (void)configBackgroundViewWithFrame:(CGRect)frame {
    CAGradientLayer *gl = [CAGradientLayer layer];
    gl.frame = frame;
    gl.startPoint = CGPointMake(0.5, 0);
    gl.endPoint = CGPointMake(0.5, 0.7);
    gl.colors = @[(__bridge id)[UIColor colorWithRed:54/255.0 green:64/255.0 blue:218/255.0 alpha:1.0].CGColor, (__bridge id)[UIColor colorWithRed:76/255.0 green:192/255.0 blue:252/255.0 alpha:1.0].CGColor];
    gl.locations = @[@(0), @(1.0f)];
    [self.baseView.layer addSublayer:gl];
}

#pragma mark - getter

- (UIView *)actionView
{
    if (!_actionView) {
        UIView *superView = MBCommonGetModuleMediator.moduleContext.inView;
        _actionView = [[MBSpyRoomContainer alloc] initWithFrame:superView.bounds];
        [superView insertSubview:_actionView aboveSubview:self.containerView];
    }
    return _actionView;
}

- (UIView *)alertView
{
    if (!_alertView) {
        UIView *superView = MBCommonGetModuleMediator.moduleContext.inView;
        _alertView = [[MBSpyRoomContainer alloc] initWithFrame:superView.bounds];
        if (_inputView) {
            [superView insertSubview:_alertView belowSubview:_inputView];
        } else {
            [superView addSubview:_alertView];
        }
    }
    return _alertView;
}

- (UIView *)giftEffectView
{
    if (!_giftEffectView) {
        UIView *superView = MBCommonGetModuleMediator.moduleContext.inView;
        _giftEffectView = [[MBSpyRoomContainer alloc] initWithFrame:superView.bounds];
        if (_alertView) {
             [superView insertSubview:_giftEffectView belowSubview:_alertView];
        } else if (_inputView) {
            [superView insertSubview:_giftEffectView belowSubview:_inputView];
        } else {
            [superView addSubview:_giftEffectView];
        }
    }
    return _giftEffectView;
}

- (UIView *)inputView
{
    if (!_inputView) {
        UIView *superView = MBCommonGetModuleMediator.moduleContext.inView;
        _inputView = [[MBSpyRoomContainer alloc] initWithFrame:superView.bounds];
        _inputView.backgroundColor = [UIColor clearColor];
        [superView addSubview:_inputView];
    }
    return _inputView;
}


@end
