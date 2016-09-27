//
//  Movie.h
//  RottenMangoes2
//
//  Created by Philip Ha on 2016-09-26.
//  Copyright © 2016 Philip Ha. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Movie : NSObject

@property (strong, nonatomic) NSString * title;
@property (strong, nonatomic) NSString * imageURL;
@property (strong, nonatomic) NSString * review;

@property (strong, nonatomic) NSString * year;
@property (strong, nonatomic) NSString * runtime;



- (instancetype)initWithTitle:(NSString *)title ImageURL:(NSString *)imageURL Review:(NSString *)review Year:(NSString *)year Runtime:(NSString *)runtime;

@end
