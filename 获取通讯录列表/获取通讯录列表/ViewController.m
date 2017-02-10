//
//  ViewController.m
//  获取通讯录列表
//
//  Created by 海灵 on 16/12/19.
//  Copyright © 2016年 com.xianzaishi. All rights reserved.
//
#import "ViewController.h"
#import "HQGetContactList.h"
#import "HQContactModel.h"
@interface ViewController ()
<
UITableViewDataSource,
UITableViewDelegate
>

@property (nonatomic, strong) NSArray *resultArray;

@end

@implementation ViewController
- (NSArray *)resultArray {
    if (_resultArray == nil) {
        _resultArray = [[NSArray alloc] init];
    }
    return _resultArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.contactTbv registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    self.contactTbv.rowHeight = 60;
    
    
    HQGetContactList *list = [[HQGetContactList alloc] init];
    [list getContactModelArraySuccess:^(NSArray *modelArray) {
        
        self.resultArray = modelArray;
        [self.contactTbv reloadData];
        
    } fail:^(NSError *error) {
        NSLog(@"%@",error);
    }];
    
    
    
}

#pragma mark uitableviewdelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.resultArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle  reuseIdentifier:@"cell"];
    
    HQContactModel *model = self.resultArray[indexPath.row];
    
    cell.imageView.image = [UIImage imageWithData:model.imageData];
    cell.textLabel.text = model.name;
    cell.detailTextLabel.text = model.phone;
    return cell;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
