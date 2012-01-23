//
//  AirplayDemoAppDelegate.m
//  AirplayDemo
//
//  Created by Dan Zinngrabe on 1/22/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "AirplayDemoAppDelegate.h"

@interface AirplayDemoAppDelegate ()
- (UIWindow *) windowForScreen:(UIScreen *)screen;
@end

@implementation AirplayDemoAppDelegate

@synthesize windows;

#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    UIWindow *_window = nil;
    
    if (windows == nil){
        windows = [[NSMutableArray alloc] init ];
    }
    
    NSArray *_screens = [UIScreen screens];
    for (UIScreen *_screen in _screens){
        _window = [self windowForScreen:_screen];
        AirplayDemoViewController *_viewController = [[AirplayDemoViewController alloc] init];
        _window.rootViewController = _viewController;
        [_viewController release];
        [_window setScreen:_screen];
        _window.hidden = NO;
        if ([UIScreen mainScreen] == _screen){
            [_window makeKeyAndVisible];
        }
    }
    
    // Register for notification
    [[NSNotificationCenter defaultCenter] addObserver:self
											 selector:@selector(screenConnected:)
												 name:UIScreenDidConnectNotification 
											   object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
											 selector:@selector(screenDisconnected:)
												 name:UIScreenDidDisconnectNotification 
											   object:nil];
    return YES;
}

#pragma mark -
#pragma mark Memory management

- (void)dealloc {
    for (UIWindow *_window in self.windows){
        [_window release];
        _window = nil;
    }
    [windows release];
    [super dealloc];
}

#pragma mark -
#pragma mark Private methods

- (UIWindow *) windowForScreen:(UIScreen *)screen {
    UIWindow *_window = nil;
    _window = [[UIWindow alloc] initWithFrame:[screen bounds]];
    // Obviously, this will grow each time a screen is added or removed.
    // More intelligent management of the windows is required for your application
    [self.windows addObject:_window];

    return _window;
}

- (void) screenConnected:(NSNotification *) notification {
    NSLog(@"Screen connected");
    UIScreen *_screen = nil;
    UIWindow *_window = nil;
    
    _screen = [notification object];
    
    // Get a window for it
    _window = [self windowForScreen:_screen];
    
    // Attach a view controller and set up the window
    AirplayDemoViewController *_viewController = [[AirplayDemoViewController alloc] init];
    _window.rootViewController = _viewController;
    [_viewController release];
    [_window setScreen:_screen];
    _window.hidden = NO;
    // If it's the main screen, set it as key
    if ([UIScreen mainScreen] == _screen){
        [_window makeKeyAndVisible];
    }
}

- (void) screenDisconnected:(NSNotification *) notification {
    UIScreen *_screen = nil;    
    _screen = [notification object];
    
    // Ideally, dispose of any attached window 
    NSLog(@"Screen disconnected");
}

@end
