// ACEErrorUtils.h
//
// Copyright (c) 2014 Stefano Acerbetti
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
// THE SOFTWARE.  Copyright (c) 2014 Stefano Acerbetti. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^ACEErrorRetryBlock)(BOOL retry); // returns if the retry block was succesful
typedef void (^ACEErrorUtilsBlock)(NSString *message, NSString *title, NSString *retryLabel, NSString *dismissLabel, ACEErrorRetryBlock retryBlock);

@interface ACEErrorUtils : NSObject

@property (nonatomic, copy) ACEErrorUtilsBlock errorBlock;

// handlers
- (void)handleErrorMessage:(NSString *)message
                 withTitle:(NSString *)title
                retryLabel:(NSString *)retryLabel
              dismissLabel:(NSString *)dismissLabel
             andRetryBlock:(ACEErrorRetryBlock)retryBlock;

- (void)handleErrorTitle:(NSString *)title withMessageFormat:(NSString *)errorFormat, ...;
- (void)handleError:(NSError *)error;


// default implementation
- (void)showSimpleErrorMessage:(NSString *)message
                     withTitle:(NSString *)title
                    retryLabel:(NSString *)retryLabel
                  dismissLabel:(NSString *)dismissLabel
                 andRetryBlock:(ACEErrorRetryBlock)retryBlock;

- (void)showSimpleErrorMessage:(NSString *)message;

+ (instancetype)defaultManager;

@end
