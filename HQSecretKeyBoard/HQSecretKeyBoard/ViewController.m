//
//  ViewController.m
//  HQSecretKeyBoard
//
//  Created by 海灵 on 17/4/19.
//  Copyright © 2017年 com.xianzaishi. All rights reserved.
//

#import "ViewController.h"
#import "HQSecretKeyBoardView.h"
@interface ViewController ()
<
HQSecretKeyBoardViewDelegate
>
@property (nonatomic, strong) HQSecretKeyBoardView *keyBoardView;
@end

@implementation ViewController
- (IBAction)payBtnClick:(id)sender {
    
    HQSecretKeyBoardView *view = [[HQSecretKeyBoardView alloc] initWithFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height, [UIScreen mainScreen].bounds.size.width, 300)];
    view.delegate = self;
    self.keyBoardView = view;
    [self.view addSubview:self.keyBoardView];
    [view beginInputCode];
    [UIView animateWithDuration:0.5 animations:^{
        CGPoint pt = self.keyBoardView.center;
        pt.y -= 500;
        self.keyBoardView.center = pt;
        
    } completion:^(BOOL finished) {
        
    }];

}
- (void)closeBtnClick:(UIButton *)button {
    
}
- (void)forgetBtnClick:(UIButton *)button {
    
}
- (void)getPassword:(NSString *)code {
    NSLog(@"%@",code);
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
