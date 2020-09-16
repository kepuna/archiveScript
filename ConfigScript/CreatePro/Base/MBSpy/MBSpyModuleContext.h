//
//  MBSpyModuleContext.h
//  MBCarRoom
//
//  Created by MOMO on 2020.
//

#import "MBCommonModuleContext.h"

NS_ASSUME_NONNULL_BEGIN

@interface MBSpyModuleContext : MBCommonModuleContext

@property (nonatomic, copy) NSString *roomId;
@property (nonatomic, copy) NSString *momoId;
@property (nonatomic, assign) NSInteger momoAppVersion;

// 是否从房间切换进入的(房间切换不通知大厅)
@property (nonatomic, assign, getter=isFromRoom) BOOL fromRoom;

// 媒体是否处于暂停状态(媒体互斥)
@property (nonatomic, assign, getter=isMediaPaused) BOOL mediaPaused;

@end

NS_ASSUME_NONNULL_END
