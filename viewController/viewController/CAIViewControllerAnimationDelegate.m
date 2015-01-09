//
//  CAIViewControllerAnimationDelegate.m
//  viewController
//
//  Created by liyufeng on 15/1/7.
//  Copyright (c) 2015年 liyufeng. All rights reserved.
//

#import "CAIViewControllerAnimationDelegate.h"
#import "CAIPresentAnimation.h"
#import "CAIDismissAnimation.h"

@interface CAIViewControllerAnimationDelegate ()

@property (nonatomic, strong)CAIPresentAnimation * presentAnimation;
@property (nonatomic, strong)CAIDismissAnimation * dismissAnimation;

@end

@implementation CAIViewControllerAnimationDelegate

- (void)awakeFromNib{
    self.presentAnimation = [[CAIPresentAnimation alloc]init];
    self.dismissAnimation = [[CAIDismissAnimation alloc]init];
}

#pragma mark - UIViewControllerTransitioningDelegate

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    return self.presentAnimation;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    return self.dismissAnimation;
}

- (id<UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(id<UIViewControllerAnimatedTransitioning>)animator {
    return nil;
}

@end
