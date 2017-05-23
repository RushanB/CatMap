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

@property (nonatomic, copy) NSString *title;
@property (nonatomic, strong) NSURL *imageURL;
@property (nonatomic, strong) NSString *photoID;

@property (nonatomic) CLLocationCoordinate2D coordinate;

-(instancetype)initWithInfo:(NSDictionary *)info;

+ (NSArray *)makePhotoArray:(NSArray *)catPhotoArray;

@end
