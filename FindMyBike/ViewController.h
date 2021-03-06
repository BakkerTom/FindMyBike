//
//  ViewController.h
//  FindMyBike
//
//  Created by Tom Bakker on 14-11-14.
//  Copyright (c) 2014 Tom Bakker. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

#define IS_OS_8_OR_LATER ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)

@interface ViewController : UIViewController <MKMapViewDelegate, CLLocationManagerDelegate, UIScrollViewDelegate>

@property (strong, nonatomic) IBOutlet MKMapView *mapView;
@property (weak, nonatomic) IBOutlet UIButton *parkeerButton;
@property (weak, nonatomic) IBOutlet UIButton *locationButton;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;


- (IBAction)didPressParkeerButton:(id)sender;
- (IBAction)didPressLocationButton:(id)sender;

@end

