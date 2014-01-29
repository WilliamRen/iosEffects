//
//  CollectionViewCell.m
//
//
//  Created by Sayeem on 11/26/13.
//  Copyright (c) 2013 Pokanop Apps. All rights reserved.
//

#import "CollectionViewCell.h"

@implementation CollectionViewCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    cell.backgroundColor = [UIColor greenColor];
}

- (void)zoomIn:(void (^)())completion
{
    // Move this view to the top of the view stack
    [self.superview bringSubviewToFront:self];
    
    // Animate the view and then fire the completion block
    [UIView animateWithDuration:0.3 animations:^{
        // Scale
        CGRect bounds = [UIScreen mainScreen].bounds;
        CGAffineTransform scale = CGAffineTransformMakeScale(bounds.size.width / self.frame.size.width, bounds.size.height / self.frame.size.height);
        CGPoint center = self.center;
        UIWindow *mainWindow = [[UIApplication sharedApplication] keyWindow];
        center = [self.superview convertPoint:self.center toView:mainWindow];
        CGAffineTransform translation = CGAffineTransformMakeTranslation(bounds.size.width / 2 - center.x, bounds.size.height / 2 - center.y);
        self.transform = CGAffineTransformConcat(scale, translation);
    } completion:^(BOOL finished) {
        if (completion) {
            completion();
        }
    }];
}

- (void)zoomOut:(void (^)())completion
{
    // Animate the view and then fire the completion block
    [UIView animateWithDuration:0.3 animations:^{
        // Set the transform back to identity
        self.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        if (completion) {
            completion();
        }
    }];
}

@end
