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

- (void)handleError:(NSError *)error withCustomFormat:(NSString *)errorFormat, ...
{
    if (errorFormat) {
        va_list args;
        va_start(args, errorFormat);
        
        NSString *errorMessage = [[NSString alloc] initWithFormat:errorFormat arguments:args];
        if (self.errorBlock) {
            // custom implementation
            self.errorBlock(error, errorMessage);
            
        } else {
            // simple error message
            [self showSimpleErrorMessage:errorMessage withTitle:@"Error"];
        }
        
        va_end(args);
        
    } else if (error != nil) {
        [self handleError:error];
    }
}

- (void)handleError:(NSError *)error
{
    [self handleError:error withCustomFormat:error.localizedDescription];
}

- (void)showSimpleErrorMessage:(NSString *)message withTitle:(NSString *)title
{
    [[[UIAlertView alloc] initWithTitle:title
                                message:message
                               delegate:nil
                      cancelButtonTitle:@"OK"
                      otherButtonTitles:nil] show];
}

@end
