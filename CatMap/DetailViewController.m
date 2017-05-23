//
//  DetailViewController.m
//  CatMap
//
//  Created by Rushan on 2017-05-23.
//  Copyright © 2017 RushanBenazir. All rights reserved.
//

#import "DetailViewController.h"
#import "LocationManager.h"
#import "APIManager.h"

@interface DetailViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *detailImage;
@property (weak, nonatomic) IBOutlet UILabel *latitudeLabel;
@property (weak, nonatomic) IBOutlet UILabel *longitudeLabel;


@property (weak, nonatomic) IBOutlet MKMapView *photoLocation;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = self.aPhoto.title;
    
    [LocationManager getPictureLocationData:self.aPhoto completion:^(CLLocationCoordinate2D coordinate) {
        self.aPhoto.coordinate = coordinate;
        self.latitudeLabel.text = [NSString stringWithFormat:@"Latitude: %f", self.aPhoto.coordinate.latitude];
        self.longitudeLabel.text = [NSString stringWithFormat:@"Longitude: %f", self.aPhoto.coordinate.longitude];
        
        [self setMapView];
    }];
    
    [self configureCell];
}

- (void) configureCell{
    [APIManager downloadPhotos:self.aPhoto.imageURL completion:^(UIImage *image) {
        self.detailImage.image = image;
    }];
}

-(void) setMapView{
    MKCoordinateSpan span = MKCoordinateSpanMake(0.5f, 0.5f);
    self.photoLocation.region = MKCoordinateRegionMake(self.aPhoto.coordinate, span);
    [self.photoLocation addAnnotation:self.aPhoto];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
