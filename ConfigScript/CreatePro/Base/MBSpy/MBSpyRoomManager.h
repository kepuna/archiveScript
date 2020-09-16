//
//  MBSpyRoomManager.h
//  MBCarRoom-iOS
//
//  Created by MOMO on 2020/7/6.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MBSpyRoomManager : NSObject

+ (instancetype)shareManager;

- (void)pushVC;

/// 未接入Momo-iOS时测试用的
- (void)testPushVCWithRootVC:(UIViewController *)rootVC;

@end

NS_ASSUME_NONNULL_END
