//
//  RootNavigationController.m
//  Fyber-Cocos2d-iphone
//
//  Created by Robert Segal on 2015-01-25.
//  Copyright (c) 2015 Get Set Games Inc. All rights reserved.
//

#import "RootNavigationController.h"
#import "AppDelegate.h"

@interface RootNavigationController ()

@end

@implementation RootNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


// iOS < 6.0 //
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    return (toInterfaceOrientation == UIInterfaceOrientationLandscapeLeft || toInterfaceOrientation == UIInterfaceOrientationLandscapeRight);
}

// iOS > 6.0 //
-(NSUInteger)supportedInterfaceOrientations{
    return UIInterfaceOrientationMaskLandscape;
}

- (BOOL)shouldAutorotate {
    return YES;
}

-(UIInterfaceOrientation) preferredInterfaceOrientationForPresentation
{
    AppDelegate *d = [UIApplication sharedApplication].delegate;
    
    if ( (d.window.rootViewController.interfaceOrientation == UIInterfaceOrientationLandscapeRight ||
          d.window.rootViewController.interfaceOrientation == UIInterfaceOrientationLandscapeLeft) )
    {
        return d.window.rootViewController.interfaceOrientation;
    }
    return UIInterfaceOrientationLandscapeRight;
}




@end
