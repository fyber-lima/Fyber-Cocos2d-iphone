//
//  SPErrorManager.m
//  SponsorPaySDK
//
//  Created by tito on 25/11/14.
//  Copyright (c) 2014 SponsorPay. All rights reserved.
//

#import "SPErrorManager.h"


NSString *const SPErrorAlertTitle = @"Error";
NSString *const SPErrorAlertCancelTitle = @"OK";

NSString *const SPErrorMessageNetworkNoConnection = @"The Internet connection appears to be offline";

NSString *const SPErrorMessageRewardedVideoLoading = @"An error has occured while trying to load the video";
NSString *const SPErrorMessageRewardedVideoPlaying = @"An error has occured while playing the video";


static BOOL _showingAlert = NO;
static SPAlertViewDismissBlock _dismiss = nil;


@implementation SPErrorManager

#pragma mark - Public

+ (UIAlertView *)showAlertWithError:(SPError *)error dismiss:(SPAlertViewDismissBlock)dismiss
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:NSLocalizedString(SPErrorAlertTitle, nil)
                                                        message:error.message
                                                       delegate:self
                                              cancelButtonTitle:NSLocalizedString(SPErrorAlertCancelTitle, nil)
                                              otherButtonTitles:nil];
    alertView.tag = error.code;

    return [[self class] show:alertView dismiss:dismiss];
}


+ (UIAlertView *)showWarningWithTitle:(NSString *)title message:(NSString *)message cancelTitle:(NSString *)cancelTitle otherTitles:(NSString *)otherTitles dismiss:(SPAlertViewDismissBlock)dismiss
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:NSLocalizedString(title, nil)
                                                        message:message
                                                       delegate:self
                                              cancelButtonTitle:NSLocalizedString(cancelTitle, nil)
                                              otherButtonTitles:NSLocalizedString(otherTitles, nil), nil];

    return [[self class] show:alertView dismiss:dismiss];
}


+ (UIAlertView *)showAlertForNoConnectionAndDismiss:(SPAlertViewDismissBlock)dismiss
{
    SPError *error = [[SPError alloc] initWithTitle:SPErrorAlertTitle message:SPErrorMessageNetworkNoConnection code:SPErrorCodeNetworkNoConnection];
    return [[self class] showAlertWithError:error dismiss:dismiss];
}


#pragma mark - Private

+ (UIAlertView *)show:(UIAlertView *)alertView dismiss:(SPAlertViewDismissBlock)dismiss
{
    // Prevents from showing two alert views on top of each other because that's just gross
    if (!_showingAlert) {
        _dismiss = [dismiss copy];

        [alertView show];

        _showingAlert = YES;
    }

    return alertView;
}


#pragma mark - UIAlertViewDelegate

+ (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (_dismiss) {
        _dismiss(alertView, buttonIndex);
        _dismiss = nil;
    }

    _showingAlert = NO;
}

@end
