//
//  AppDelegate.m
//  Fyber-Cocos2d-iphone
//
//  Created by Robert Segal on 2015-01-25.
//  Copyright (c) 2015 Get Set Games Inc. All rights reserved.
//

#import "AppDelegate.h"
#import "cocos2d.h"
#import "SponsorPaySDK.h"

#import "AdButtonLayer.h"
#import "RootViewController.h"
#import "RootNavigationController.h"
#import "GSGAdManager.h"

#define kGSGEAGLViewTag 102039

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [SponsorPaySDK setLoggingLevel:SPLogLevelVerbose];
    // Override point for customization after application launch.
    
//    sceneScale = 1;
    //windowExternal = [[UIWindow alloc] initWithFrame:CGRectMake(0,0,0,0)];
    
  //  originalBounds = [[UIScreen mainScreen] bounds];
    
    //window = [[UIWindow alloc] initWithFrame:originalBounds];
    
    if( ! [CCDirector setDirectorType:kCCDirectorTypeDisplayLink] )
        [CCDirector setDirectorType:kCCDirectorTypeNSTimer];
    
    CCDirector *dir = [CCDirector sharedDirector];
//    dir.projectionDelegate = self;
  //  [dir setProjection:kCCDirectorProjectionCustom];
    
#if GAME_AUTOROTATION == kGameAutorotationUIViewController
    [dir setDeviceOrientation:kCCDeviceOrientationPortrait];
#else
    [dir setDeviceOrientation:kCCDeviceOrientationLandscapeLeft];
#endif
    //	[dir setDisplayFPS:YES];
    
#if GSG_FPS_60
    [dir setAnimationInterval:1.0/60];
#elif GSG_FPS_30
    [dir setAnimationInterval:1.0/30];
#else
    [dir setAnimationInterval:1.0/30];
#endif
    
    EAGLView *glView = [EAGLView viewWithFrame:[_window bounds]
                            pixelFormat:kEAGLColorFormatRGB565
                            depthFormat:0
              ];
    
    glView.tag = kGSGEAGLViewTag;
    
    [glView setMultipleTouchEnabled:NO];
    
    [dir setOpenGLView:glView];
    
//    if( ! [dir enableRetinaDisplay:![[GSGRuntimeTools instance] hasPlatformDescription:GSGPlatform_model_iTouch_4G]] )
//        CCLOG(@"Retina Display Not supported");
    
    RootViewController *viewController = [[RootViewController alloc] initWithNibName:nil bundle:nil];
    viewController.wantsFullScreenLayout = YES;
    
//#if INCLUDE_RUNTIME_TOOLS == 1
//    statsWindow                = [[StatsWindow alloc] initWithNibName:@"StatsWindow" bundle:nil];
//    statsWindow.view.hidden    = YES;
//    statsWindow.view.center    = CGPointMake(statsWindow.view.frame.size.width / 2.0f, statsWindow.view.frame.size.height / 2.0f);
//    glView.autoresizesSubviews = NO;
//    
//    [statsWindow showHideHUD];
//    
//    [glView addSubview:statsWindow.view];
//#endif
    
    RootNavigationController *navigationController = [[RootNavigationController alloc] initWithRootViewController:viewController];
    navigationController.navigationBar.hidden = YES;
//    navigationController.delegate = self;
    
    [viewController setView:glView];
    
    if ([_window respondsToSelector:@selector(setRootViewController:)]) {
        [_window setRootViewController:navigationController];
    }
    else {
        [_window addSubview:navigationController.view];
    }
    
    [_window makeKeyAndVisible];
    
//    initialized = YES;
    
    
    [[GSGAdManager sharedInstance] initializeWithView:viewController andNewsDelegate:nil andIapProduct:nil];
    
    CCScene *sc = [CCScene node];
    
    [[CCDirector sharedDirector] pushScene:sc];

    AdProductConfig *config = [[AdProductConfig alloc] init];
    config.orderList = @[@"fyber"];
    
    AdButtonLayer *adLayer = [[AdButtonLayer alloc] initWithAdConfig:config
                                                      viewController:[[[UIViewController alloc] init] autorelease]
                                                navigationController:navigationController];
    
    
    CCMenuItemSprite *btn = [CCMenuItemSprite itemFromNormalSprite:[CCSprite spriteWithFile:@"button-store.png"]
                                                    selectedSprite:[CCSprite spriteWithFile:@"button-store.png"]
                                                             block:^(id sender)
                                                             {
                                                                 [adLayer buttonAction];
                                                             }];
    
    adLayer.button = btn;
    
    CCMenu *m = [CCMenu menuWithItems:btn, nil];
    
    [sc addChild:m];
    [sc addChild:adLayer];
    
    CCSprite *sprite = [CCSprite spriteWithFile:@"Redford-Promo.png"];
    
    [sc addChild:sprite];
    
    [sprite runAction:[CCRepeatForever actionWithAction:
                   [CCSequence actions:
                    [CCMoveTo actionWithDuration:3 position:ccp(0, 0)],
                    [CCMoveTo actionWithDuration:3 position:ccp(200, 200)],
                    [CCMoveTo actionWithDuration:3 position:ccp(100, 0)],
                    nil]]];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
