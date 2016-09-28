//
//  LocationManager.h
//  RottenMangoes2
//
//  Created by Philip Ha on 2016-09-27.
//  Copyright © 2016 Philip Ha. All rights reserved.
//

#import <Foundation/Foundation.h>

@import CoreLocation;

@protocol SharedLocationDelegate <NSObject>

-(void) passCurrentLocation:(CLLocation*) currentLocation;

@end

@interface LocationManager : NSObject

@property (nonatomic) CLLocation *currentLocation;

@property (nonatomic, weak) id<SharedLocationDelegate> delegate;

@end
