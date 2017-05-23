//
//  Photo.h
//  CatMap
//
//  Created by Rushan on 2017-05-23.
//  Copyright © 2017 RushanBenazir. All rights reserved.
//

#import <Foundation/Foundation.h>
@import UIKit;
@import MapKit;


@interface Photo : NSObject <MKAnnotation>

@property (nonatomic) NSString *photoServer;
@property (nonatomic) NSString *photoFarm;
@property (nonatomic) NSString *photoID;
@property (nonatomic) NSString *photoSecret;

@property (nonatomic) CLLocationCoordinate2D coordinate;

-(instancetype)initWithInfo:(NSDictionary *)info;

-(NSURL *)url;



@end
