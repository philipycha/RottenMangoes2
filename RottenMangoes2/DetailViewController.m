//
//  DetailViewController.m
//  RottenMangoes2
//
//  Created by Philip Ha on 2016-09-26.
//  Copyright © 2016 Philip Ha. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (copy, nonatomic) NSArray *movieReviews; // copy is like strong but makes sure that even if the subclass is mutable, we store an immutable copy.


@end

@implementation DetailViewController

#pragma mark - Getters & Setters

- (void)setMovieReviews:(NSArray *)movieReviews {
    _movieReviews = [movieReviews copy];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.tableView reloadData];
    });
}

#pragma mark - Rest of it

- (void)configureView {
    
    self.detailImageView.image = [UIImage imageWithData: [NSData dataWithContentsOfURL:[NSURL URLWithString:self.movie.imageURL]]];
    self.detailTitle.text = [NSString stringWithFormat:@"Title: %@",self.movie.title];
    self.detailYearLabel.text = [NSString stringWithFormat:@"Year: %@", self.movie.year.stringValue];
    self.detailRuntimeLabel.text = [NSString stringWithFormat:@"Runtime: %@min", self.movie.runtime.stringValue];
    
}


- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self configureView];
    [self loadMovieReviews];
    [self.tableView reloadData];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.movieReviews.count;
    
}


- (ReviewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ReviewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reviewCell" forIndexPath:indexPath];
    
    [self setReview:self.review];
    
    return cell;
    
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([cell isKindOfClass:[ReviewCell class]]) {
        ReviewCell* reviewCell = (ReviewCell*)cell;
        reviewCell.review = self.movieReviews[indexPath.row];
    }
}

- (void)loadMovieReviews {
    
    NSMutableArray* reviews = [NSMutableArray array];
    
    NSString *urlString = @"http://api.rottentomatoes.com/api/public/v1.0/movies/771311818/reviews.json?apikey=j9fhnct2tp8wu2q9h75kanh9&page_limit=3";
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLSessionDataTask *task = [session dataTaskWithURL:[NSURL URLWithString:urlString] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (!error) {
            
            NSError *jsonError = nil;
            
            NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
            
            NSArray *reviewsJSON = jsonDictionary[@"reviews"];
            
            for (NSDictionary *eachReview in reviewsJSON) {
                NSString *critic = eachReview[@"critic"];
                NSString *fresh = eachReview[@"freshness"];
                NSString *reviewText = eachReview[@"quote"];
                
                Review *review = [[Review alloc]initWithCritic:critic ReviewText:reviewText Fresh:fresh];
                
                [reviews addObject:review];
            }
            
            self.movieReviews = reviews;
        }
    }];
    
    [task resume];
    
}

-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    return NO;  // Hide both keyboard and blinking cursor.
}






@end
