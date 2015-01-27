//
//  SPError.m
//  SponsorPaySDK
//
//  Created by tito on 25/11/14.
//  Copyright (c) 2014 SponsorPay. All rights reserved.
//

#import "SPError.h"


@interface SPError ()

@property (nonatomic, strong, readwrite) NSString *title;
@property (nonatomic, strong, readwrite) NSString *message;
@property (nonatomic, assign, readwrite) SPErrorCode code;

@end


@implementation SPError


#pragma mark - Life Cycle

- (id)initWithError:(NSError *)error code:(SPErrorCode)code
{
    return [self initWithTitle:@"Error" message:error.localizedDescription code:code];
}

- (id)initWithTitle:(NSString *)title message:(NSString *)message code:(SPErrorCode)code
{
    self = [super init];

    if (self) {
        self.title = NSLocalizedString(title, nil);
        self.message = NSLocalizedString(message, nil);
        self.code = code;
    }

    return self;
}

@end
