//
//  Fyber iOS SDK - AppLovin Adapter v.2.1.0
//
//  Copyright (c) 2014 Fyber. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SPBaseNetwork.h"

/**
 Network class in charge of integrating AppLovin library
 
 ## Version compatibility
 
 - Adapter version: 2.2.0
 - Fyber SDK version: 7.0.2
 - AppLovin SDK version: 2.5.3
 
 */

@class ALSdkSettings;

@interface SPAppLovinNetwork : SPBaseNetwork

@property (nonatomic, copy, readonly) NSString *apiKey;
@property (nonatomic, strong) ALSdkSettings *alSDKSettings;

@end
