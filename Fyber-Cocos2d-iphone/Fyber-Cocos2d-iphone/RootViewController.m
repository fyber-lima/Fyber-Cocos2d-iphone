//
//  RootViewController.m
//  Fyber-Cocos2d-iphone
//
//  Created by Robert Segal on 2015-01-25.
//  Copyright (c) 2015 Get Set Games Inc. All rights reserved.
//

#import "RootViewController.h"
#import "AppDelegate.h"

@implementation RootViewController




// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    
    //
    // There are 2 ways to support auto-rotation:
    //  - The OpenGL / cocos2d way
    //     - Faster, but doesn't rotate the UIKit objects
    //  - The ViewController way
    //    - A bit slower, but the UiKit objects are placed in the right place
    //
    
#if GAME_AUTOROTATION==kGameAutorotationNone
    //
    // EAGLView won't be autorotated.
    // Since this method should return YES in at least 1 orientation,
    // we return YES only in the Portrait orientation
    //
    return ( interfaceOrientation == UIInterfaceOrientationPortrait );
    
#elif GAME_AUTOROTATION==kGameAutorotationCCDirector
    //
    // EAGLView will be rotated by cocos2d
    //
    // Sample: Autorotate only in landscape mode
    //
    if( interfaceOrientation == UIInterfaceOrientationLandscapeLeft ) {
        [[CCDirector sharedDirector] setDeviceOrientation: kCCDeviceOrientationLandscapeRight];
    } else if( interfaceOrientation == UIInterfaceOrientationLandscapeRight) {
        [[CCDirector sharedDirector] setDeviceOrientation: kCCDeviceOrientationLandscapeLeft];
    }
    
    // Since this method should return YES in at least 1 orientation,
    // we return YES only in the Portrait orientation
    return ( interfaceOrientation == UIInterfaceOrientationPortrait );
#elif GAME_AUTOROTATION == kGameAutorotationUIViewController
    //
    // EAGLView will be rotated by the UIViewController
    //
    // Sample: Autorotate only in landscpe mode
    //
    // return YES for the supported orientations
    
    UIInterfaceOrientation myOrientations[2] = { UIInterfaceOrientationLandscapeLeft, UIInterfaceOrientationLandscapeRight };
    
    return [OpenFeint shouldAutorotateToInterfaceOrientation:interfaceOrientation withSupportedOrientations:myOrientations andCount:2];
#else
#error Unknown value in GAME_AUTOROTATION
    
#endif // GAME_AUTOROTATION
    
    // Shold not happen
    return NO;
}

// iOS > 6.0 //
- (NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskLandscape; // hardcoded for now :( // -Dario //
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
    AppDelegate *d = [UIApplication sharedApplication].delegate;
    
    if ( (d.window.rootViewController.interfaceOrientation == UIInterfaceOrientationLandscapeRight || d.window.rootViewController.interfaceOrientation == UIInterfaceOrientationLandscapeLeft))
    {
        return d.window.rootViewController.interfaceOrientation;
    }
    return UIInterfaceOrientationLandscapeRight;
}

-(BOOL) shouldAutorotate
{
    return YES;
}
/////////////////

- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation
{
    //[OpenFeint setDashboardOrientation:self.interfaceOrientation];
    [super didRotateFromInterfaceOrientation:fromInterfaceOrientation];
}

//
// This callback only will be called when GAME_AUTOROTATION == kGameAutorotationUIViewController
//

/*
 #if GAME_AUTOROTATION == kGameAutorotationUIViewController
 -(void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
 {
 
 
 // Reference bug 914 for autorotation fix.  Also details in Cocos2D wiki...
 //
 //   http://www.cocos2d-iphone.org/wiki/doku.php/prog_guide:autorotation
 //
 
 CGRect rect = CGRectMake(0,0,0,0);
	if (UIInterfaceOrientationIsPortrait(toInterfaceOrientation) ) {
 if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
 rect = CGRectMake(0, 0, 768, 1024);
 else
 rect = CGRectMake(0, 0, 320, [GSGCocos2d isDeviceWideScreen] ? [GSGCocos2d wideScreenWidth] : 480);
 
	} else if( UIInterfaceOrientationIsLandscape(toInterfaceOrientation) ) {
 if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
 rect = CGRectMake(0, 0, 1024, 768);
 else
 rect = CGRectMake(0, 0, [GSGCocos2d isDeviceWideScreen] ? [GSGCocos2d wideScreenWidth] : 480, 320);
	} else
 NSAssert(NO, @"Invalid orientation");
 
	[[CCDirector sharedDirector] openGLView].frame = rect;
 
 if ([GSGCocos2d sharedInstance].initialized) {
 [[Analytics sharedInstance] trackPage:@"/app/OrientationChanged/"
 ParamValue:toInterfaceOrientation == UIInterfaceOrientationLandscapeLeft ? @"Left" : @"Right"
 ParamKey:@"Orientation"];
 }
 
 
 }
 
 #endif // GAME_AUTOROTATION == kGameAutorotationUIViewController
 */

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    [super touchesBegan:touches withEvent:event];
}


- (void)dealloc {
    [super dealloc];
}



//- (void)viewDidLoad {
//    [super viewDidLoad];
//    // Do any additional setup after loading the view.
//}
//
//- (void)didReceiveMemoryWarning {
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
