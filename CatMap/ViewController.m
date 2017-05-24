//
//  ViewController.m
//  CatMap
//
//  Created by Rushan on 2017-05-23.
//  Copyright © 2017 RushanBenazir. All rights reserved.
//

#import "ViewController.h"
#import "APIManager.h"
#import "CatsCollectionViewCell.h"
#import "DetailViewController.h"
#import "SearchViewController.h"
#import "ShowAllViewController.h"
@import MapKit;

@interface ViewController () <UICollectionViewDelegate, UICollectionViewDataSource, SearchViewControllerDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *catsCollectionView;
@property (nonatomic) NSMutableArray *photoArray;

@property (nonatomic) NSIndexPath *currentIndexPath;

//@property (nonatomic) ShowAllViewController *showAllVC;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self performSegueWithIdentifier:@"Search" sender:self];
    self.photoArray = [[NSMutableArray alloc] init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [self.photoArray count];
    
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    CatsCollectionViewCell *cell = [self.catsCollectionView dequeueReusableCellWithReuseIdentifier:@"Cats" forIndexPath:indexPath];
    cell.aPhoto = self.photoArray[indexPath.row];
    
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    self.currentIndexPath = indexPath;
    [self performSegueWithIdentifier:@"Detail" sender:self];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"Detail"]){
        Photo *photo = [self.photoArray objectAtIndex:self.currentIndexPath.item];
        DetailViewController *dvc = segue.destinationViewController;
        dvc.aPhoto = photo;
    }
    if([segue.identifier isEqualToString:@"Search"]){
        SearchViewController *svc = segue.destinationViewController;
        svc.searchViewControllerDelegate = self;
    }
    if([segue.identifier isEqualToString:@"ShowAll"]){
        ShowAllViewController *showAllVC = segue.destinationViewController;
        showAllVC.showAllPhotos = self.photoArray;
    }
}

-(void)getArrayOfSearchedPhotos:(NSMutableArray *)arrayOfTaggedPhotos{
    self.photoArray = arrayOfTaggedPhotos;
    
    [self.catsCollectionView reloadData];
    
}
    
@end
