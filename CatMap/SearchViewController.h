//
//  SearchViewController.h
//  CatMap
//
//  Created by Rushan on 2017-05-23.
//  Copyright © 2017 RushanBenazir. All rights reserved.
//

#import <UIKit/UIKit.h>
@import CoreLocation;

@protocol SearchViewControllerDelegate <NSObject>

-(void)getArrayOfSearchedPhotos:(NSMutableArray *)arrayOfTaggedPhotos;

@end

@interface SearchViewController : UIViewController

@property (nonatomic, weak) id <SearchViewControllerDelegate> searchViewControllerDelegate;

@end
