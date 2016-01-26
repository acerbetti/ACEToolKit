//
//  ACEViewController.m
//  ACEToolKitDemo
//
//  Created by Stefano Acerbetti on 1/22/13.
//  Copyright (c) 2016 Stefano Acerbetti. All rights reserved.
//

#import "ACEViewController.h"

@interface ACEViewController ()<UIAlertViewDelegate, UIActionSheetDelegate>

@end

@implementation ACEViewController

#pragma mark - Alert View

- (IBAction)newAlertView:(id)sender
{
    UIAlertView *alertView = [UIAlertView new];
    alertView.title = @"ACEAlertView";
    alertView.message = @"Test with blocks";
    
    [alertView addAction:[ACEAlertAction actionWithTitle:@"Danger here"
                                                   style:UIAlertActionStyleDestructive
                                                 handler:^(ACEAlertAction *action) {
                                                     self.messageLabel.text = @"Destructive action";
                                                 }]];
    
    [alertView addAction:[ACEAlertAction actionWithTitle:@"Cancel"
                                                   style:UIAlertActionStyleCancel
                                                 handler:^(ACEAlertAction *action) {
                                                     self.messageLabel.text = @"No selection";
                                                 }]];
    
    [alertView addAction:[ACEAlertAction actionWithTitle:@"Option 1"
                                                   style:UIAlertActionStyleDefault
                                                 handler:^(ACEAlertAction *action) {
                                                     self.messageLabel.text = [NSString stringWithFormat:@"Selected option '%@'", action.title];
                                                 }]];
    
    [alertView addAction:[ACEAlertAction actionWithTitle:@"Option 2"
                                                   style:UIAlertActionStyleDefault
                                                 handler:^(ACEAlertAction *action) {
                                                     self.messageLabel.text = [NSString stringWithFormat:@"Selected option '%@'", action.title];
                                                 }]];
    
    [alertView show];
}

- (IBAction)blockAlertView:(id)sender
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"ACEAlertView"
                                                        message:@"Test with blocks"
                                                       delegate:nil
                                              cancelButtonTitle:@"Cancel"
                                              otherButtonTitles:@"Option 1", @"Option 2", nil];
    
    [alertView showWithSelectBlock:^BOOL(NSInteger index, NSString *title) {
        self.messageLabel.text = [NSString stringWithFormat:@"Selected option '%@'", title];
        return NO;
        
    } cancel:^BOOL{
        self.messageLabel.text = @"No selection";
        return NO;
        
    }];
}


#pragma mark - Action Sheet

- (IBAction)delegateActionSheet:(id)sender
{
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"ACEActionSheet"
                                                             delegate:self
                                                    cancelButtonTitle:@"Cancel"
                                               destructiveButtonTitle:@"Danger here"
                                                    otherButtonTitles:@"Option 1", @"Option 2", nil];
    
    [actionSheet showInView:self.view];
}

- (IBAction)blockActionSheet:(id)sender
{
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"ACEActionSheet"
                                                             delegate:self
                                                    cancelButtonTitle:@"Cancel"
                                               destructiveButtonTitle:@"Danger here"
                                                    otherButtonTitles:@"Option 1", @"Option 2", nil];
    
    // set the blocks
    actionSheet.selectBlock = ^BOOL(NSInteger index, NSString *title) {
        self.messageLabel.text = [NSString stringWithFormat:@"Selected option '%@'", title];
        return NO;
    };
    
    actionSheet.cancelBlock = ^BOOL{
        self.messageLabel.text = @"No selection";
        return NO;
    };
    
    actionSheet.destructiveBlock = ^BOOL{
        self.messageLabel.text = @"Destructive action";
        return NO;
    };
    
    [actionSheet showInView:self.view];

}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (actionSheet.destructiveButtonIndex == buttonIndex) {
        self.messageLabel.text = @"Destructive action";
        
    } else if (actionSheet.cancelButtonIndex == buttonIndex) {
        self.messageLabel.text = @"No selection";
        
    } else {
        self.messageLabel.text = [NSString stringWithFormat:@"Selected option '%@'", [actionSheet buttonTitleAtIndex:buttonIndex]];
    }
}

@end
