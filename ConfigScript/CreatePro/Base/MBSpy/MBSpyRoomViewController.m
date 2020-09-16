//
//  MBSpyRoomViewController.m
//  MBSpyRoom-iOS
//
//  Created by MOMO on 2020.
//

#import "MBSpyRoomViewController.h"
#import <MDNavigationTransition/MDNavigationTransition.h>
#import <MBCommonModuleMediator/MBCommonModuleMediator.h>

@interface MBSpyRoomViewController () <MDNavigationBarAppearanceDelegate, MDPopGestureRecognizerDelegate>

@end

@implementation MBSpyRoomViewController

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
