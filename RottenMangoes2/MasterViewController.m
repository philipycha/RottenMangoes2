//
//  MasterViewController.m
//  RottenMangoes2
//
//  Created by Philip Ha on 2016-09-26.
//  Copyright © 2016 Philip Ha. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "CollectionViewCell.h"

@interface MasterViewController () <UICollectionViewDataSource, UICollectionViewDelegate>

@property (strong, nonatomic) Movie *movie;
@property (strong, nonatomic) NSMutableArray *movies;

@end

@implementation MasterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.movies = [NSMutableArray array];
    
    NSURL *url = [NSURL URLWithString:@"http://api.rottentomatoes.com/api/public/v1.0/lists/movies/in_theaters.json?apikey=xe4xau69pxaah5tmuryvrw75"];
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLSessionTask *task = [session dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error){
        
        if (!error) {
            
            NSError *jsonError = nil;
            
            NSDictionary *movieDict = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
            NSArray *movieArray = movieDict[@"movies"];
            
            for (NSDictionary *eachMovie in movieArray) {
                NSString *title = eachMovie[@"title"];
                
                Movie *movie = [[Movie alloc] initWithTitle:title];
                
                [self.movies addObject:movie];
            }
            
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.collectionView reloadData];
            });
            
        }
        
    }];
    
    [task resume];
    
}



- (void)viewWillAppear:(BOOL)animated {
    self.clearsSelectionOnViewWillAppear = self.splitViewController.isCollapsed;
    [super viewWillAppear:animated];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Segues

//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
//{
//    if ([segue.identifier isEqualToString:@"showDetailVC"])
//    {
//        NSIndexPath *indexPath = [[self.collectionView indexPathsForSelectedItems] firstObject];
//        
//        DetailViewController *detailVC = segue.destinationViewController;
//        
//        Movie *movie = [self.movies objectAtIndex:indexPath.item];
//        
//        detailVC. = movie;
//        
//    }
//}


#pragma mark - Table View

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    return 1;
    
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return self.movies.count;
    
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    
    Movie *movie = self.movies[indexPath.row];
    
    cell.cellLabel.text = movie.title;
    
    return cell;
}

-(BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender {
    
    return YES;
    
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    
    //    self.indexPath = indexPath; if you have property for indexPath
    //    [self performSegueWithIdentifier:@"toDetailVC" sender:self];
}


@end
