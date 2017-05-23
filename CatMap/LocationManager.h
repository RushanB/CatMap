//
//  LocationManager.h
//  CatMap
//
//  Created by Rushan on 2017-05-23.
//  Copyright © 2017 RushanBenazir. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Photo.h"

@interface LocationManager : NSObject

+ (void)getPictureLocationData:(Photo*)picture completion:(void (^)(CLLocationCoordinate2D))completion;

@end
