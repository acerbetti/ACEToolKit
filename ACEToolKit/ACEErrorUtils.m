// ACEErrorUtils.m
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
// THE SOFTWARE.

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

- (void)handleErrorFormat:(NSString *)errorFormat, ...
{
    if (errorFormat) {
        va_list args;
        va_start(args, errorFormat);
        
        NSString *errorMessage = [[NSString alloc] initWithFormat:errorFormat arguments:args];
        [self handleError:nil retryBlock:nil withCustomFormat:errorMessage];
        
        va_end(args);
    }
}

- (void)handleError:(NSError *)error retryBlock:(ACEErrorRetryBlock)retryBlock withCustomFormat:(NSString *)errorFormat, ...
{
    if (errorFormat) {
        va_list args;
        va_start(args, errorFormat);
        
        NSString *errorMessage = [[NSString alloc] initWithFormat:errorFormat arguments:args];
        if (self.errorBlock) {
            // custom implementation
            self.errorBlock(error, retryBlock, errorMessage);
            
        } else {
            // simple error message
            [self showSimpleErrorMessage:errorMessage withTitle:@"Error" retryBlock:retryBlock];
        }
        
        va_end(args);
        
    } else if (error != nil) {
        [self handleError:error];
    }
}

- (void)handleError:(NSError *)error retryBlock:(ACEErrorRetryBlock)retryBlock
{
    [self handleError:error retryBlock:retryBlock withCustomFormat:error.localizedDescription];
}

- (void)handleError:(NSError *)error
{
    [self handleError:error retryBlock:nil];
}


#pragma mark - Default Alert Message

- (void)showSimpleErrorMessage:(NSString *)message withTitle:(NSString *)title retryBlock:(ACEErrorRetryBlock)retryBlock
{
    UIAlertView *alertView =
    [[UIAlertView alloc] initWithTitle:title
                                message:message
                               delegate:nil
                      cancelButtonTitle:@"OK"
                     otherButtonTitles:nil];
    
    // add the retry block if necessary
    if (retryBlock != nil) {
        [alertView addButtonWithTitle:@"Retry"];
    }
    
    [alertView showWithSelectBlock:^BOOL(NSInteger index, NSString *title) {
        // try to call the retry block
        if (!retryBlock()) {
            // failed again, show the same error message
            [self showSimpleErrorMessage:message withTitle:title retryBlock:retryBlock];
        }
        return NO;
        
    } cancel:nil];
}

@end
