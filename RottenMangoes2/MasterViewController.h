//
//  MasterViewController.h
//  RottenMangoes2
//
//  Created by Philip Ha on 2016-09-26.
//  Copyright © 2016 Philip Ha. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Movie.h"

@class DetailViewController;

@interface MasterViewController : UICollectionViewController

@property (strong, nonatomic) DetailViewController *detailViewController;


@end

