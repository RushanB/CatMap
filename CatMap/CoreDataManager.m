//
//  CoreDataManager.m
//  CatMap
//
//  Created by Rushan on 2017-05-23.
//  Copyright © 2017 RushanBenazir. All rights reserved.
//

#import "CoreDataManager.h"

@implementation CoreDataManager

+(instancetype)sharedInstance{
    
    static CoreDataManager *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[CoreDataManager alloc]init];

    });
    return sharedInstance;
}

@end
