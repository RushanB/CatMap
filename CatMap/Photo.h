//
//  Photo.h
//  CatMap
//
//  Created by Rushan on 2017-05-23.
//  Copyright © 2017 RushanBenazir. All rights reserved.
//

#import <Foundation/Foundation.h>
@import MapKit;
#import "PhotoEntity+CoreDataClass.h"
@import CoreData;


@interface Photo : NSManagedObject <MKAnnotation>
//
//@property (nonatomic, copy) NSString *title;
//@property (nonatomic, strong) NSURL *imageURL;
//@property (nonatomic, strong) NSString *photoID;
//
//@property (nonatomic) CLLocationCoordinate2D coordinate;

-(instancetype)initWithInfo:(NSDictionary *)info;

+ (NSArray *)makePhotoArray:(NSArray *)aPhotoArray;

//Core Data
+ (PhotoEntity *)photoWithInfo:(NSDictionary *)Info inObjectContext:(NSManagedObjectContext *)context;

+(void)loadPhotos:(NSArray *)photos inObjectContext:(NSManagedObjectContext *)context;

@end
