//
//  ShowAllViewController.m
//  CatMap
//
//  Created by Rushan on 2017-05-23.
//  Copyright © 2017 RushanBenazir. All rights reserved.
//

#import "ShowAllViewController.h"
#import "LocationManager.h"
#import "Photo.h"
@import MapKit;

@interface ShowAllViewController ()

@property (weak, nonatomic) IBOutlet MKMapView *photoLocation;

@end

@implementation ShowAllViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self getCoordinates:self.showAllPhotos];
    
}


-(void)getCoordinates:(NSMutableArray *)arrayOfPic{
    for(Photo *photo in self.showAllPhotos){
        [LocationManager getPictureLocationData:photo completion:^(CLLocationCoordinate2D coordinates) {
            photo.coordinate = coordinates;
            [self addAnnotationToMap:photo];
        }];
    }
}

-(void)addAnnotationToMap:(Photo *)thisPhoto{
    [self.photoLocation addAnnotation:thisPhoto];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
