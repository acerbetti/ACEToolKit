//
//  UIViewController+ACEToolKit.h
//  ACEToolKitDemo
//
//  Created by Stefano Acerbetti on 12/18/13.
//  Copyright (c) 2013 Stefano Acerbetti. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (ACEToolKit)

// child controllers
- (void)containerAddChildViewController:(UIViewController *)childViewController parentView:(UIView *)view;
- (void)containerAddChildViewController:(UIViewController *)childViewController;
- (void)containerRemoveChildViewController:(UIViewController *)childViewController;

@end
