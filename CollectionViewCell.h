//
//  CollectionViewCell.h
//
//
//  Created by Sayeem on 11/26/13.
//  Copyright (c) 2013 Pokanop Apps. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

- (void)zoomIn:(void (^)())completion;
- (void)zoomOut:(void (^)())completion;

@end
