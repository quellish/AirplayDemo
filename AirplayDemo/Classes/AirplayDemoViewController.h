//
//  AirplayDemoViewController.h
//  AirplayDemo
//
//  Created by Dan Zinngrabe on 1/22/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#ifndef AirplayDemoViewController_h__
#define AirplayDemoViewController_h__

#import <UIKit/UIKit.h>
#import <QuartzCore/CoreAnimation.h>

#if PRAGMA_ONCE
#pragma once
#endif

@class CATextLayer;


@interface AirplayDemoViewController : UIViewController {
    CATextLayer     *textLayer;
}

@end
#endif