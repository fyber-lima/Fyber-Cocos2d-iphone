//
//  SPAdvertiserManager.m
//  SponsorPay iOS SDK
//
//  Copyright 2011-2013 SponsorPay. All rights reserved.
//

#import <UIKit/UIDevice.h>
#import "SPAdvertiserManager.h"
#import "SPCallbackSendingOperation.h"
#import "SPURLGenerator.h"
#import "SPAppIdValidator.h"
#import "SPLogger.h"
#import "SPCredentials.h"
#import "SPPersistence.h"

static const NSInteger SPMaxConcurrentCallbackOperations = 1;

@interface SPAdvertiserManager ()

@property (strong) NSString *appId;

- initWithAppId:(NSString *)appId;
- (void)sendCallbackWithAction:(NSString *)actionId userId:(NSString *)userId;

@end

@implementation SPAdvertiserManager

#pragma mark - Initialization and deallocation

+ (SPAdvertiserManager *)advertiserManagerForAppId:(NSString *)appId
{
    static NSMutableDictionary *advertiserManagers;

    @synchronized(self)
    {
        if (!advertiserManagers) {
            advertiserManagers = [[NSMutableDictionary alloc] initWithCapacity:2];
        }

        if (!advertiserManagers[appId]) {
            SPAdvertiserManager *adManagerForThisAppId = [[self alloc] initWithAppId:appId];
            advertiserManagers[appId] = adManagerForThisAppId;
        }
    }

    return advertiserManagers[appId];
}

- (id)initWithAppId:(NSString *)appId
{
    self = [super init];

    if (self) {
        self.appId = appId;
    }

    return self;
}


#pragma mark - Advertiser callback delivery

- (void)reportOfferCompletedWithUserId:(NSString *)userId
{
    [SPAppIdValidator validateOrThrow:self.appId];
    [self sendCallbackWithAction:nil userId:userId];
}

- (void)reportActionCompleted:(NSString *)actionId
{
    [SPAppIdValidator validateOrThrow:self.appId];
    [self sendCallbackWithAction:actionId userId:nil];
}

- (void)sendCallbackWithAction:(NSString *)actionId userId:(NSString *)userId
{
    BOOL answerAlreadyReceived;
    SPNetworkOperationSuccessBlock callbackSuccessfulCompletionBlock;

    if (!actionId) {
        answerAlreadyReceived = [SPPersistence didAdvertiserCallbackSucceed];
        callbackSuccessfulCompletionBlock = ^(SPNetworkOperation *operation){
            [SPPersistence setDidAdvertiserCallbackSucceed:YES];
        };
    } else {
        answerAlreadyReceived = [SPPersistence didActionCallbackSucceedForActionId:actionId];
        callbackSuccessfulCompletionBlock = ^(SPNetworkOperation *operation){
            [SPPersistence setDidActionCallbackSucceed:YES
                                           forActionId:actionId];
        };
    }

    SPCredentials *credentials = [SPCredentials credentialsWithAppId:self.appId userId:userId securityToken:nil];

    SPCallbackSendingOperation *callbackOperation = [SPCallbackSendingOperation operationForCredentials:credentials
                                                                                               actionId:actionId
                                                                                         answerReceived:answerAlreadyReceived];

    callbackOperation.networkOperationSuccessBlock = callbackSuccessfulCompletionBlock;

    SPLogDebug(@"%@ scheduling callback sending operation from thread:%@", self, [NSThread currentThread]);
    [callbackOperation start];
}

#pragma mark -

- (NSString *)description
{
    return [NSString stringWithFormat:@"%@ {appID = %@}", [super description], self.appId];
}

@end
