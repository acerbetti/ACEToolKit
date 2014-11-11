// ACEAlertView.m
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
// THE SOFTWARE.  Copyright (c) 2014 Stefano Acerbetti. All rights reserved.
//


#import "ACEToolKit.h"

// disable the override method
#ifdef UIAlertView
#undef UIAlertView
#endif

#pragma mark - UIAlertViewHelper

@interface ACEAlertAction ()
@property (nonatomic, strong) NSString *title;
@property (nonatomic, assign) UIAlertActionStyle style;
@property (nonatomic, copy) void (^handler)(ACEAlertAction *action);

@property (nonatomic, strong) UIAlertAction *alertAction;
@end

#pragma mark -

@implementation ACEAlertAction

+ (instancetype)actionWithTitle:(NSString *)title style:(UIAlertActionStyle)style handler:(void (^)(ACEAlertAction *action))handler
{
    return [[ACEAlertAction alloc] initWithTitle:title style:style handler:handler];
}

- (instancetype)initWithTitle:(NSString *)title style:(UIAlertActionStyle)style handler:(void (^)(ACEAlertAction *action))handler
{
    self = [super init];
    if (self) {
        self.title = title;
        self.style = style;
        self.handler = handler;
        
        if ([UIAlertController class]) {
            self.alertAction = [UIAlertAction actionWithTitle:title style:style handler:^(UIAlertAction *alertAction) {
                handler(self);
            }];
        }
    }
    
    return self;
}

- (id)copyWithZone:(NSZone *)zone
{
    ACEAlertAction *alertAction = [self.class new];
    alertAction.title = self.title;
    alertAction.style = self.style;
    alertAction.handler = self.handler;
    alertAction.alertAction = self.alertAction;
    return alertAction;
}

- (void)dealloc
{
    self.title = nil;
    self.style = nil;
    self.handler = nil;
    self.alertAction = nil;
#if !ACE_HAS_ARC
    [super dealloc];
#endif
}


#pragma mark Setter

- (void)setEnabled:(BOOL)enabled
{
    _enabled = enabled;
    
    if (self.alertAction != nil) {
        self.alertAction.enabled = enabled;
    }
}

@end


#pragma mark - UIAlertViewHelper

@interface UIAlertViewHelper : NSObject<UIAlertViewDelegate>
@property (nonatomic, strong) ACEAlertView *container;
@property (nonatomic, strong) UIAlertView *alertView;
@property (nonatomic, strong) NSMutableArray *internalActions;
@end

#pragma mark -

@implementation UIAlertViewHelper

+ (instancetype)alertViewWithContainer:(ACEAlertView *)container
{
    return [[UIAlertViewHelper alloc] initWithContainer:container];
}

- (instancetype)initWithContainer:(ACEAlertView *)container
{
    self = [super init];
    if (self) {
        self.container = container;
        
        self.alertView = [UIAlertView new];
        self.alertView.delegate = self;
        
        self.internalActions = [NSMutableArray new];
    }
    return self;
}

- (void)setTitle:(NSString *)title
{
    self.alertView.title = title;
}

- (void)setMessage:(NSString *)message
{
    self.alertView.message = message;
}

- (NSArray *)actions
{
    return [self.internalActions copy];
}

- (void)addAction:(ACEAlertAction *)action
{
    NSInteger buttonIndex = [self.alertView addButtonWithTitle:action.title];
    if (action.style == UIAlertActionStyleCancel) {
        self.alertView.cancelButtonIndex = buttonIndex;
    }
    
    [self.internalActions addObject:action];
}

- (void)showInViewController:(UIViewController *)controller
{
    [self.alertView show];
}

- (void)dealloc
{
    self.container = nil;
    self.alertView = nil;
    self.internalActions = nil;
#if !ACE_HAS_ARC
    [super dealloc];
#endif
}


#pragma mark - Alert View Delegate

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    ACEAlertAction *alertAction = self.internalActions[buttonIndex];
    void (^callback)(ACEAlertAction *action) = alertAction.handler;
    if (callback) {
        callback(alertAction);
        
        // clean the memory loop
        self.container = nil;
    }
}

@end


#pragma mark - UIAlertControllerHelper

@interface UIAlertControllerHelper : UIAlertController

@end

#pragma mark -

@implementation UIAlertControllerHelper

+ (instancetype)alertView
{
    return [UIAlertControllerHelper alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleAlert];
}

- (NSString *)buttonTitleAtIndex:(NSInteger)buttonIndex
{
    UIAlertAction *action = self.actions[buttonIndex];
    return action.title;
}

- (void)addAction:(ACEAlertAction *)action
{
    [super addAction:action.alertAction];
}

- (void)showInViewController:(UIViewController *)controller
{
    if (controller == nil) {
        // get the root controller on the main window
        UIWindow *window = [[UIApplication sharedApplication] windows][0];
        controller = window.rootViewController;
    }
    [controller presentViewController:self animated:YES completion:nil];
}

- (void)dealloc
{
    
}

@end


#pragma mark - ACEAlertView

@interface ACEAlertView ()
@property (nonatomic, copy) SelectBlock selectBlock;
@property (nonatomic, copy) DismissBlock cancelBlock;
@property (nonatomic, strong) id alertController;
@end

#pragma mark -

@implementation ACEAlertView

- (instancetype)init
{
    self = [super init];
    if (self) {
        if ([UIAlertController class]) {
            // iOS > 7.x
            self.alertController = [UIAlertControllerHelper alertView];
            
        } else {
            // iOS <= 7.x
            self.alertController = [UIAlertViewHelper alertViewWithContainer:self];
        }
    }
    return self;
}

- (instancetype)initWithTitle:(NSString *)title
            message:(NSString *)message
           delegate:(id)delegate
  cancelButtonTitle:(NSString *)cancelButtonTitle
  otherButtonTitles:(NSString *)otherButtonTitles, ...
{
    self = [self init];
    if (self != nil) {
        
        // set the properties
        self.title = title;
        self.message = message;
        
        if (otherButtonTitles != nil) {
            
            [self addButtonWithTitle:otherButtonTitles];
            
            // add the other buttons from the list
            va_list args;
            va_start(args, otherButtonTitles);
            
            NSString* buttonTitle;
            while ((buttonTitle = va_arg(args, NSString *))) {
                [self addButtonWithTitle:buttonTitle];
            }
        }
        
        if (cancelButtonTitle.length > 0) {
            [self addButtonWithTitle:cancelButtonTitle style:UIAlertActionStyleCancel];
        }
    }
    return self;
}

- (NSInteger)addButtonWithTitle:(NSString *)title
{
    return [self addButtonWithTitle:title style:UIAlertActionStyleDefault];
}

- (NSInteger)addButtonWithTitle:(NSString *)title style:(UIAlertActionStyle)style
{
    __weak __typeof(self)weakSelf = self;
    __block NSInteger buttonIndex = self.actions.count;
    
    [self addAction:[ACEAlertAction actionWithTitle:title
                                              style:style
                                            handler:^(ACEAlertAction *action) {
                                                if (style == UIAlertActionStyleCancel && weakSelf.cancelBlock) {
                                                    weakSelf.cancelBlock();
                                                    
                                                } else if (style == UIAlertActionStyleDefault && weakSelf.selectBlock) {
                                                    weakSelf.selectBlock(buttonIndex, title);
                                                }
                                            }]];
    return buttonIndex;
}


#pragma mark - Show

- (void)showWithSelectBlock:(SelectBlock)select cancel:(DismissBlock)cancel
{
    self.selectBlock = select;
    self.cancelBlock = cancel;
    [self show];
}

- (void)show
{
    [self showInViewController:nil];
}


#pragma mark - Forwarding

- (id)forwardingTargetForSelector:(SEL)selector
{
    // Dispatch all messages from the Proxy category to the alert controller
    if ([self.alertController respondsToSelector:selector]) {
        return self.alertController;
    }
    
    return [super forwardingTargetForSelector:selector];
}

- (void)dealloc
{
    self.alertController = nil;
    self.selectBlock = nil;
    self.cancelBlock = nil;
#if !ACE_HAS_ARC
    [super dealloc];
#endif
}

@end
