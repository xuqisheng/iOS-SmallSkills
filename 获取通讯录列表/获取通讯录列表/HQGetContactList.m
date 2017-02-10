//
//  HQGetContactList.m
//  获取通讯录列表
//
//  Created by 海灵 on 16/12/19.
//  Copyright © 2016年 com.xianzaishi. All rights reserved.
//

#import "HQGetContactList.h"
#import <ContactsUI/ContactsUI.h>
@interface HQGetContactList ()
<
CNContactPickerDelegate
>

@property (nonatomic, strong) NSMutableArray *modelArr;

@end
@implementation HQGetContactList


- (NSMutableArray *)modelArr {
    if (_modelArr == nil) {
        _modelArr = [[NSMutableArray alloc] init];
    }
    return _modelArr;
}
- (void)getContactModelArraySuccess:(SuccessReturn)success fail:(Fail)fail{
    CNContactStore *contactStore = [[CNContactStore alloc] init];
    [contactStore requestAccessForEntityType:CNEntityTypeContacts completionHandler:^(BOOL granted, NSError * _Nullable error) {
        if (granted) {
            // 成功
            
            // 1.获取授权状态
            CNAuthorizationStatus status = [CNContactStore authorizationStatusForEntityType:CNEntityTypeContacts];
            // 2.如果不是已经授权,则直接返回
            if (status != CNAuthorizationStatusAuthorized) return;
            
            // 3.获取联系人
            // 3.1.创建联系人仓库
            CNContactStore *store = [[CNContactStore alloc] init];
            
            // 3.2.创建联系人的请求对象
            // keys决定这次要获取哪些信息,比如姓名/电话
            NSArray *fetchKeys = @[CNContactGivenNameKey, CNContactFamilyNameKey, CNContactPhoneNumbersKey,CNContactImageDataKey];
            CNContactFetchRequest *request = [[CNContactFetchRequest alloc] initWithKeysToFetch:fetchKeys];
            
            // 3.3.请求联系人
            NSError *error = nil;
            [store enumerateContactsWithFetchRequest:request error:&error usingBlock:^(CNContact * _Nonnull contact, BOOL * _Nonnull stop) {
                // stop是决定是否要停止
                // 1.获取姓名
                // 2.获取电话号码
                // 3.遍历电话号码
                NSArray *phones = contact.phoneNumbers;
                NSString *firstname = contact.givenName;
                NSString *lastname = contact.familyName;
                NSData *imageData = contact.imageData;
                HQContactModel *model = [[HQContactModel alloc] init];
                model.name = [NSString stringWithFormat:@"%@%@",lastname,firstname];
                model.imageData = imageData;

                for (CNLabeledValue *labelValue in phones) {
                    
                    CNPhoneNumber *phoneNumber = labelValue.value;
                    model.phone = phoneNumber.stringValue;

                }
                
                [self.modelArr addObject:model];

                dispatch_async(dispatch_get_main_queue(), ^{
                    success(self.modelArr);
                });
                
            }];
            
        } else {
            // 失败
            fail(error);
        }
    }];
    
    

}

@end
