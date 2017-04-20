//
//  UITextField+backEvent.m
//  HQSecretKeyBoard
//
//  Created by 海灵 on 17/4/20.
//  Copyright © 2017年 com.xianzaishi. All rights reserved.
//

#import "UITextField+backEvent.h"
#import <objc/runtime.h>

NSString * const YXTextFieldDidDeleteBackwardNotification = @"textfield_did_notification";

@implementation UITextField(backEvent)

+ (void)load {
    Method method1 = class_getInstanceMethod([self class], NSSelectorFromString(@"deleteBackward"));
    Method method2 = class_getInstanceMethod([self class], @selector(yx_deleteBackward));
    method_exchangeImplementations(method1, method2);
}

- (void)yx_deleteBackward {
    [self yx_deleteBackward];
    
    if ([self.delegate respondsToSelector:@selector(textFieldDidDeleteBackward:)])
    {
        id <backEventTextFieldDelegate> delegate  = (id<backEventTextFieldDelegate>)self.delegate;
        [delegate textFieldDidDeleteBackward:self];
    }
    
    [[NSNotificationCenter defaultCenter] postNotificationName:YXTextFieldDidDeleteBackwardNotification object:self];
}
@end
