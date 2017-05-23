//
//  SearchViewController.m
//  CatMap
//
//  Created by Rushan on 2017-05-23.
//  Copyright © 2017 RushanBenazir. All rights reserved.
//

#import "SearchViewController.h"
#import ""

@interface SearchViewController () <CLLocationManagerDelegate>

@property (nonatomic, strong) CLLocationManager *searchLocationManager;


@property (weak, nonatomic) IBOutlet UITextField *searchTextField;
@property (weak, nonatomic) IBOutlet UISwitch *locationSwitch;

@property (nonatomic, assign) BOOL isAroundMe;
@property (nonatomic, strong) NSMutableArray *imagesAroundMe;

@property (nonatomic) CLLocation *myLocation;


@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)saveButton:(id)sender {
    [self dismissViewControllerAnimated:YES completion:^{
        [self parsePhotos];
    }];
}

-(void)parsePhotos{
    
}

- (IBAction)useLocation:(id)sender {
    if([sender isOn]){
        [self.manager requestLocation];
        CLLocation *coordinate = self.manager.location;
        self.location = coordinate.coordinate;
        self.useUserLocation = YES;
    }
    else
        self.useUserLocation = NO;
}

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations{
    
}

-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error{
    
}


@end
