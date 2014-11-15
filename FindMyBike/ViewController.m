//
//  ViewController.m
//  FindMyBike
//
//  Created by Tom Bakker on 14-11-14.
//  Copyright (c) 2014 Tom Bakker. All rights reserved.
//

#import "ViewController.h"
#import <MapKit/MapKit.h>

@interface ViewController ()

@property (strong, nonatomic) CLLocationManager *locationManager;

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _mapView.delegate = self;
    
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    
    if(IS_OS_8_OR_LATER) {
        [self.locationManager requestWhenInUseAuthorization];
        [self.locationManager startUpdatingLocation];
    }
    [self.mapView setShowsUserLocation:YES];
    [self.mapView setUserTrackingMode:MKUserTrackingModeNone animated:YES];
    
    MKCoordinateRegion region = { { 0.0, 0.0 }, { 0.0, 0.0 } };
    region.center.latitude = self.locationManager.location.coordinate.latitude;
    region.center.longitude = self.locationManager.location.coordinate.longitude;
    region.span.latitudeDelta = 0.0187f;
    region.span.longitudeDelta = 0.0137f;
    [self.mapView setRegion:region animated:YES];
    
    [_parkeerButton.layer setShadowColor:[UIColor blackColor].CGColor];
    [_parkeerButton.layer setShadowOpacity:0.2f];
    [_parkeerButton.layer setShadowRadius:2.0f];
    [_parkeerButton.layer setShadowOffset:CGSizeMake(0.0, 1.0)];
    
}

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    
}

//Make the statusBar White
-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}


- (IBAction)didPressParkeerButton:(id)sender {
}

@end
