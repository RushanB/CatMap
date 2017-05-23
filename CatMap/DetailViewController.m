//
//  DetailViewController.m
//  CatMap
//
//  Created by Rushan on 2017-05-23.
//  Copyright © 2017 RushanBenazir. All rights reserved.
//

#import "DetailViewController.h"
#import "Photo.h"
#import "apiKeys.h"
@import MapKit;

@interface DetailViewController ()

@property (weak, nonatomic) IBOutlet MKMapView *map;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.imageID = self.catPhoto.photoID;
    NSURL *parseURL = [NSURL URLWithString:[NSString stringWithFormat:@"https://api.flickr.com/services/rest/?method-flickr.photos.geo.getLocation&api_key=%@&photo_id=%@&format=json&nojsoncallback=1",FLICKR_APIKEY, self.imageID]];
    
    NSURL *urlRequest = [[NSURLRequest alloc]initWithURL:parseURL];
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:kCFProxyAutoConfigurationHTTPResponseKey];
    
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:urlRequest completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if(error){
            NSLog(@"Error: %@", error.localizedDescription);
            return;
        }
        NSError *jsonError = nil;
        NSDictionary *latlongDict = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        if(jsonError){
            NSLog(@"jsonError: %@", jsonError.localizedDescription);
            return;
        }
        NSDictionary *photos = [latlongDict objectForKey:@"photo"];
        NSDictionary *location = [latlongDict objectForKey:@"location"];
        double lat = [[location objectForKey:@"latitude"]doubleValue];
        double lon = [[location objectForKey:@"longitude"]doubleValue];
        
        CLLocationCoordinate2D coord = CLLocationCoordinate2DMake(lat, lon);
        self.catPhoto.coordinate = coord;
        
        MKCoordinateSpan span = MKCoordinateSpanMake(0.5f, 0.5f);
        self.map.region = MKCoordinateRegionMake(self.catPhoto.coordinate, span);
        
        [[NSOperationQueue mainQueue]addOperationWithBlock:^{
            [self.map addAnnotation:self.catPhoto];
        }];
    }];
    [dataTask resume];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
