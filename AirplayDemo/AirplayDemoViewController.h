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

#if PRAGMA_ONCE
#pragma once
#endif


@interface AirplayDemoViewController : UITableViewController <UITableViewDelegate, UITableViewDataSource> {
    NSMutableArray *items;
}

@end
#endif