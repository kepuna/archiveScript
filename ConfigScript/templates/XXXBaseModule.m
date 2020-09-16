//
//  __Prefix__BaseModule.m
//  __Prefix__
//
//  Created by MOMO on __year__.
//

#import "__Prefix__BaseModule.h"

@implementation __Prefix__BaseModule
@synthesize moduleContext = _moduleContext;

- (instancetype)initWithModuleContext:(__Prefix__ModuleContext *)moduleContext {
    self = [super init];
    if (self) {
        _moduleContext = moduleContext;
    }
    return self;
}
//
//#pragma mark - Public Methods
//- (void)showToastMsg:(NSString *)msg time:(NSTimeInterval)time {
//    if (self.currentModuleContext.isSuspension) {
//        // 如果需要在小窗显示的时候还要弹出提示的话(如用户被踢)，请不要调用此方法!!!
//        return;
//    }
//    NSParameterAssert([msg isNotEmpty] && time > 0);
//    [[IndicateTool sharedIndicate] showOKInView:[MDContext appWindow] withText:msg timeOut:time];
//}
//
//- (void)showErrorMsg:(NSString *)msg time:(NSTimeInterval)time {
//    [self showErrorMsg:msg time:time alwaysShow:NO];
//}
//
//- (void)showNormalMsg:(NSString *)msg {
//    if (self.currentModuleContext.isSuspension) {
//        // 如果需要在小窗显示的时候还要弹出提示的话(如用户被踢)，请不要调用此方法!!!
//        return;
//    }
//    NSParameterAssert([msg isNotEmpty]);
//    [[IndicateTool sharedIndicate] showNormalInView:[MDContext appWindow] withText:msg];
//}
//
//- (void)showErrorMsg:(NSString *)msg time:(NSTimeInterval)time alwaysShow:(BOOL)alwaysShow {
//    if (!alwaysShow && self.currentModuleContext.isSuspension) {
//        return;
//    }
//    NSParameterAssert([msg isNotEmpty] && time > 0);
//    [[IndicateTool sharedIndicate] showWarningInView:[MDContext appWindow] withText:msg timeOut:time];
//}
//
//- (BOOL)handleEvent:(NSInteger)event userInfo:(id)info callback:(MBCommonModulesCallback)callback {
//    
//    return NO;
//}
//
- (void)moduleDealloc:(NSInteger)reason {
    
}
//
//#pragma mark - Getter
//
- (__Prefix__ModuleContext *)currentModuleContext {
    return (__Prefix__ModuleContext *)_moduleContext;
}

@end
