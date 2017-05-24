//
//  CatsCollectionViewCell.m
//  CatMap
//
//  Created by Rushan on 2017-05-23.
//  Copyright © 2017 RushanBenazir. All rights reserved.
//

#import "CatsCollectionViewCell.h"
#import "APIManager.h"

@interface CatsCollectionViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;


@end

@implementation CatsCollectionViewCell

-(void)setAPhoto:(Photo *)aPhoto{
    _aPhoto = aPhoto;
    [self configureCell];
    
}

-(void)configureCell{
    self.titleLabel.text = self.aPhoto.title;
    [APIManager downloadPhotos:self.aPhoto.imageURL completion:^(UIImage *image) {
        self.imageView.image = image;
    }];
}

@end
