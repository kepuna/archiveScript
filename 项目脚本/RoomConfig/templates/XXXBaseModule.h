//
//  __Prefix__BaseModule.h
//  MBCarRoom
//
//  Created by MOMO on __year__.
//

#import <Foundation/Foundation.h>
#import <MBCommonModuleMediator/MBCommonModuleMediator.h>
#import "__Prefix__BaseModuleProtocol.h"
#import "__Prefix__ModuleContext.h"
NS_ASSUME_NONNULL_BEGIN

@interface __Prefix__BaseModule : NSObject<__Prefix__BaseModuleProtocol>

- (instancetype)initWithModuleContext:(__Prefix__ModuleContext *)moduleContext NS_DESIGNATED_INITIALIZER;
- (void)moduleDealloc:(NSInteger)reason NS_REQUIRES_SUPER;

@end

NS_ASSUME_NONNULL_END
