// ACEToolKit.h
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


#import <Foundation/Foundation.h>

#if TARGET_OS_IOS

#import <UIKit/UIKit.h>

typedef UIImage ACEImage;

// blocks
typedef BOOL (^SelectBlock)(NSInteger index, NSString *title);
typedef BOOL (^DismissBlock)(void);


// import all the headers
#import "ACEActionSheet.h"
#import "ACEAlertView.h"
#import "ACENavigationController.h"

#import "ACEErrorUtils.h"

// additions
#import "UILabel+ACEToolKit.h"
#import "UIViewController+ACEToolKit.h"

// override default classes
#define UIActionSheet       ACEActionSheet
#define UIAlertView         ACEAlertView

#else

typedef NSImage ACEImage;

#endif


#import "ACEColor+ACEToolKit.h"
#import "ACEImage+ACEToolKit.h"
#import "ACEView+ACEToolKit.h"

#import "ACEPathUtils.h"

#import "NSMutableDictionary+ACEToolKit.h"