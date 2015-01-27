//
//  SPError.h
//  SponsorPaySDK
//
//  Created by tito on 25/11/14.
//  Copyright (c) 2014 SponsorPay. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef NS_ENUM(NSInteger, SPErrorCode) {
    SPErrorCodeUnkownError          = 0000,

    SPErrorCodeNetworkGeneric       = 1000,
    SPErrorCodeNetworkNoConnection  = 1001,

    SPErrorCodeRewardedVideoGeneric = 2000,
    SPErrorCodeRewardedVideoLoading = 2001,
    SPErrorCodeRewardedVideoPlaying = 2002,
//
//    SPErrorCodeInterstitial = 3000,
//    SPErrorCodeInterstitial = 3001,
//    SPErrorCodeInterstitial = 3002,
//
//    SPErrorCodeOfferWall = 4000,
    SPErrorCodeOfferWallLoading = 4001,
//    SPErrorCodeOfferWall = 4002,
//    SPErrorCodeOfferWall = 4003,
//
//    SPErrorCodeVCS = 5000,
//    SPErrorCodeVCS = 5001,
//    SPErrorCodeVCS = 5002,
//    SPErrorCodeVCS = 5003,
//    SPErrorCodeVCS = 5004,

    SPErrorCodeExternalGeneric = 9000,
    SPErrorCodeExternalStoreKit = 9001
};


@interface SPError : NSObject

@property (nonatomic, strong, readonly) NSString *title;
@property (nonatomic, strong, readonly) NSString *message;
@property (nonatomic, assign, readonly) SPErrorCode code;

- (id)initWithError:(NSError *)error code:(SPErrorCode)code;
- (id)initWithTitle:(NSString *)title message:(NSString *)message code:(SPErrorCode)code;

@end
