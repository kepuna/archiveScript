//
//  MBSpyReqeustModuleProtocol.h
//  Pods
//
//  Created by MOMO on 2020/7/1.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol MBSpyRequestErrorInfoProtocol <NSObject>

@property (nonatomic, assign) NSInteger errCode;
@property (nonatomic,   copy) NSString  *errMsg;

@end

typedef void(^MBSpyRequestCompleteBlock)(BOOL isSuccess, id<MBSpyRequestErrorInfoProtocol> errorInfo, NSDictionary *dataDict);

@protocol MBSpyReqeustModuleProtocol <NSObject>

- (void)commonRequetWithUrl:(NSString *)url params:(nullable NSDictionary *)params complete:(MBSpyRequestCompleteBlock)completeBlock;
- (void)commonActionRequest:(NSString *)action params:(nullable NSDictionary *)params complete:(MBSpyRequestCompleteBlock)completeBlock;

// time 大于0时自动弹窗错误文案
- (void)commonRequetWithUrl:(NSString *)url
                     params:(nullable NSDictionary *)params
           errorMsgShowTime:(NSTimeInterval)time
                   complete:(MBSpyRequestCompleteBlock)completeBlock;

- (void)commonActionRequest:(NSString *)action
                     params:(nullable NSDictionary *)params
           errorMsgShowTime:(NSTimeInterval)time
                   complete:(MBSpyRequestCompleteBlock)completeBlock;

@end

NS_ASSUME_NONNULL_END
