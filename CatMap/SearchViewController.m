//
//  SearchViewController.m
//  CatMap
//
//  Created by Rushan on 2017-05-23.
//  Copyright © 2017 RushanBenazir. All rights reserved.
//

#import "SearchViewController.h"
#import "LocationManager.h"
#import "APIManager.h"
#import "Photo.h"

@interface SearchViewController () <CLLocationManagerDelegate>

@property (nonatomic, strong) CLLocationManager *searchLocationManager;

@property (weak, nonatomic) IBOutlet UITextField *searchTextField;
@property (weak, nonatomic) IBOutlet UISwitch *locationSwitch;

@property (nonatomic, assign) BOOL nearME;
@property (nonatomic, strong) NSMutableArray *photosNearMe;

@property (nonatomic) CLLocation *myLocation;


@end

@implementation SearchViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.photosNearMe = [[NSMutableArray alloc] init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)switchTapped:(id)sender {
    
    if (![sender isOn]) {
        
        [self.searchLocationManager stopUpdatingLocation];
        self.nearME = NO;
        
    }else if ([sender isOn]){
        
        [self searchArea];
        self.nearME = YES;
    }
}


-(void)searchArea{
    self.searchLocationManager = [[CLLocationManager alloc]init];
    
    if([self.searchLocationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]){
        [self.searchLocationManager requestWhenInUseAuthorization];
    }
    self.searchLocationManager.delegate = self;
    [self.searchLocationManager requestLocation];
    [self.searchLocationManager startUpdatingLocation];
}


-(IBAction)submitButtonTapped:(id)sender{
    NSString *taggedItems = self.searchTextField.text;
    taggedItems = [taggedItems stringByReplacingOccurrencesOfString:@" " withString:@"%2C+"];
    
    CLLocationCoordinate2D myCoord;
    
    if(self.nearME == YES){
        myCoord = self.myLocation.coordinate;
    }else if(self.nearME == NO){
        myCoord = CLLocationCoordinate2DMake(0,0);
    }
    [APIManager getPhotos:taggedItems andLatitude:myCoord.latitude andLongitude:myCoord.longitude withBlock:^(NSArray *allPhotos){
        
        for(Photo *photo in allPhotos) {
            
            [self.photosNearMe addObject:photo];
            
            [self.searchViewControllerDelegate getArrayOfSearchedPhotos:self.photosNearMe];
        }
        
        [self dismissViewControllerAnimated:YES completion:nil];
    }];
}

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations{
    [self.searchLocationManager stopUpdatingLocation];
    
    self.myLocation = [locations lastObject];
}

-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error{
    NSLog(@"%@", error);
}

@end
