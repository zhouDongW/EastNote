//
//  AccountModel.h
//  EasyNotePro
//
//  Created by zhoudongwei on 2017/12/22.
//  Copyright © 2017年 ZSwift. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "MainDataModel.h"
#import "DataManager.h"

@interface AccountModel : DataManager
//获取所有账号数据
+ (NSMutableArray *)getAllAccountData;

//添加账号信息
+ (BOOL)addAccountInfo:(AccountTable *)account;

//删除一条账号信息
+ (BOOL)delAccountInfo:(NSString *)accountid;

//更新一条账号信息
+ (BOOL)updateAccountInfo:(AccountTable *)account;
@end
