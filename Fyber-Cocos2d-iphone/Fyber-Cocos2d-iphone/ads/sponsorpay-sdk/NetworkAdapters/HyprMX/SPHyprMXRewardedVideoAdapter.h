//
//  SPHyprMXRewardedVideoAdapter.m
//
//  Created on 22.05.14.
//  Copyright (c) 2014 Fyber. All rights reserved.
//

#import "SPRewardedVideoNetworkAdapter.h"
#import "SPHyprMXNetwork.h"

/**
 Implementation of HyprMX network for Rewarded Video demand
 
 ## Version compatibility
 
 - Adapter version: 2.1.2
 - Fyber SDK version: 7.0.3
 - HyprMX SDK version: 18
 
 */

@interface SPHyprMXRewardedVideoAdapter : NSObject <SPRewardedVideoNetworkAdapter>

@property (nonatomic, weak) SPHyprMXNetwork *network;

@end

