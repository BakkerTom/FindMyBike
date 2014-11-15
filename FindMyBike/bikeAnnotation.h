//
//  bikeAnnotation.h
//  FindMyBike
//
//  Created by Tom Bakker on 15-11-14.
//  Copyright (c) 2014 Tom Bakker. All rights reserved.
//

#import <MapKit/MapKit.h>

@interface bikeAnnotation : MKAnnotationView

@property (nonatomic,copy) NSString *title;
@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;
-(id) initWithTitle:(NSString *) title AndCoordinate:(CLLocationCoordinate2D)coordinate;

@end
