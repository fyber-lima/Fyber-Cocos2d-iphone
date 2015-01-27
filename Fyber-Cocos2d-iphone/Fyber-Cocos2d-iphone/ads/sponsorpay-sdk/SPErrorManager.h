//
//  SPErrorManager.h
//  SponsorPaySDK
//
//  Created by tito on 25/11/14.
//  Copyright (c) 2014 SponsorPay. All rights reserved.
//

#import "SPError.h"
#import <UIKit/UIKit.h>


extern NSString *const SPErrorAlertTitle;
extern NSString *const SPErrorAlertCancelTitle;

extern NSString *const SPErrorMessageNetworkNoConnection;

extern NSString *const SPErrorMessageRewardedVideoLoading;
extern NSString *const SPErrorMessageRewardedVideoPlaying;

typedef void (^SPAlertViewDismissBlock)(UIAlertView *alertView, NSInteger buttonIndex);


@interface SPErrorManager : NSObject<UIAlertViewDelegate>

// Generic

+ (UIAlertView *)showAlertWithError:(SPError *)error dismiss:(SPAlertViewDismissBlock)dismiss;

+ (UIAlertView *)showWarningWithTitle:(NSString *)title
                     message:(NSString *)message
                 cancelTitle:(NSString *)cancelTitle
                 otherTitles:(NSString *)otherTitles
                     dismiss:(SPAlertViewDismissBlock)dismiss;


// Particular Cases

+ (UIAlertView *)showAlertForNoConnectionAndDismiss:(SPAlertViewDismissBlock)dismiss;

@end
