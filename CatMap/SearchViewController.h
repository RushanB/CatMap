//
//  SearchViewController.h
//  CatMap
//
//  Created by Rushan on 2017-05-23.
//  Copyright © 2017 RushanBenazir. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Photo.h"
@import CoreLocation;
@class FlickrAPI;


@interface SearchViewController : UIViewController <CLLocationManagerDelegate>
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property(nonatomic, copy) void(^addNewTags)(NSArray<Photo *>*photo);
@property FlickrAPI *flickr;

@end
