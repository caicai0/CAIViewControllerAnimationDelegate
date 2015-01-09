//
//  CAIPresentAnimation.m
//  viewController
//
//  Created by liyufeng on 15/1/7.
//  Copyright (c) 2015年 liyufeng. All rights reserved.
//

#import "CAIPresentAnimation.h"

@implementation CAIPresentAnimation

- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext{
    return 0.8;
}
- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext{
    UIView * containerView = [transitionContext containerView];
    UIViewController * fromController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController * toController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    [containerView addSubview:toController.view];
    
    toController.view.transform = CGAffineTransformMakeTranslation(0, containerView.bounds.size.height);
    [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0 usingSpringWithDamping:0.8 initialSpringVelocity:1.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        toController.view.transform = CGAffineTransformMakeTranslation(0, 0);
        fromController.view.transform = CGAffineTransformMakeTranslation(0, -containerView.bounds.size.height);
    } completion:^(BOOL finished) {
        fromController.view.transform = CGAffineTransformMakeTranslation(0, 0);
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    }];
}

@end
