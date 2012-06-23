//
//  LocationsFirstViewController.m
//  MyLocations3
//
//  Created by Calvin Cheng on 23/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CurrentLocationViewController.h"

@interface CurrentLocationViewController ()

@end

@implementation CurrentLocationViewController {
    CLLocationManager *locationManager;
}

@synthesize getButton;
@synthesize tagButton;
@synthesize messageLabel;
@synthesize longitudeLabel;
@synthesize latitudeLabel;
@synthesize addressLabel;

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if ((self = [super initWithCoder:aDecoder])) {
        locationManager = [[CLLocationManager alloc] init];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setMessageLabel:nil];
    [self setLongitudeLabel:nil];
    [self setLatitudeLabel:nil];
    [self setAddressLabel:nil];
    [self setGetButton:nil];
    [self setTagButton:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)getLocation:(id)sender {
}
@end
