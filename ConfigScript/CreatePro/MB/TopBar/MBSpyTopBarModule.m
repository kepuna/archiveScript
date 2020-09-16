//
//  MBSpyTopBarReqeuestModule.m
//  MBCarRoom
//
//  Created by MOMO on 2020.
//

#import "MBSpyTopBarModule.h"

@interface MBSpyTopBarModule ()

@end

@implementation MBSpyTopBarModule

- (instancetype)initWithModuleContext:(MBSpyModuleContext *)moduleContext
{
    self = [super initWithModuleContext:moduleContext];
    if (self) {
        [self configUI:moduleContext];
    }
    return self;
}

#pragma mark - Set Up UI
- (void)configUI:(MBSpyModuleContext *)moduleContext {
    
}

@end
