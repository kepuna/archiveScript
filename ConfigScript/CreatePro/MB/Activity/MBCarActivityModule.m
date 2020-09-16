//
//  MBCarActivityReqeuestModule.m
//  MBCarRoom
//
//  Created by MOMO on 2020.
//

#import "MBCarActivityModule.h"

@interface MBCarActivityModule ()

@end

@implementation MBCarActivityModule

- (instancetype)initWithModuleContext:(MBCarModuleContext *)moduleContext
{
    self = [super initWithModuleContext:moduleContext];
    if (self) {
        [self configUI:moduleContext];
    }
    return self;
}

#pragma mark - Set Up UI
- (void)configUI:(MBCarModuleContext *)moduleContext {
    
}

@end
