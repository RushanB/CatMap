//
//  Photo.m
//  CatMap
//
//  Created by Rushan on 2017-05-23.
//  Copyright © 2017 RushanBenazir. All rights reserved.
//

#import "Photo.h"r
#import "CoreDataManager.h"

@implementation Photo

//-(instancetype)initWithInfo:(NSDictionary *)info{
//    if(self = [super init]){
//        self.title = info[@"title"];
//        self.photoID = info[@"id"];
//        
//        
//        NSString *urlString = [NSString stringWithFormat:@"https://farm%@.staticflickr.com/%@/%@_%@.jpg",info[@"farm"],info[@"server"], info[@"id"],info[@"secret"]];
//        
//        self.imageURL = [NSURL URLWithString:urlString];
//    }
//    return self;
//}
//
//

+ (Photo *)photoWithInfo:(NSDictionary *)Info inObjectContext:(NSManagedObjectContext *)context{
    Photo *photo = nil;
    
    NSString *unique = dictionr
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Photo"];
    request.predicate = [NSPredicate predicateWithFormat:@"unique = %@", unique];
    
    
    return photo;
}

+(void)loadPhotos:(NSArray *)photos inObjectContext:(NSManagedObjectContext *)context{
    

}


+ (NSArray *)makePhotoArray:(NSArray *)aPhotoArray{  //photos into array
    NSMutableArray *array = [[NSMutableArray alloc] init];
    
    for (NSDictionary *information in aPhotoArray) {
        
        Photo *photo = [[Photo alloc] initWithInfo:information];
        [array addObject:photo];
        
    }
    
    return array;
}




@end
