//
//  AddInfoView.h
//  EasyNotePro
//
//  Created by zhoudongwei on 2017/12/22.
//  Copyright © 2017年 ZSwift. All rights reserved.
//

#import "BaseView.h"
#import "AccountModel.h"

typedef void(^dataSave)(NSString *title, NSString *type, NSString *account, NSString *password, NSString *descript);
typedef void(^dataUpdate)(NSString *accountid, NSString *title, NSString *type, NSString *account, NSString *password, NSString *descript);
@interface AddInfoView : BaseView
Strong NSString *accid;
Copy dataSave block_AccountInfo;
Copy dataUpdate block_update;

Assign BOOL isCanEdit;  //yes 可编辑
Assign BOOL isSaveUpdate; //yes 更新 no 保存

- (void)configTextField:(AccountTable *)model;
- (void)changeTextFieldEdit;
@end
