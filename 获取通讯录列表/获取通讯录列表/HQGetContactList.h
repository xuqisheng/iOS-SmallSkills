//
//  HQGetContactList.h
//  获取通讯录列表
//
//  Created by 海灵 on 16/12/19.
//  Copyright © 2016年 com.xianzaishi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HQContactModel.h"

typedef void(^SuccessReturn)(NSArray *modelArray);
typedef void(^Fail)(NSError * error);

@interface HQGetContactList : NSObject

- (void)getContactModelArraySuccess:(SuccessReturn)success fail:(Fail)fail;

@end
