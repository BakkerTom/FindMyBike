//
//  ViewController.m
//  FindMyBike
//
//  Created by Tom Bakker on 14-11-14.
//  Copyright (c) 2014 Tom Bakker. All rights reserved.
//

#import "ViewController.h"
#import <MapKit/MapKit.h>

bool isParked = NO;
bool isTracking = NO;

@interface ViewController ()

@property (strong, nonatomic) CLLocationManager *locationManager;

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Set the mapview delegate to self
    _mapView.delegate = self;
    
    //Allocate and init the locationManager and set it's delegate to self
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    
    //Check if system is iOS8 and request gps location
    if(IS_OS_8_OR_LATER) {
        [self.locationManager requestWhenInUseAuthorization];
        [self.locationManager startUpdatingLocation];
    }
    
    //Show the user location
    [self.mapView setShowsUserLocation:YES];
    [self.mapView setUserTrackingMode:MKUserTrackingModeNone animated:YES];
    
    [self centerToGps];
    
    //Add a dropshadow under the parkeerButton
    [_parkeerButton.layer setShadowColor:[UIColor blackColor].CGColor];
    [_parkeerButton.layer setShadowOpacity:0.2f];
    [_parkeerButton.layer setShadowRadius:2.0f];
    [_parkeerButton.layer setShadowOffset:CGSizeMake(0.0, 1.0)];
    
}

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    if (isTracking) {
        [self centerToGps];
    }
}

//Make the statusBar White
-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

- (IBAction)didPressParkeerButton:(id)sender {
    if (isParked) {
        [self.parkeerButton setTitle:@"PARKEREN" forState:UIControlStateNormal];
        [self.parkeerButton setTitleColor:[UIColor colorWithRed:0.609 green:0.653 blue:0.674 alpha:0.899] forState:UIControlStateNormal];
        isParked = NO;
    } else {
        [self.parkeerButton setTitle:@"GEPARKEERD" forState:UIControlStateNormal];
        [self.parkeerButton setTitleColor:[UIColor colorWithRed:0.203 green:0.666 blue:0.862 alpha:1] forState:UIControlStateNormal];
        isParked = YES;
    }
}

- (IBAction)didPressLocationButton:(id)sender {
    if (isTracking) {
        [self.locationButton setImage:[UIImage imageNamed:@"locationOff"] forState:UIControlStateNormal];
        isTracking = NO;
    } else {
        [self.locationButton setImage:[UIImage imageNamed:@"locationOn"] forState:UIControlStateNormal];
        [self centerToGps];
        isTracking = YES;
    }

}

-(void)centerToGps {
    MKCoordinateRegion region = { { 0.0, 0.0 }, { 0.0, 0.0 } };
    region.center.latitude = self.locationManager.location.coordinate.latitude;
    region.center.longitude = self.locationManager.location.coordinate.longitude;
    region.span.latitudeDelta = 0.0187f;
    region.span.longitudeDelta = 0.0137f;
    [self.mapView setRegion:region animated:YES];
}









@end
