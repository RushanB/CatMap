//
//  CatsCollectionViewCell.h
//  CatMap
//
//  Created by Rushan on 2017-05-23.
//  Copyright © 2017 RushanBenazir. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Photo.h"

@interface CatsCollectionViewCell : UICollectionViewCell


//@property (weak, nonatomic) IBOutlet UILabel *title;
//@property (weak, nonatomic) IBOutlet UIImageView *catsImage;
@property (nonatomic) Photo *aPhoto;

@end

