//
//  __Prefix__RoomViewController.m
//  __Prefix__Room-iOS
//
//  Created by MOMO on __year__.
//

#import "__Prefix__RoomViewController.h"
#import <MDNavigationTransition/MDNavigationTransition.h>
#import <MBCommonModuleMediator/MBCommonModuleMediator.h>

@interface __Prefix__RoomViewController () <MDNavigationBarAppearanceDelegate, MDPopGestureRecognizerDelegate>

@end

@implementation __Prefix__RoomViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    UIApplication.sharedApplication.idleTimerDisabled = YES;
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    UIApplication.sharedApplication.idleTimerDisabled = YES;
}

#pragma mark - MDNavigationBarAppearanceDelegate

- (UINavigationBar *)md_CustomNavigationBar
{
    return nil;
}

#pragma mark - MDPopGestureRecognizerDelegate

- (BOOL)md_popGestureRecognizerEnabled
{
    return NO;
}

@end
