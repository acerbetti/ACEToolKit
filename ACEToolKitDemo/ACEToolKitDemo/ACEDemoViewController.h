//
//  ACEDemoViewController.h
//  ACEToolKitDemo
//
//  Created by Stefano Acerbetti on 1/22/13.
//  Copyright (c) 2016 Stefano Acerbetti. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ACEDemoViewController : UIViewController

@property (nonatomic, unsafe_unretained) IBOutlet UILabel *messageLabel;

- (IBAction)newAlertView:(id)sender;
- (IBAction)blockAlertView:(id)sender;

- (IBAction)delegateActionSheet:(id)sender;
- (IBAction)blockActionSheet:(id)sender;

@end
