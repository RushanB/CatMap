//
//  Photo.m
//  CatMap
//
//  Created by Rushan on 2017-05-23.
//  Copyright © 2017 RushanBenazir. All rights reserved.
//

#import "Photo.h"

@implementation Photo

-(instancetype)initWithInfo:(NSDictionary *)info{
    if(self = [super init]){
        _photoServer = info[@"server"];
        _photoFarm = info[@"farm"];
        _photoSecret = info[@"secret"];
        _photoID = info[@"id"];
    }
    return self;
}

-(NSURL *)url{
    return [NSURL URLWithString:[NSString stringWithFormat:@"https://farm%@.staticflickr.com/%@/%@_%@.jpg",self.photoFarm, self.photoServer, self.photoID, self.photoSecret]];
}

@end
