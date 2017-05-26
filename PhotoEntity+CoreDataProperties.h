//
//  PhotoEntity+CoreDataProperties.h
//  CatMap
//
//  Created by Rushan on 2017-05-26.
//  Copyright © 2017 RushanBenazir. All rights reserved.
//

#import "PhotoEntity+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface PhotoEntity (CoreDataProperties)

+ (NSFetchRequest<PhotoEntity *> *)fetchRequest;

@property (nonatomic) double latitude;
@property (nonatomic) double longitute;
@property (nullable, nonatomic, copy) NSString *photoID;
@property (nullable, nonatomic, copy) NSString *title;
@property (nullable, nonatomic, copy) NSString *url;
@property (nullable, nonatomic, retain) NSData *image;

@end

NS_ASSUME_NONNULL_END
