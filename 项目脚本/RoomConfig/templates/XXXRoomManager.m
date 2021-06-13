//
//  __Prefix__RoomManager.m
//  MBCarRoom-iOS
//
//  Created by MOMO on 2020/7/6.
//

#import "__Prefix__RoomManager.h"
#import <MBCommonModuleMediator/MBCommonModuleMediator.h>
#import "__Prefix__ModulesMap.h"
#import "__Prefix__ModuleContext.h"
#import "__Prefix__RoomViewController.h"

@interface __Prefix__RoomManager ()
@property (nonatomic, strong) __Prefix__RoomViewController *roomVC;
@property (nonatomic, strong) MBCommonModuleMediator *moduleMediator;

@end

@implementation __Prefix__RoomManager

+ (instancetype)shareManager {
    static __Prefix__RoomManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[self alloc] init];
    });
    return manager;
}

- (void)pushVC {
   
}

- (void)testPushVCWithRootVC:(UIViewController *)rootVC {
    
    self.roomVC = [[__Prefix__RoomViewController alloc] init];
    MBSpyModuleContext *moduleContext = [[MBSpyModuleContext alloc] init];
    moduleContext.roomId = @"000";//roomId;
    moduleContext.momoId = @"111";//[MDContext currentUser].momoid;
    moduleContext.momoAppVersion = 0.1;//[MDAppBusServiceInstance(MMCommonService) momoAppVersion];
    //        moduleContext.fromRoom = self.fromPlayRoom;
    //        moduleContext.extraObj = gotoParam; // 保存goto参数
    
    self.moduleMediator = [MBCommonModuleMediator moduleMediator];
    self.moduleMediator.moduleContext = moduleContext;
    [self.moduleMediator bindViewController:self.roomVC]; // 绑定控制器
    
    // 注册模块
    [__Prefix__ModulesMap bindingModuleMap];
    [rootVC.navigationController pushViewController:self.roomVC animated:YES];
}

@end
