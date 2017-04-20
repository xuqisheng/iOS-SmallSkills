//
//  HQSecretKeyBoardView.m
//  HQSecretKeyBoard
//
//  Created by 海灵 on 17/4/19.
//  Copyright © 2017年 com.xianzaishi. All rights reserved.
//

#import "HQSecretKeyBoardView.h"
#import "UITextField+backEvent.h"
@interface HQSecretKeyBoardView()
<
UITextFieldDelegate,
backEventTextFieldDelegate
>
{
    int tag;
}
@property (nonatomic, strong) NSMutableString *code;
@end
@implementation HQSecretKeyBoardView
- (NSMutableString *)code {
    if (_code == nil) {
        _code = [[NSMutableString alloc] init];
    }
    return _code;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    tag = 10;
    self.widthCons1.constant *= [UIScreen mainScreen].bounds.size.width / 323;
    self.widthCons2.constant *= [UIScreen mainScreen].bounds.size.width / 323;
    self.widthCons3.constant *= [UIScreen mainScreen].bounds.size.width / 323;
    self.widthCons4.constant *= [UIScreen mainScreen].bounds.size.width / 323;
    self.widthCons5.constant *= [UIScreen mainScreen].bounds.size.width / 323;
    self.widthCons6.constant *= [UIScreen mainScreen].bounds.size.width / 323;
    self.leftCons.constant *= [UIScreen mainScreen].bounds.size.width / 323;
    self.tf1.layer.borderColor = [UIColor groupTableViewBackgroundColor].CGColor;
    self.tf1.layer.borderWidth = 0.5;

    self.tf2.layer.borderColor = [UIColor groupTableViewBackgroundColor].CGColor;
    self.tf2.layer.borderWidth = 0.5;

    self.tf3.layer.borderColor = [UIColor groupTableViewBackgroundColor].CGColor;
    self.tf3.layer.borderWidth = 0.5;

    self.tf4.layer.borderColor = [UIColor groupTableViewBackgroundColor].CGColor;
    self.tf4.layer.borderWidth = 0.5;

    self.tf5.layer.borderColor = [UIColor groupTableViewBackgroundColor].CGColor;
    self.tf5.layer.borderWidth = 0.5;

    self.tf6.layer.borderColor = [UIColor groupTableViewBackgroundColor].CGColor;
    self.tf6.layer.borderWidth = 0.5;

    


}
- (instancetype)initWithFrame:(CGRect)frame {
    if ((self = [super initWithFrame:frame])) {
        self = [[[NSBundle mainBundle] loadNibNamed:@"HQSecretKeyBoardView"owner:nil options:nil] lastObject];
        self.frame = frame;
        UITextField *tf1 = [self viewWithTag:tag];
        [tf1 becomeFirstResponder];
    }
    return self;
}
- (void)beginInputCode {
    
    
}

- (IBAction)closeBtnClick:(id)sender {
    if ([self.delegate respondsToSelector:@selector(closeBtnClick:)]) {
        [self.delegate closeBtnClick:sender];
    }

}

- (IBAction)forgetBtnClick:(id)sender {
    if ([self.delegate respondsToSelector:@selector(forgetBtnClick:)]) {
        [self.delegate forgetBtnClick:sender];
    }

}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {

    if (string.length != 0) {
        [self.code appendString:string];
    }
    if (string.length == 0) {
        [self.code deleteCharactersInRange:NSMakeRange(self.code.length - 1, 1)];
    }else {
        if (range.location == 1) {
            tag ++;
            [textField resignFirstResponder];
            if (self.code.length == 6) {
                UITextField *tf = [self viewWithTag:tag];
                tf.text = string;
                NSLog(@"%@",self.code);
                // 在此处理密码相关的东西
                if ([self.delegate respondsToSelector:@selector(getPassword:)]) {
                    [self.delegate getPassword:self.code];
                }

                
            }else {
                UITextField *tf = [self viewWithTag:tag];
                [tf becomeFirstResponder];
            }
        }
    }
    return YES;
}
- (void)textFieldDidDeleteBackward:(UITextField *)textField {
    if (tag > 10) {
        tag --;
    }
    UITextField *tf = [self viewWithTag:textField.tag - 1];
    [tf becomeFirstResponder];
}
@end
