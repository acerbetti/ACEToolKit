// ACEViewController.m
//
// Copyright (c) 2016 Stefano Acerbetti
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.  Copyright (c) 2016 Stefano Acerbetti. All rights reserved.
//


#import "ACEToolKit.h"

@implementation ACEViewController (ACEToolKit)

- (void)containerAddChildViewController:(ACEViewControllerRef)childViewController parentView:(ACEViewRef)parentView
{
    [self addChildViewController:childViewController];
    [parentView addSubview:childViewController.view];
    [childViewController.view setFrame:parentView.bounds];
    
#if TARGET_OS_IOS
    [childViewController didMoveToParentViewController:self];
#endif
}

- (void)containerAddChildViewController:(ACEViewControllerRef)childViewController
{
    [self containerAddChildViewController:childViewController parentView:self.view];
}

- (void)containerRemoveChildViewController:(ACEViewControllerRef)childViewController
{
#if TARGET_OS_IOS
    [childViewController willMoveToParentViewController:nil];
#endif
    
    [childViewController.view removeFromSuperview];
    [childViewController removeFromParentViewController];
}

@end
