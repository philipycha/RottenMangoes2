//
//  DetailViewController.m
//  RottenMangoes2
//
//  Created by Philip Ha on 2016-09-26.
//  Copyright © 2016 Philip Ha. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)configureView {
    
    self.detailImageView.image = [UIImage imageWithData: [NSData dataWithContentsOfURL:[NSURL URLWithString:self.movie.imageURL]]];
    self.detailTitle.text = self.movie.title;
    self.detailYearLabel.text = self.movie.year;
    self.detailRuntimeLabel.text = self.movie.runtime;
//    self.review01TextView.text = [self.movie.review];
//    self.review02TextView.text = self.movie.review;
   
}


- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self configureView];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
