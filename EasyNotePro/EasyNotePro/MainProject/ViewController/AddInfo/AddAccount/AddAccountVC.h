//
//  AddAccountVC.h
//  EasyNotePro
//
//  Created by zhoudongwei on 2017/12/28.
//  Copyright © 2017年 ZSwift. All rights reserved.
//

#import "BaseViewController.h"
#import "AccountModel.h"
@interface AddAccountVC : BaseViewController
//yes 为accountVC跳转过来，textfield不可修改
Assign BOOL isShowAccount;

Strong AccountTable *accountData;
@end
