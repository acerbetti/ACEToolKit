//
//  ACEPathUtils.m
//  ACEToolKitDemo
//
//  Created by Stefano Acerbetti on 3/30/14.
//  Copyright (c) 2014 Stefano Acerbetti. All rights reserved.
//

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

@end
