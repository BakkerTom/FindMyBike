//
//  bikeAnnotation.m
//  FindMyBike
//
//  Created by Tom Bakker on 15-11-14.
//  Copyright (c) 2014 Tom Bakker. All rights reserved.
//

#import "bikeAnnotation.h"

@implementation bikeAnnotation

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(id) initWithTitle:(NSString *) title AndCoordinate:(CLLocationCoordinate2D)coordinate{
    self = [super init];
    _title = title;
    _coordinate = coordinate;
    return self;
}

@end
