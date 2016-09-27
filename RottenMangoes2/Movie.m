//
//  Movie.m
//  RottenMangoes2
//
//  Created by Philip Ha on 2016-09-26.
//  Copyright © 2016 Philip Ha. All rights reserved.
//

#import "Movie.h"

@implementation Movie

- (instancetype)initWithTitle:(NSString *)title ImageURL:(NSString *)imageURL;
{
    self = [super init];
    if (self) {
        
        _title = title;
        _imageURL = imageURL;
        
    }
    return self;
}

@end
