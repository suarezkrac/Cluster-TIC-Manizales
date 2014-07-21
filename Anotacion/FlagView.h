//
//  FlagView.h
//  Anotacion
//
//  Created by Developer Cymetria on 19/07/14.
//  Copyright (c) 2014 vivelab. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface FlagView : MKAnnotationView

@property (strong, nonatomic) IBOutlet UILabel *calloutLabel;

@end
