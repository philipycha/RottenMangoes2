//
//  ReviewCell.h
//  RottenMangoes2
//
//  Created by Philip Ha on 2016-09-27.
//  Copyright © 2016 Philip Ha. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Review.h"

@interface ReviewCell : UITableViewCell

@property (nonatomic) Review *review;

@property (weak, nonatomic) IBOutlet UILabel *criticLabel;
@property (weak, nonatomic) IBOutlet UILabel *freshLabel;
@property (weak, nonatomic) IBOutlet UITextView *reviewTextView;

@end
