//
//  AirplayDemoViewController.m
//  AirplayDemo
//
//  Created by Dan Zinngrabe on 1/22/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "AirplayDemoViewController.h"

@interface AirplayDemoViewController()

@end

@implementation AirplayDemoViewController


- (id)initWithStyle:(UITableViewStyle)style {
    self = [super initWithStyle:style];
    
	if(self != nil) {
		// Load data from a plist
        NSString *dataPath = nil;
        dataPath = [[NSBundle mainBundle ] pathForResource:@"Data" ofType:@"plist"];
        items = [[NSArray alloc  ] initWithContentsOfFile:dataPath];
        
    }
    return self;
}

- (void)dealloc
{
    [items release];
    items = nil;
    [super dealloc];
}


#pragma mark -
#pragma mark UITableViewDataSource

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return [items count];
}

#pragma mark -
#pragma mark UITableViewDelegate

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
	return 64.0;
}


- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell     *cell = nil;
    UIImage             *image = nil;
    
    cell = [tableView dequeueReusableCellWithIdentifier:@"AirplayDemoCell"];
    
	if(cell == nil){
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"AirplayDemoCell"] autorelease];
    }
	[[cell textLabel] setText:[items objectAtIndex:[indexPath row] ] ];
	return cell;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end