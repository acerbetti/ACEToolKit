// ACEView.h
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


#if TARGET_OS_IOS
#import <UIKit/UIKit.h>
#define ACEView UIView
typedef UIView* ACEViewRef;
#else
#import <Cocoa/Cocoa.h>
#define ACEView NSView
typedef NSView* ACEViewRef;
#endif

@interface ACEView (ACEToolKit)

// shortcuts for frame properties
@property (nonatomic, assign) CGPoint origin;
@property (nonatomic, assign) CGSize size;

// shortcuts for the coords
@property (nonatomic, assign) CGFloat left;
@property (nonatomic, assign) CGFloat top;
@property (nonatomic, assign) CGFloat right;
@property (nonatomic, assign) CGFloat bottom;

// shortcuts for positions
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;

#if !TARGET_OS_IOS
@property (nonatomic, assign) CGPoint center;
#endif

// shortcuts for dimensions
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;

#if TARGET_OS_IOS
@property (nonatomic, readonly) CGFloat orientationWidth;
@property (nonatomic, readonly) CGFloat orientationHeight;
#endif

// shortcuts for subviews
- (ACEViewRef)descendantOrSelfWithClass:(Class)cls;
- (ACEViewRef)ancestorOrSelfWithClass:(Class)cls;
- (void)removeAllSubviews;

@end
