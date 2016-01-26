//
//  ViewController.m
//  ACEToolKitDemoMac
//
//  Created by Stefano Acerbetti on 1/25/16.
//  Copyright © 2016 Stefano Acerbetti. All rights reserved.
//

#import "ViewController.h"

#import "ACEToolKit.h"

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    ACEColorRef color = [ACEColor colorWithHexString:Aquamarine];
    color = RGBCOLOR(23,34,67);
    
    CGFloat h = self.view.height;
    h += 10;
}

- (void)setRepresentedObject:(id)representedObject
{
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

@end
