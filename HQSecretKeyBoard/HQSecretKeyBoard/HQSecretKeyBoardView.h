//
//  HQSecretKeyBoardView.h
//  HQSecretKeyBoard
//
//  Created by 海灵 on 17/4/19.
//  Copyright © 2017年 com.xianzaishi. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HQSecretKeyBoardView;
@protocol HQSecretKeyBoardViewDelegate <NSObject>

- (void)getPassword:(NSString *)code;
- (void)closeBtnClick:(UIButton *)button;
- (void)forgetBtnClick:(UIButton *)button;

@end

@interface HQSecretKeyBoardView : UIView
// 控件
@property (weak, nonatomic) IBOutlet UITextField *tf1;
@property (weak, nonatomic) IBOutlet UITextField *tf2;
@property (weak, nonatomic) IBOutlet UITextField *tf3;
@property (weak, nonatomic) IBOutlet UITextField *tf4;
@property (weak, nonatomic) IBOutlet UITextField *tf5;
@property (weak, nonatomic) IBOutlet UITextField *tf6;
// 约束
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *widthCons1;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *widthCons2;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *widthCons3;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *widthCons4;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *widthCons5;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *widthCons6;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leftCons;
// 代理
@property (nonatomic, assign) id<HQSecretKeyBoardViewDelegate>delegate;

- (void)beginInputCode;

- (IBAction)closeBtnClick:(id)sender;
- (IBAction)forgetBtnClick:(id)sender;

@end
