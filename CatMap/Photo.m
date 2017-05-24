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
        self.title = info[@"title"];
        self.photoID = info[@"id"];
        
        
        NSString *urlString = [NSString stringWithFormat:@"https://farm%@.staticflickr.com/%@/%@_%@.jpg",info[@"farm"],info[@"server"], info[@"id"],info[@"secret"]];
        
        self.imageURL = [NSURL URLWithString:urlString];
    }
    return self;
}


+ (NSArray *)makePhotoArray:(NSArray *)aPhotoArray{
    NSMutableArray *array = [[NSMutableArray alloc] init];
    
    for (NSDictionary *information in aPhotoArray) {
        
        Photo *photo = [[Photo alloc] initWithInfo:information];
        [array addObject:photo];
        
    }
    
    return array;
}


@end
