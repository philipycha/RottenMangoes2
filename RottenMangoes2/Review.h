//
//  Review.h
//  RottenMangoes2
//
//  Created by Philip Ha on 2016-09-27.
//  Copyright © 2016 Philip Ha. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Review : NSObject

@property (strong, nonatomic) NSString *fresh;
@property (strong, nonatomic) NSString *critic;
@property (strong, nonatomic) NSString *reviewText;

- (instancetype)initWithCritic:(NSString*)critic ReviewText:(NSString*)reviewText Fresh:(NSString*)fresh;


@end
