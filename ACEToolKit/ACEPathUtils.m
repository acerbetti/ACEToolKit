// ACEPathUtils.m
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

@implementation ACEPathUtils

+ (NSString *)pathForBundleResource:(NSBundle *)bundle withPath:(NSString *)relativePath
{
    NSString *resourcePath = [(nil == bundle ? [NSBundle mainBundle] : bundle) resourcePath];
    return [resourcePath stringByAppendingPathComponent:relativePath];
}

+ (NSString *)pathForDocumentsResource:(NSString *)relativePath
{
    static NSString *documentsPath = nil;
    if (nil == documentsPath) {
        NSArray* dirs = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        documentsPath = [[dirs objectAtIndex:0] copy];
    }
    return [documentsPath stringByAppendingPathComponent:relativePath];
}

+ (NSString *)pathForLibraryResource:(NSString *)relativePath
{
    static NSString *libraryPath = nil;
    if (nil == libraryPath) {
        NSArray* dirs = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
        libraryPath = [[dirs objectAtIndex:0] copy];
    }
    return [libraryPath stringByAppendingPathComponent:relativePath];
}

+ (NSString *)pathForCachesResource:(NSString *)relativePath
{
    static NSString* cachesPath = nil;
    if (nil == cachesPath) {
        NSArray* dirs = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
        cachesPath = [[dirs objectAtIndex:0] copy];
    }
    return [cachesPath stringByAppendingPathComponent:relativePath];
}

+ (NSString *)pathForTemporaryResource:(NSString *)relativePath
{
    return [NSTemporaryDirectory() stringByAppendingPathComponent:relativePath];
}

@end
