//
//  __APIManagerFileName__.h
//  APIManagers
//
//  Created by casa's script.
//  Copyright © __year__年 casa. All rights reserved.
//

#import <CTNetworking/CTNetworking.h>

extern NSString * const k__APIManagerFileName__ParamKey<#API param name#>;

@interface __APIManagerFileName__ : CTAPIBaseManager <CTAPIManager, CTPagableAPIManager>

@property (nonatomic, assign) NSInteger pageSize;
@property (nonatomic, assign, readonly) NSUInteger currentPageNumber;
@property (nonatomic, assign, readonly) BOOL isLastPage;

- (void)loadNextPage;

@end
