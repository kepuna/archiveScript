//
//  __Prefix__ReqeustModuleProtocol.h
//  Pods
//
//  Created by MOMO on 2020/7/1.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol __Prefix__RequestErrorInfoProtocol <NSObject>

@property (nonatomic, assign) NSInteger errCode;
@property (nonatomic,   copy) NSString  *errMsg;

@end

typedef void(^__Prefix__RequestCompleteBlock)(BOOL isSuccess, id<__Prefix__RequestErrorInfoProtocol> errorInfo, NSDictionary *dataDict);

@protocol __Prefix__ReqeustModuleProtocol <NSObject>

- (void)commonRequetWithUrl:(NSString *)url params:(nullable NSDictionary *)params complete:(__Prefix__RequestCompleteBlock)completeBlock;
- (void)commonActionRequest:(NSString *)action params:(nullable NSDictionary *)params complete:(__Prefix__RequestCompleteBlock)completeBlock;

// time 大于0时自动弹窗错误文案
- (void)commonRequetWithUrl:(NSString *)url
                     params:(nullable NSDictionary *)params
           errorMsgShowTime:(NSTimeInterval)time
                   complete:(__Prefix__RequestCompleteBlock)completeBlock;

- (void)commonActionRequest:(NSString *)action
                     params:(nullable NSDictionary *)params
           errorMsgShowTime:(NSTimeInterval)time
                   complete:(__Prefix__RequestCompleteBlock)completeBlock;

@end

NS_ASSUME_NONNULL_END
