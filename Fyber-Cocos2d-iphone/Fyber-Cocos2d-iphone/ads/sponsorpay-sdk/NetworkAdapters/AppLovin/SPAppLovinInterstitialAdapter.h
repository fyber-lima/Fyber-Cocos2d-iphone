//
//  SPAppLovingInterstitialAdapter.h
//  SponsorPayTestApp
//
//  Copyright (c) 2013 Fyber. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SPInterstitialNetworkAdapter.h"
#import "ALSdk.h"

/**
 Implementation of AppLovin network for interstitials demand
 
 ## Version compatibility
 
 - Adapter version: 2.2.0
 - Fyber SDK version: 7.0.2
 - AppLovin SDK version: 2.5.3
 
 */

@class SPAppLovinNetwork;

@interface SPAppLovinInterstitialAdapter : NSObject<SPInterstitialNetworkAdapter, ALAdLoadDelegate, ALAdDisplayDelegate>

@property (weak, nonatomic) SPAppLovinNetwork *network;

@end
