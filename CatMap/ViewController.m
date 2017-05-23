//
//  ViewController.m
//  CatMap
//
//  Created by Rushan on 2017-05-23.
//  Copyright © 2017 RushanBenazir. All rights reserved.
//

#import "ViewController.h"
#import "Photo.h"
#import "CatsCollectionViewCell.h"
#import "FlickrAPI.h"
#import "DetailViewController.h"
#import "SearchViewController.h"
#import "ShowAllViewController.h"

@interface ViewController () <UICollectionViewDelegate, UICollectionViewDataSource>

@property (weak, nonatomic) IBOutlet UICollectionView *catsCollectionView;
@property (nonatomic) NSArray *allPhotos;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.allPhotos = [NSArray array];
    
    [FlickrAPI searchFor:@"Cats" complete:^(NSArray *searchResults) {
        NSLog(@"Found %@", searchResults);
        
        self.allPhotos = searchResults;
        
        [self.catsCollectionView reloadData];
    }];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [self.allPhotos count];
    
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    CatsCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cats" forIndexPath:indexPath];
    //    cell.catsImage.image = self.allPhotos[indexPath.row];
    Photo *photo = self.allPhotos[indexPath.row];
    NSData *imgData = [[NSData alloc]initWithContentsOfURL:photo.url];
    cell.catsImage.image = [UIImage imageWithData:imgData];
    
    return cell;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if(segue.identifier isEqualToString:@"Detail"){
        DetailViewController *dvc = (DetailViewController *)[segue ]
        NSIndexPath *indexPath = [self
    }
}

@end
