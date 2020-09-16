//
//  __Prefix__ReqeuestModule.m
//  MBCarRoom
//
//  Created by MOMO on __year__.
//

#import "__Prefix__Module.h"

@interface __Prefix__Module ()

@end

@implementation __Prefix__Module

- (instancetype)initWithModuleContext:(__PrefixApp__ModuleContext *)moduleContext
{
    self = [super initWithModuleContext:moduleContext];
    if (self) {
        [self configUI:moduleContext];
    }
    return self;
}

#pragma mark - Set Up UI
- (void)configUI:(__PrefixApp__ModuleContext *)moduleContext {
    
}

@end
