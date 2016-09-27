//
//  Review.m
//  RottenMangoes2
//
//  Created by Philip Ha on 2016-09-27.
//  Copyright © 2016 Philip Ha. All rights reserved.
//

#import "Review.h"

@implementation Review

- (instancetype)initWithCritic:(NSString*)critic ReviewText:(NSString*)reviewText Fresh:(NSString*)fresh
{
    self = [super init];
    if (self) {
        
        _reviewText = reviewText;
        _critic = critic;
        _fresh = fresh;
        
    }
    return self;
}

@end
