//
//  UIViewController+ACEToolKit.m
//  ACEToolKitDemo
//
//  Created by Stefano Acerbetti on 12/18/13.
//  Copyright (c) 2013 Stefano Acerbetti. All rights reserved.
//

#import "ACEToolKit.h"

@implementation UIViewController (ACEToolKit)

- (void)containerAddChildViewController:(UIViewController *)childViewController parentView:(UIView *)view
{
    [self addChildViewController:childViewController];
    [view addSubview:childViewController.view];
    [childViewController didMoveToParentViewController:self];
}

- (void)containerAddChildViewController:(UIViewController *)childViewController
{
    [self containerAddChildViewController:childViewController parentView:self.view];
}

- (void)containerRemoveChildViewController:(UIViewController *)childViewController
{
    [childViewController willMoveToParentViewController:nil];
    [childViewController.view removeFromSuperview];
    [childViewController removeFromParentViewController];
}

@end
