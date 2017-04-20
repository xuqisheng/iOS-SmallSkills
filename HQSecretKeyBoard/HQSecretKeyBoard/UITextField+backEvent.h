//
//  UITextField+backEvent.h
//  HQSecretKeyBoard
//
//  Created by 海灵 on 17/4/20.
//  Copyright © 2017年 com.xianzaishi. All rights reserved.
//
#import <UIKit/UIKit.h>
@protocol backEventTextFieldDelegate <UITextFieldDelegate>
@optional
- (void)textFieldDidDeleteBackward:(UITextField *)textField;
@end
@interface UITextField (backEvent)
@property (weak, nonatomic) id<backEventTextFieldDelegate> delegate;
@end
/**
 *  监听删除按钮
 *  object:UITextField
 */
extern NSString * const YXTextFieldDidDeleteBackwardNotification;
