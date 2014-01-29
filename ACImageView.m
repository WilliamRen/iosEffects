//
//  ACImageView.m
//
//
//  Created by Sayeem on 11/9/13.
//  Copyright (c) 2013 Pokanop Apps. All rights reserved.
//

#import "ACImageView.h"
#import "UIImage.h"
#import <QuartzCore/QuartzCore.h>

@implementation ACImageView

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

- (void)stopMyKenBurnsEffect
{
    self.tag = 100;
    self.transform = CGAffineTransformIdentity;
}

- (void)myKenBurnsEffect
{
    if (self.tag == 100) {
        self.tag = 0;
        [self.layer removeAllAnimations];
        return;
    }
    
    [UIView animateWithDuration:10.0 delay:0 options:UIViewAnimationOptionAllowUserInteraction animations:^{
        CGAffineTransform scale = CGAffineTransformMakeScale(1.3, 1.3);
        // random degree from 0 to 360
        CGFloat angle = arc4random() % 360;
        // convert to radians
        CGFloat angleInRadians = (angle * M_PI) / 180;
        // trig to get x axis
        CGFloat x = 45 * cos(angleInRadians);
        // trig to get y axis
        CGFloat y = 45 * sin(angleInRadians);
        // translate x and y
        CGAffineTransform translation = CGAffineTransformMakeTranslation(x, y);
        // scale at the same time to give zoom effect
        self.transform = CGAffineTransformConcat(scale, translation);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:10.0 delay:0 options:UIViewAnimationOptionAllowUserInteraction animations:^{
            self.transform = CGAffineTransformIdentity;
        } completion:^(BOOL finished) {
            // recurse to keep going
            [self samBurnsEffect];
        }];
    }];
}

@end
