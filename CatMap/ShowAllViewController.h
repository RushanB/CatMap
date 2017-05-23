//
//  ShowAllViewController.h
//  CatMap
//
//  Created by Rushan on 2017-05-23.
//  Copyright © 2017 RushanBenazir. All rights reserved.
//

#import <UIKit/UIKit.h>
@import MapKit;

@interface ShowAllViewController : UIViewController <MKAnnotation>

@property (nonatomic) CLLocationCoordinate2D coordinate;
@property (nonatomic) NSMutableArray *showAllPhotos;


@end
