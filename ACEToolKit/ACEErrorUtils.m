// ACEErrorUtils.m
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

@implementation ACEErrorUtils

+ (instancetype)defaultManager
{
    static ACEErrorUtils *_instance = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        
        // try to load the previous context
        _instance = [self new];
    });
    
    return _instance;
}


#pragma mark - Error handlers

- (void)handleError:(NSError *)error
        withMessage:(NSString *)message
           andTitle:(NSString *)title
         retryLabel:(NSString *)retryLabel
       dismissLabel:(NSString *)dismissLabel
      andRetryBlock:(ACEErrorRetryBlock)retryBlock
{
    if (self.errorBlock) {
        // custom implementation
        self.errorBlock(error,
                        message ?: error.localizedDescription,
                        title ?: self.defaultErrorTitle,
                        retryLabel,
                        dismissLabel,
                        retryBlock);
        
    } else {
        // simple error message
        [self showSimpleErrorMessage:message ?: error.localizedDescription
                           withTitle:title ?: self.defaultErrorTitle
                          retryLabel:retryLabel
                        dismissLabel:dismissLabel
                       andRetryBlock:retryBlock];
    }
}

- (void)handleError:(NSError *)error
        withMessage:(NSString *)message
           andTitle:(NSString *)title
{
    [self handleError:error
          withMessage:message
             andTitle:title
           retryLabel:nil
         dismissLabel:nil
        andRetryBlock:nil];
}

- (void)handleErrorTitle:(NSString *)title withMessageFormat:(NSString *)errorFormat, ...
{
    NSString *errorMessage;
    
    if (errorFormat) {
        va_list args;
        va_start(args, errorFormat);
        errorMessage = [[NSString alloc] initWithFormat:errorFormat arguments:args];
        va_end(args);
    }
    
    [self handleError:nil
          withMessage:errorMessage
             andTitle:title
           retryLabel:nil
         dismissLabel:nil
        andRetryBlock:nil];
}

- (void)handleError:(NSError *)error
{
    [self handleError:error
          withMessage:error.localizedDescription
             andTitle:self.defaultErrorTitle
           retryLabel:nil
         dismissLabel:nil
        andRetryBlock:nil];
}


#pragma mark - Default Alert Message

- (void)showSimpleErrorMessage:(NSString *)message
                     withTitle:(NSString *)title
                    retryLabel:(NSString *)retryLabel
                  dismissLabel:(NSString *)dismissLabel
                 andRetryBlock:(ACEErrorRetryBlock)retryBlock
{
    UIAlertView *alertView =
    [[UIAlertView alloc] initWithTitle:title
                               message:message
                              delegate:nil
                     cancelButtonTitle:nil
                     otherButtonTitles:nil];
    
    // add the retry block if necessary
    if (retryLabel.length > 0 && retryBlock != nil) {
        [alertView addAction:[ACEAlertAction actionWithTitle:retryLabel
                                                       style:UIAlertActionStyleDefault
                                                     handler:^(ACEAlertAction *action) {
                                                         retryBlock(YES);
                                                     }]];
    }
    
    [alertView addAction:[ACEAlertAction actionWithTitle:dismissLabel
                                                   style:UIAlertActionStyleCancel
                                                 handler:^(ACEAlertAction *action) {
                                                     retryBlock(NO);
                                                 }]];
    
    [alertView show];
}

- (void)showSimpleErrorMessage:(NSString *)message
                     withTitle:(NSString *)title
{
    return [self showSimpleErrorMessage:message
                              withTitle:title
                             retryLabel:nil
                           dismissLabel:@"OK"
                          andRetryBlock:nil];
}

@end
