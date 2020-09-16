//
//  MBSpyRoomManager.m
//  MBCarRoom-iOS
//
//  Created by MOMO on 2020/7/6.
//

#import "MBSpyRoomManager.h"
#import <MBCommonModuleMediator/MBCommonModuleMediator.h>
#import "MBSpyModulesMap.h"
#import "MBSpyModuleContext.h"
#import "MBSpyRoomViewController.h"

@interface MBSpyRoomManager ()
@property (nonatomic, strong) MBSpyRoomViewController *roomVC;
@property (nonatomic, strong) MBCommonModuleMediator *moduleMediator;

@end

@implementation MBSpyRoomManager

+ (instancetype)shareManager {
    static MBSpyRoomManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[self alloc] init];
    });
    return manager;
}

- (void)pushVC {
   
}

- (void)testPushVCWithRootVC:(UIViewController *)rootVC {
    
    self.roomVC = [[MBSpyRoomViewController alloc] init];
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
    [MBSpyModulesMap bindingModuleMap];
    [rootVC.navigationController pushViewController:self.roomVC animated:YES];
}

@end
