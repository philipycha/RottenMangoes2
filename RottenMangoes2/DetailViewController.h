//
//  DetailViewController.h
//  RottenMangoes2
//
//  Created by Philip Ha on 2016-09-26.
//  Copyright © 2016 Philip Ha. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Movie.h"

@interface DetailViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *detailImageView;
@property (weak, nonatomic) IBOutlet UILabel *detailTitle;
@property (weak, nonatomic) IBOutlet UILabel *detailYearLabel;
@property (weak, nonatomic) IBOutlet UILabel *detailRuntimeLabel;

@property (weak, nonatomic) IBOutlet UITextView *review01TextView;
@property (weak, nonatomic) IBOutlet UITextView *review02TextView;


@property (strong, nonatomic) Movie *movie;


@end

