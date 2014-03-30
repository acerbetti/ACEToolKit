//
//  ACEPathUtils.h
//  ACEToolKitDemo
//
//  Created by Stefano Acerbetti on 3/30/14.
//  Copyright (c) 2014 Stefano Acerbetti. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ACEPathUtils : NSObject

+ (NSString *)pathForBundleResource:(NSBundle *)bundle withPath:(NSString *)relativePath;
+ (NSString *)pathForDocumentsResource:(NSString *)relativePath;
+ (NSString *)pathForLibraryResource:(NSString *)relativePath;
+ (NSString *)pathForCachesResource:(NSString *)relativePath;

@end
