//
//  AirplayDemoAppDelegate.h
//  AirplayDemo
//
//  Created by Dan Zinngrabe on 1/22/12.
//  Copyright 2012 quellish.org. All rights reserved.
//

#ifndef __AIRPLAYDEMOAPPDELEGATE_H__
#define __AIRPLAYDEMOAPPDELEGATE_H__

#import <UIKit/UIKit.h>
#import "AirplayDemoViewController.h"

#if PRAGMA_ONCE
#pragma once
#endif

@class AirplayDemoViewController;

@interface AirplayDemoAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) NSMutableArray *windows;

@end
#endif


