//
//  ACEViewController.m
//  ACEToolKitDemo
//
//  Created by Stefano Acerbetti on 1/22/13.
//  Copyright (c) 2013 Stefano Acerbetti. All rights reserved.
//

#import "ACEViewController.h"
#import "AceToolKit.h"

@interface ACEViewController ()

@end

@implementation ACEViewController

- (IBAction)demoAlertView:(id)sender
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"ACEAlertView"
                                                        message:@"Test with blocks"
                                                       delegate:nil
                                              cancelButtonTitle:@"Cancel"
                                              otherButtonTitles:@"Option 1", @"Option 2", nil];
    
    [alertView showWithSelectBlock:^(NSInteger index, NSString *title) {
        self.messageLabel.text = [NSString stringWithFormat:@"Selected option '%@'", title];
        
    } cancel:^{
        self.messageLabel.text = @"No selection";
    }];
}

@end
