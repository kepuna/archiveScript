//
//  __Prefix__BaseModuleProtocol.h

//  Created by MOMO on __year__年.
//


#import <Foundation/Foundation.h>
#import <MBCommonModuleMediator/MBCommonModuleProtocol.h>

NS_ASSUME_NONNULL_BEGIN

@protocol __Prefix__BaseModuleProtocol <MBCommonModuleProtocol>

/**
 处理进房数据
 @param roomInfo 房间原始信息(可以通过 MBPlayRoomDataModule 获取格式化后的信息)
 @param isRefresh YES: 进房  NO: IM同步
 */
- (void)handleJoinRoomInfo:(NSDictionary *)roomInfo refresh:(BOOL)isRefresh;


/**
 处理扩展信息
 @param dictionary 扩展的原始信息
 */
- (void)handleFetchExtraInfo:(NSDictionary *)extraInfo;


/**
 处理事件信息(包含IM和内部自定义事件)
 所有事件定义在 MBAccompanyPlayRoomDefine.h
 @param dictionary 关联数据
 @param eventId    事件ID，
 */
- (void)handleReceivedDict:(NSDictionary *)dictionary eventId:(NSInteger)eventId;


/**
 房间模式切换
 所有模式定义在 MBPlayRoomModel.h
 @param from 切换前的房间模式
 @param to   切换后的房间模式
 */
- (void)changeRoomModeFrom:(NSInteger)from to:(NSInteger)to;

@end

NS_ASSUME_NONNULL_END
