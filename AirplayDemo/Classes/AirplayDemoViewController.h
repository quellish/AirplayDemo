//
//  AirplayDemoViewController.h
//  AirplayDemo
//
//  Created by Dan Zinngrabe on 1/22/12.
//  Copyright 2012 quellish.org. All rights reserved.
//

#ifndef __AIRPLAYDEMOVIEWCONTROLLER_H__
#define __AIRPLAYDEMOVIEWCONTROLLER_H__

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
