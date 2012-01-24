//
//  AirplayDemoAppDelegate.m
//  AirplayDemo
//
//  Created by Dan Zinngrabe on 1/22/12.
//  Copyright 2012 quellish.org. All rights reserved.
//

#import "AirplayDemoAppDelegate.h"

@interface AirplayDemoAppDelegate ()
- (UIWindow *)  createWindowForScreen:(UIScreen *)screen;
- (void)        addViewController:(UIViewController *)controller toWindow:(UIWindow *)window;
- (void)        screenDidConnect:(NSNotification *) notification;
- (void)        screenDidDisconnect:(NSNotification *) notification;
@end

@implementation AirplayDemoAppDelegate

@synthesize windows;

#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    UIWindow    *_window    = nil;
    NSArray     *_screens   = nil;
    
    windows = [[NSMutableArray alloc] init];
    
    _screens = [UIScreen screens];
    for (UIScreen *_screen in _screens){
        AirplayDemoViewController *_viewController = nil;
        
        _viewController = [[AirplayDemoViewController alloc] init];
        _window = [self createWindowForScreen:_screen];
        
        [self addViewController:_viewController toWindow:_window];
        [_viewController release];
        _viewController = nil;
        
        // If you don't do this here, you will get the "Applications are expected to have a root view controller" message.
        if (_screen == [UIScreen mainScreen]){
            [_window makeKeyAndVisible];
        }
        
    }
    
    // Register for notification
    [[NSNotificationCenter defaultCenter] addObserver:self
											 selector:@selector(screenDidConnect:)
												 name:UIScreenDidConnectNotification 
											   object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
											 selector:@selector(screenDidDisconnect:)
												 name:UIScreenDidDisconnectNotification 
											   object:nil];
    return YES;
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Unregister for notifications
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIScreenDidConnectNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIScreenDidDisconnectNotification object:nil];
}

#pragma mark -
#pragma mark Memory management

- (void)dealloc {
    [windows release];
    windows = nil;
    [super dealloc];
}

#pragma mark -
#pragma mark Private methods

- (UIWindow *) createWindowForScreen:(UIScreen *)screen {
    UIWindow    *_window    = nil;
    
    // Do we already have a window for this screen?
    for (UIWindow *window in self.windows){
        if (window.screen == screen){
            _window = window;
        }
    }
    // Still nil? Create a new one.
    if (_window == nil){
        _window = [[[UIWindow alloc] initWithFrame:[screen bounds]] autorelease];
        [_window setScreen:screen];
        [self.windows addObject:_window];
    }

    return _window;
}

- (void) addViewController:(UIViewController *)controller toWindow:(UIWindow *)window {
    [window setRootViewController:controller];
    [window setHidden:NO];
}

- (void) screenDidConnect:(NSNotification *) notification {
    UIScreen                    *_screen            = nil;
    UIWindow                    *_window            = nil;
    AirplayDemoViewController   *_viewController    = nil;
    
    NSLog(@"Screen connected");
    _screen = [notification object];
    
    // Get a window for it
    _viewController = [[AirplayDemoViewController alloc] init];
    _window = [self createWindowForScreen:_screen];
    
    // Add the view controller to it
    // This view controller does not do anything special, just presents a view that tells us
    // what screen we're on
    [self addViewController:_viewController toWindow:_window];
    [_viewController release];
}

- (void) screenDidDisconnect:(NSNotification *) notification {
    UIScreen    *_screen    = nil;
    
    NSLog(@"Screen disconnected");
    _screen = [notification object];
    
    // Find any window attached to this screen, remove it from our window list, and release it.
    for (UIWindow *_window in self.windows){
        if (_window.screen == _screen){
            NSUInteger windowIndex = [self.windows indexOfObject:_window];
            [self.windows removeObjectAtIndex:windowIndex];
            // If it wasn't autorelease, you would deallocate it here.
            _window = nil;
        }
    }
    return;
}

@end
