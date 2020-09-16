//
//  MBSpyRoomEventDefine.h
//  MBSpyRoom-iOS
//
//  Created by David on 2020/7/3.
//

#ifndef MBSpyRoomEventDefine_h
#define MBSpyRoomEventDefine_h

// 通用 UI 配置

#define kMBSpyContentLeftMargin  (15.0f)
#define kMBSpyContentRightMargin (15.0f)

#if DEBUG
#define MBSpyLog(fmt, ...) {NSLog((@"CarRoom: [line: %d], %s, " fmt), __LINE__, __PRETTY_FUNCTION__, ##__VA_ARGS__);}
#else
#define MBSpyLog(fmt, ...)
#endif

//// 退房原因
//typedef NS_ENUM(NSInteger, MBCarRoomQuitReason) {
//    MBCarRoomQuitReasonNormal      = 0,    /**< 正常退房 */
//    MBCarRoomQuitReasonFloatWindow = 1,    /**< 显示小窗(内部定义) */
//    MBCarRoomQuitReasonJoinError   = 2,    /**< 进房失败 */
//    MBCarRoomQuitReasonCloseWindow = 3,    /**< 关闭小窗 */
//    MBCarRoomQuitReasonUnsupport   = 4,    /**< 不支持的游戏模式 */
//    MBCarRoomQuitReasonkickOut     = 5,    /**< 踢出房间 */
//    MBCarRoomQuitReasonLogout      = 6,    /**< 账号退出 */
//    MBCarRoomQuitReasonKillApp     = 7,    /**< 前台关闭App */
//    MBCarRoomQuitReasonMediaError  = 8,    /**< 媒体失败 */
//    MBCarRoomQuitReasonMediaConflict = 9,  /**< 媒体冲突关闭 */
//    MBCarRoomQuitReasonUserClose   = 10,   /**< 用户切换房间 */
//    MBCarRoomQuitReasonBanRoom     = 11,   /**< 房间被封 */
//    MBCarRoomQuitReasonPoError     = 12,   /**< 心跳出错 */
//};
//
//// 内部定义的消息源
//typedef NS_ENUM(NSInteger, MBCarRoomInnerEventId) {
//    MBCarRoomInnerEventIdMySeatChange      = 999901, /**< 自己座位变更 */
//    MBCarRoomInnerEventIdRoomInfoChanged   = 999902, /**< 房间信息变更 */
//    MBCarRoomInnerEventIdDismissAllAction  = 999903, /**< 关闭一切操作层 */
//    MBCarRoomInnerEventIdSeatInoPrepared   = 999904, /**< 房间座位信息已备好 */
//};

// IM 错误码
//typedef NS_ENUM(NSInteger, MBCarRoomIMErrorCode) {
//    MBCarRoomIMErrorCodeMuted = 405,   /**< 用户被禁言 */
//    MBCarRoomIMErrorCodeSpam  = 406,   /**< 内容SPAM */
//};

// IM 通知的消息源
//typedef NS_ENUM(NSInteger, MBCarRoomIMEventId) {
////
//    MBCarRoomIMEventIdCloseVideo       = 503,      /**< 关闭视频（单发） */
////    MBPlayRoomIMEventIdRoomModeChange   = 509,      /**< 房间模式变更 */
////    MBPlayRoomIMEventIdClearQueue       = 510,      /**< 移除申请队列通知 */
////    MBPlayRoomIMEventIdHotNumChange     = 511,      /**< 房间火爆值变更 */
//    MBCarRoomIMEventIdBanRoom          = 512,      /**< 房间封禁 */
////    MBPlayRoomIMEventIdCannelOrder      = 513,      /**< 陪陪取消接单(仅下单用户能收到) */
//    MBCarRoomIMEventIdFirstEnterRoom   = 514,      /**< 第一次进房同步房间信息 */
//    MBCarRoomIMEventIdRoomMediaChange  = 515,      /**< 房间媒体权限变更 */
////    MBPlayRoomIMEventIdExitMiniRoom     = 516,      /**< 退出小房间(小房间使用) */
//
//
//    MBCarRoomIMEventIdSeatSwitch       = 532,      /**< 开黑车队座位开启/关闭(群发) */
//    MBCarRoomIMEventIdModifyRoom       = 533,      /**< 修改房间(群发) */
//    MBCarRoomIMEventIdUserState        = 534,      /**< 开黑车队 用户状态 */
//    MBCarRoomIMEventIdGameState        = 535,      /**<  开黑车队 车队状态 */
//
//    MBCarRoomIMEventIdNoSpeak          = 536,      /**<  车队禁麦(群发) */
//    MBCarRoomIMEventIdSpeak            = 537,      /**<  车队开麦(群发) */
//
//
//
////    // 以下两个消息会转发给 Lua 页面 event: MBPlayIMEventNotification
////    MBPlayRoomIMEventIdStopReceiveOrder = 601,      /**< 接单封禁消息(接单取消惩罚) */
////    MBPlayRoomIMEventIdStopRedPointTip  = 602,      /**< 红点消息 */
////
//    MBCarRoomIMEventIdEnterRoom        = 1501,     /**< 进入房间（群发） */
//    MBCarRoomIMEventIdOnlineChange     = 1502,     /**< 房间人数变动（群发） */
//    MBCarRoomIMEventIdTop3Change       = 1503,     /**< 在线top3列表有变化[财富值]（群发） */
//    MBCarRoomIMEventIdNameNoticeChange = 1504,     /**< 更新房间名称和公告（群发) */
////    MBPlayRoomIMEventIdTextMsg          = 1505,     /**< 文本消息（群发）*/
////
////    MBPlayRoomIMEventIdQueueMove        = 1506,     /**< 移除队列通知（单发）*/
////    MBPlayRoomIMEventIdQueueChange      = 1507,     /**< 申请队列变化（群发）*/
////
//    MBCarRoomIMEventIdGrepSeat         = 1508,     /**< 通知上麦（单发）*/
//    MBCarRoomIMEventIdLeaveSeat        = 1509,     /**< 通知下麦（单发）*/
////
//    MBCarRoomIMEventIdSeatChange       = 1510,     /**< 座位变动（群发）*/
//    MBCarRoomIMEventIdProhibitSpeak    = 1511,     /**< 通知被禁言（单发））*/
//    MBCarRoomIMEventIdCloseMic         = 1512,     /**< 闭麦（单发）*/
//    MBCarRoomIMEventIdKickourRoom      = 1513,     /**< 踢出房间（单发）*/
//    MBCarRoomIMEventIdDissolveRoom     = 1514,     /**< 房间解散（群发） */
////
//    MBCarRoomIMEventIdPublicScreen     = 1515,     /**< 房间公屏消息[不包括礼物]（群发）*/
//    MBCarRoomIMEventIdGiftPublicScreen = 1516,     /**< 礼物公屏消息（群发）*/
//    MBCarRoomIMEventIdGiftMsg          = 1517,     /**< 送礼消息 （群发）*/
////
////    MBPlayRoomIMEventIdQueryUpmicrop    = 1523,     /**< 询问是否上麦 */
//    MBCarRoomIMEventIdGiftRecord       = 1527,     /**< 送礼物回调 */
//    MBCarRoomIMEventIdExitRoom         = 1528,     /**< 退出房间（群发） */
//    MBCarRoomIMEventIdOpenMic          = 1529,     /**< 开麦（单发）*/
////
//};


// 偏好设置的 key

//static NSString * const MBCarUserDefaultRoomMsgKey     = @"car_room_msg";
//
//static NSString * const MBCarUserDefaultCommonRoomId   = @"car_common_room_id";
//static NSString * const MBCarUserDefaultCommonRoomName = @"car_common_room_name";


#endif /* MBSpyRoomEventDefine_h */
