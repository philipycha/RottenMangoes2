//
//  Theatre.m
//  RottenMangoes2
//
//  Created by Philip Ha on 2016-09-27.
//  Copyright © 2016 Philip Ha. All rights reserved.
//

#import "Theatre.h"

@implementation Theatre

- (instancetype)initWithCoordinate:(CLLocationCoordinate2D)coordinate Subtitle:(NSString *)subtitle Title:(NSString *)title
{
    self = [super init];
    if (self) {
        
        _coordinate = coordinate;
        _subtitle = subtitle;
        _title = title;
        
        
    }
    
    return self;
}

@end
