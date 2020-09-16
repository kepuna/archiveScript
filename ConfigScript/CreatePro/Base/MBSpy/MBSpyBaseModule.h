//
//  MBSpyBaseModule.h
//  MBCarRoom
//
//  Created by MOMO on 2020.
//

#import <Foundation/Foundation.h>
#import <MBCommonModuleMediator/MBCommonModuleMediator.h>
#import "MBSpyBaseModuleProtocol.h"
#import "MBSpyModuleContext.h"
NS_ASSUME_NONNULL_BEGIN

@interface MBSpyBaseModule : NSObject<MBSpyBaseModuleProtocol>

- (instancetype)initWithModuleContext:(MBSpyModuleContext *)moduleContext NS_DESIGNATED_INITIALIZER;
- (void)moduleDealloc:(NSInteger)reason NS_REQUIRES_SUPER;

@end

NS_ASSUME_NONNULL_END
