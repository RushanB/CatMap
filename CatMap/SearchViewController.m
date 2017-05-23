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
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end
