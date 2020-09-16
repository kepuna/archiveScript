//
//  MBSpyPublicHeaders.h
//  MBSpyRoom-iOS
//
//  Created by MOMO on 2020.
//

#ifndef MBSpyPublicHeaders_h
#define MBSpyPublicHeaders_h

#if __has_include(<MMUIBaseFoundation/UIView+SampleFrame.h>)
#import <MMUIBaseFoundation/UIView+SampleFrame.h>
#import <MMUIBaseFoundation/UIColor+HEX.h>
#else
#import "UIView+SampleFrame.h"
#import "UIColor+HEX.h"
#endif

#if __has_include(<MBCommonModuleMediator/MBCommonModuleMediator.h>)
#import <MBCommonModuleMediator/MBCommonModuleMediator.h>
#else
#import "MBCommonModuleMediator.h"
#endif

#if __has_include(<MMContext/MDContext.h>)
#import <MMContext/MDContext.h>
#import <MMContext/MDUser.h>
#else
#import "MDContext.h"
#import "MDUser.h"
#endif

#if __has_include(<MMPublicTools/MDFunction.h>)
#import <MMPublicTools/MDFunction.h>
#import <MMPublicTools/NSString+QVUtility.h>
#import <MMPublicTools/NSString+formatter.h>
#else
#import "MDFunction.h"
#import "NSString+QVUtility.h"
#import "NSString+formatter.h"
#endif


#if __has_include(<MMCommonService/MMCommonService.h>)
#import <MMCommonService/MMCommonService.h>
#else
#import "MMCommonService.h"
#endif

#if __has_include(<MMBaseFoundation/MMBaseFoundation.h>)
#import <MMBaseFoundation/MMBaseFoundation.h>
#import <MMBaseFoundation/NSString+MFCateory.h>
#else
#import "MMBaseFoundation.h"
#import "NSString+MFCateory.h"
#endif


#if __has_include(<MMIndicateTool/MMIndicateTool.h>)
#import <MMIndicateTool/MMIndicateTool.h>
#else
#import "MMIndicateTool.h"
#endif

#if __has_include(<MMFrameManager/MMFrameManager.h>)
#import <MMFrameManager/MMFrameManager.h>
#else
#import "MMFrameManager.h"
#endif

#if __has_include(<SDWebImage/SDWebImage.h>)
#import <SDWebImage/SDWebImage.h>
#else
#import "SDWebImage.h"
#endif

#import "MBSpyMacro.h"
#import "MBSpyRoomEventDefine.h"
#import "MBSpyRequestApiDefine.h"

#endif /* MBCarPublic_h */
