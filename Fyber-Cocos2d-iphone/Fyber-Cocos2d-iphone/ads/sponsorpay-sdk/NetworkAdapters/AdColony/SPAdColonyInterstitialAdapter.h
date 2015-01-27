//
//  SPAdColonyInterstitialAdapter.m
//
//  Created on 30.06.2014.
//  Copyright (c) 2014 Fyber. All rights reserved.
//

#import "SPAdColonyNetwork.h"
#import <AdColony/AdColony.h>

@class SPAdColonyInterstitialAdapter;

/**
 Implementation of AdColony network for interstitial demand
 
 ## Version compatibility
 
 - Adapter version: 2.1.2
 - Fyber SDK version: 7.0.2
 - AdColony SDK version: 2.4.13
 
 */

@interface SPAdColonyInterstitialAdapter : NSObject <SPInterstitialNetworkAdapter, AdColonyAdDelegate>

@property (nonatomic, weak) SPAdColonyNetwork *network;

@end
