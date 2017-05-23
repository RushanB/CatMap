//
//  DetailViewController.h
//  CatMap
//
//  Created by Rushan on 2017-05-23.
//  Copyright © 2017 RushanBenazir. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Photo.h"

@interface DetailViewController : UIViewController

@property NSString *imageID;
@property Photo *catPhoto;

@end
