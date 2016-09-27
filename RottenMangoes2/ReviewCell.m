//
//  ReviewCell.m
//  RottenMangoes2
//
//  Created by Philip Ha on 2016-09-27.
//  Copyright © 2016 Philip Ha. All rights reserved.
//

#import "ReviewCell.h"

@implementation ReviewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setReview:(Review *)review
{
    _review = review;
    
    self.criticLabel.text = self.review.critic;
    self.freshLabel.text = self.review.fresh;
    self.reviewTextView.text = self.review.reviewText;
    
    UIView *dummyView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    self.reviewTextView.inputView = dummyView;
    
    if ([self.freshLabel.text isEqualToString:@"rotten"]) {
         self.freshLabel.textColor = [UIColor redColor];
    } else {
        self.freshLabel.textColor = [UIColor greenColor];
    }

}


@end
