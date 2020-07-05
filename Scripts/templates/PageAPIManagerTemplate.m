//
//  __APIManagerFileName__.m
//  APIManagers
//
//  Created by casa's script.
//  Copyright © __year__年 casa. All rights reserved.
//

#import "__APIManagerFileName__.h"
#import "CTMarvelService.h"

NSString * const k__APIManagerFileName__ParamKey<#API param name#> = @"<#API param name#>";

@interface __APIManagerFileName__ () <CTAPIManagerValidator>

@property (nonatomic, assign, readwrite) BOOL isFirstPage;
@property (nonatomic, assign, readwrite) BOOL isLastPage;
@property (nonatomic, assign, readwrite) NSUInteger pageNumber;
@property (nonatomic, strong, readwrite) NSString *errorMessage;

@end

@implementation __APIManagerFileName__

@synthesize errorMessage = _errorMessage;

#pragma mark - life cycle
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.validator = self;
        self.cachePolicy = __CachePolicy__;
        _pageSize = 10;
		_pageNumber = 0;
        _isFirstPage = YES;
        _isLastPage = NO;
    }
    return self;
}

#pragma mark - public methods
- (NSInteger)loadData
{
    [self cleanData];
    return [super loadData];
}

- (void)loadNextPage
{
    if (self.isLastPage) {
        if ([self.interceptor respondsToSelector:@selector(manager:didReceiveResponse:)]) {
            [self.interceptor manager:self didReceiveResponse:nil];
        }
        return;
    }

    if (!self.isLoading) {
        [super loadData];
    }
}

- (void)cleanData
{
    [super cleanData];
    self.isFirstPage = YES;
    self.pageNumber = 0;
}

- (NSDictionary *)reformParams:(NSDictionary *)params
{
    NSMutableDictionary *result = [params mutableCopy];
    if (result == nil) {
        result = [[NSMutableDictionary alloc] init];
    }

    if (result[@"limit"] == nil) {
        result[@"limit"] = @(self.pageSize);
    } else {
        self.pageSize = [result[@"limit"] integerValue];
    }

    if (result[@"offset"] == nil) {
        if (self.isFirstPage == NO) {
            result[@"offset"] = @(self.pageNumber * self.pageSize);
        } else {
            result[@"offset"] = @(0);
        }
    } else {
        self.pageNumber = [result[@"offset"] unsignedIntegerValue] / self.pageSize;
    }

    return result;
}

#pragma mark - interceptors
- (BOOL)beforePerformSuccessWithResponse:(CTURLResponse *)response
{
    self.isFirstPage = NO;
    NSInteger totalPageCount = ceil([response.content[@"data"][@"total"] doubleValue]/(double)self.pageSize);
    if (self.pageNumber == totalPageCount - 1) {
        self.isLastPage = YES;
    } else {
        self.isLastPage = NO;
    }
    self.pageNumber++;
    return [super beforePerformSuccessWithResponse:response];
}

- (BOOL)beforePerformFailWithResponse:(CTURLResponse *)response
{
    [super beforePerformFailWithResponse:response];
    self.errorMessage = response.content[@"status"];
    return YES;
}

#pragma mark - CTAPIManager
- (NSString *)methodName
{
    return @"__MethodName__";
}

- (NSString *)serviceIdentifier
{
    return CTServiceIdentifierMarvel;
}

- (CTAPIManagerRequestType)requestType
{
    return CTAPIManagerRequestTypeGet;
}

#pragma mark - CTAPIManagerValidator
- (CTAPIManagerErrorType)manager:(CTAPIBaseManager *)manager isCorrectWithParamsData:(NSDictionary *)data
{
    return CTAPIManagerErrorTypeNoError;
}

- (CTAPIManagerErrorType)manager:(CTAPIBaseManager *)manager isCorrectWithCallBackData:(NSDictionary *)data
{
    return CTAPIManagerErrorTypeNoError;
}

#pragma mark - getters and setters
- (NSUInteger)currentPageNumber
{
    return self.pageNumber;
}

@end
