//
//  ViewController.m
//  Brujula
//
//  Created by Developer Cymetria on 19/07/14.
//  Copyright (c) 2014 cymetria. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    _locationManager = [[CLLocationManager alloc] init];
    _locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    _locationManager.delegate = self;
    [_locationManager startUpdatingHeading];
    
}
-(void)locationManager:(CLLocationManager *)manager didUpdateHeading:(CLHeading *)newHeading{
    
    float oldRad = -manager.heading.trueHeading*M_PI/180.0f;
    float newRad = -newHeading.trueHeading*M_PI/180.0f;
    
    CABasicAnimation * theanimation;
    
    theanimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    theanimation.fromValue = [NSNumber numberWithFloat:oldRad];
    theanimation.toValue = [NSNumber numberWithFloat:newRad];
    theanimation.duration = 0.5f;
    
    [_compassImage.layer addAnimation:theanimation forKey:@"animateRotation"];
    _compassImage.transform = CGAffineTransformMakeRotation(newRad);

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
