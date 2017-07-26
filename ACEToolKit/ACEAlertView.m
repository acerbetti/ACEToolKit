// ACEAlertView.m
// 
// Copyright (c) 2016 Stefano Acerbetti
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
// THE SOFTWARE.  Copyright (c) 2016 Stefano Acerbetti. All rights reserved.
//


#import "ACEAlertView.h"
#import "UIAlertController+Window.h"

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
    self.handler = nil;
    self.alertAction = nil;
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

- (void)setAlertViewStyle:(UIAlertViewStyle)style
{
    self.alertView.alertViewStyle = style;
}

- (UIAlertViewStyle)alertViewStyle
{
    return self.alertView.alertViewStyle;
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

- (void)show
{
    [self.alertView show];
}

- (UITextField *)textFieldAtIndex:(NSInteger)textFieldIndex
{
    return [self.alertView textFieldAtIndex:textFieldIndex];
}

- (void)dealloc
{
    self.container = nil;
    self.alertView = nil;
    self.internalActions = nil;
}


#pragma mark - Alert View Delegate

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    ACEAlertAction *alertAction = self.internalActions[buttonIndex];
    void (^callback)(ACEAlertAction *action) = alertAction.handler;
    if (callback) {
        callback(alertAction);
    }
}

@end


#pragma mark - UIAlertControllerHelper

@interface UIAlertControllerHelper : UIAlertController
@property (nonatomic, strong) ACEAlertView *container;
@end

#pragma mark -

@implementation UIAlertControllerHelper

+ (instancetype)alertViewWithContainer:(ACEAlertView *)container
{
    UIAlertControllerHelper *helper = [UIAlertControllerHelper alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleAlert];
    helper.container = container;
    return helper;
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

- (void)setAlertViewStyle:(UIAlertViewStyle)style
{
    switch (style) {
        case UIAlertViewStylePlainTextInput:
            [self addTextFieldWithConfigurationHandler:nil];
            break;
            
        case UIAlertViewStyleSecureTextInput:
            [self addTextFieldWithConfigurationHandler:^(UITextField *textField) {
                textField.secureTextEntry = YES;
            }];
            break;
            
        case UIAlertViewStyleLoginAndPasswordInput:
            [self addTextFieldWithConfigurationHandler:nil];
            [self addTextFieldWithConfigurationHandler:^(UITextField *textField) {
                textField.secureTextEntry = YES;
            }];
            break;
            
        default:
            break;
    }
}

- (UITextField *)textFieldAtIndex:(NSInteger)textFieldIndex
{
    return self.textFields[textFieldIndex];
}

- (void)dealloc
{
    self.container = nil;
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
            self.alertController = [UIAlertControllerHelper alertViewWithContainer:self];
            
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
        self.title = title ?: @"";
        self.message = message;
        
        if (cancelButtonTitle.length > 0) {
            [self addButtonWithTitle:cancelButtonTitle style:UIAlertActionStyleCancel];
        }
        
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
}

@end
