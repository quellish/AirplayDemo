//
//  AirplayDemoViewController.m
//  AirplayDemo
//
//  Created by Dan Zinngrabe on 1/22/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "AirplayDemoViewController.h"

@interface AirplayDemoViewController()
- (NSUInteger) screenNumber;
@end

@implementation AirplayDemoViewController

- (void)viewDidAppear:(BOOL)animated {
    CALayer         *layer      = nil;
    UIWindow        *_window    = nil;
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    // Set up the layer that draws our text.
    textLayer = [[CATextLayer alloc] init];
    textLayer.foregroundColor = [[UIColor blackColor] CGColor];
    textLayer.frame = [[self view] bounds];
    textLayer.alignmentMode = kCAAlignmentCenter;
    [textLayer setFont:@"Courier"];
    
    // Set the text.
    NSUInteger screenNumber = [self screenNumber];
    textLayer.string = [NSString stringWithFormat: @"%d", screenNumber];
    
    layer = [[self view] layer];

    [layer addSublayer:textLayer];
    // Triple it!
    _window = [[self view] window];
    CGFloat scale = [[_window screen] scale];
    [layer setRasterizationScale:scale];
    [layer setShouldRasterize:YES];
}

- (void) dealloc {
    [textLayer release];
    textLayer = nil;
    [super dealloc];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (NSUInteger) screenNumber {
    NSUInteger  result      = 1;
    UIWindow    *_window    = nil;
    UIScreen    *_screen    = nil;
    NSArray     *_screens   = nil;
    
    _screens = [UIScreen screens];
    
    if ([_screens count] > 1){
        _window = [[self view] window];
        _screen = [_window screen];
        if (_screen != nil){
            for(size_t i = 0; i < [_screens count]; ++i){
                UIScreen *_currentScreen = [_screens objectAtIndex:i];
                if (_currentScreen == _screen){
                    result = i+1;
                }
            }
        }
    }
    return result;
}

@end