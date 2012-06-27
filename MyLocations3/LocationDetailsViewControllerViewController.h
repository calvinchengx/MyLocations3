//
//  LocationDetailsViewControllerViewController.h
//  MyLocations3
//
//  Created by Calvin Cheng on 27/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LocationDetailsViewControllerViewController : UITableViewController
@property (strong, nonatomic) IBOutlet UITextView *descriptionTextView;
@property (strong, nonatomic) IBOutlet UILabel *categoryLabel;
@property (strong, nonatomic) IBOutlet UILabel *latitudeLabel;
@property (strong, nonatomic) IBOutlet UILabel *longitudeLabel;
@property (strong, nonatomic) IBOutlet UILabel *addressLabel;
@property (strong, nonatomic) IBOutlet UILabel *dateLabel;


- (IBAction)done:(id)sender;
- (IBAction)cancel:(id)sender;
@end
