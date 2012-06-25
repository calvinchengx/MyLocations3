//
//  LocationsFirstViewController.m
//  MyLocations3
//
//  Created by Calvin Cheng on 23/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CurrentLocationViewController.h"

@interface CurrentLocationViewController ()
- (void)updateLabels;
@end

@implementation CurrentLocationViewController {
    CLLocationManager *locationManager;
    CLLocation *location;
    NSError *lastLocationError;
    BOOL updatingLocation;
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
	[self updateLabels];
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

- (IBAction)getLocation:(id)sender 
{
    locationManager.delegate = self;
    locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters;
    
    [locationManager startUpdatingLocation];
}

- (void)updateLabels
{
    if (location != nil) {
        self.messageLabel.text = @"GPS Coordinates";
        self.latitudeLabel.text = [NSString stringWithFormat:@"%.8f", location.coordinate.latitude];
        self.longitudeLabel.text = [NSString stringWithFormat:@"%.8f", location.coordinate.longitude];
        self.tagButton.hidden = NO;
    } else {
        self.messageLabel.text = @"Press the Button to Start";
        self.latitudeLabel.text = @"";
        self.longitudeLabel.text = @"";
        self.addressLabel.text = @"";
        self.tagButton.hidden = YES;
        
        NSString *statusMessage;
        if (lastLocationError != nil) {
            if ([lastLocationError.domain isEqualToString:kCLErrorDomain] && lastLocationError.code == kCLErrorDenied) {
                statusMessage = @"Location Services Disabled";
            } else {
                statusMessage = @"Error Getting Location";
            } 
        } else if (![CLLocationManager locationServicesEnabled]) {
            statusMessage = @"Location Services Disabled";
        } else if (updatingLocation) {
            statusMessage = @"Searching...";
        } else {
            statusMessage = @"Press the Button to Start";
        }
        
        self.messageLabel.text = statusMessage;
    }
}

- (void)stopLocationManager 
{
    if (updatingLocation) {
        [locationManager stopUpdatingLocation];
        locationManager.delegate = nil;
        updatingLocation = NO;
    }
}

#pragma mark - CLLocationManagerDelegate

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"didFailWithError %@", error);
    if (error.code == kCLErrorLocationUnknown) {
        return;
    }
    [self stopLocationManager];
    lastLocationError = error;
    
    [self updateLabels];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation

{
    NSLog(@"didUpdateToLocation %@", newLocation);
    location = newLocation;
    [self updateLabels];
}

@end
