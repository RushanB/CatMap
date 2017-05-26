//
//  PhotoEntity+CoreDataProperties.m
//  CatMap
//
//  Created by Rushan on 2017-05-26.
//  Copyright © 2017 RushanBenazir. All rights reserved.
//

#import "PhotoEntity+CoreDataProperties.h"

@implementation PhotoEntity (CoreDataProperties)

+ (NSFetchRequest<PhotoEntity *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"PhotoEntity"];
}

@dynamic latitude;
@dynamic longitute;
@dynamic photoID;
@dynamic title;
@dynamic url;
@dynamic image;

@end
