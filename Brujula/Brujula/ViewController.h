//
//  ViewController.h
//  Brujula
//
//  Created by Developer Cymetria on 19/07/14.
//  Copyright (c) 2014 cymetria. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <QuartzCore/QuartzCore.h>

@interface ViewController : UIViewController <CLLocationManagerDelegate>

@property CLLocationManager * locationManager;

@property (strong, nonatomic) IBOutlet UIImageView *compassImage;

@end
