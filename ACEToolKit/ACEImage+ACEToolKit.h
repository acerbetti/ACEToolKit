// ACEImage+ACEToolKit.h
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
#define ACEImage UIImage
typedef UIImage* ACEImageRef;
#else
#import <Cocoa/Cocoa.h>
#define ACEImage NSImage
typedef NSImage* ACEImageRef;
#endif

#import "ACEColor+ACEToolKit.h"


/**
 * 'ACEImage' is a category to better manage images
 */
@interface ACEImage (ACEToolKit)

/** 
 * Returns a single pixel image with the desidered color
 *
 * @return The image reference
 */
+ (ACEImageRef)imageWithColor:(ACEColorRef)color;

#if TARGET_OS_IOS

/**
 * Make an UIImage referencing a CGImage.
 * 
 * The client should not assume anything about the image, other than that drawing it is equivalent to drawing the CGImage.
 */
- (instancetype)initWithCGImage:(CGImageRef)cgImage size:(CGSize)size;

/**
 * The template image will ignore the colour information of image. And apply the colour according to the way the context is defined.
 *
 * Context is the tintColor of the superview of UIImageView where the image is added.
 *
 * @return The template image
 */
- (ACEImageRef)imageTemplate;

#endif


/// --------------------
/// @name Resize Methods
/// --------------------

/**
 * Return a copy of the image in the desidered size
 *
 * @return The resized image
 */
- (ACEImageRef)resizedImageToSize:(CGSize)dstSize;

/**
 * Return a copy of the image in the desidered size with the option to make it bigger if necessary
 *
 * @params scale If you want to enlarge the image to fit the desidered size
 *
 * @return The resized image
 */
- (ACEImageRef)resizedImageToFitInSize:(CGSize)boundingSize scaleIfSmaller:(BOOL)scale;

@end
