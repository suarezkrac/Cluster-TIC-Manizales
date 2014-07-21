//
//  ViewController.m
//  Anotacion
//
//  Created by Developer Cymetria on 19/07/14.
//  Copyright (c) 2014 vivelab. All rights reserved.
//

#import "ViewController.h"
#import "MapPoint.h"
#import "FlagView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    _mapView.delegate = self;
    
   //BOGOTA
    CLLocationCoordinate2D coor1;
    coor1.latitude = 4.60971;
    coor1.longitude = -74.08175;
    MapPoint * punto1 = [[MapPoint alloc] initWithCoordinate:coor1 title:@"Bogota"];
    [_mapView addAnnotation:punto1];
   
    //MANIZALES
    CLLocationCoordinate2D coor2;
    coor2.latitude = 5.07;
    coor2.longitude = -75.52056;
    MapPoint * punto2 = [[MapPoint alloc] initWithCoordinate:coor2 title:@"Manizales"];
    [_mapView addAnnotation:punto2];
    
    //MEDELLIN
    CLLocationCoordinate2D coor3;
    coor3.latitude = 6.21667;
    coor3.longitude = -75.5667;
    MapPoint * punto3 = [[MapPoint alloc] initWithCoordinate:coor3 title:@"Medellin"];
    [_mapView addAnnotation:punto3];
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    MKCoordinateRegion region;
    
    //BOGOTA
    region.center.latitude = 4.60971;
    region.center.longitude = -74.08175;
    
    region.span.latitudeDelta = 5;
    region.span.longitudeDelta = 5;
    
    [_mapView setRegion:region animated:YES];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation{
    //METODO DEL ANNOTATION
    
    
    MKAnnotationView * anotationView;
    
    FlagView * viewFlag = [[[NSBundle mainBundle] loadNibNamed:@"FlagView" owner:self options:nil] objectAtIndex:0];
    
    
    anotationView = (MKAnnotationView*)viewFlag;
    
    CGRect anotationViewFrame = anotationView.frame;
    

    
    anotationView.centerOffset = CGPointMake(anotationViewFrame.size.width/2, -anotationViewFrame.size.height/2);
    
    return anotationView;
}
-(void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view{
    //METODO CUANDO SELECCIONO EL ANNOTATION

}

@end
