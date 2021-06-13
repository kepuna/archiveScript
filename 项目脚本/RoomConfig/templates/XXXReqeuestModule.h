//
//  __Prefix__ReqeuestModule.h
//  MBCarRoom
//
//  Created by MOMO on 2020/7/1.
//

#import "__Prefix__BaseModule.h"
#import "__Prefix__ReqeustModuleProtocol.h"
NS_ASSUME_NONNULL_BEGIN

@interface __Prefix__ReqeuestModule : __Prefix__BaseModule <__Prefix__ReqeustModuleProtocol>

// 通用参数
// uid    用户 ID
// roomId 房间 ID
// osType 系统类型
// innerVersion  陌陌内部版本号
// source 进房来源
// traceId 房间请求唯一标识

@end

NS_ASSUME_NONNULL_END
