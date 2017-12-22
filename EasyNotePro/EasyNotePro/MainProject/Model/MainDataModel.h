//
//  MainDataModel.h
//  EasyNotePro
//
//  Created by zhoudongwei on 2017/12/21.
//  Copyright © 2017年 ZSwift. All rights reserved.
//

#import "BaseModel.h"

@interface MainDataModel : BaseModel

@end

@interface AccountTable :NSObject
Strong NSString *accountId;
Assign NSInteger type;
Strong NSString *title;
Strong NSString *account;
Strong NSString *password;
Strong NSString *descript;

@end

@interface OtherTable :NSObject
Strong NSString *otherId;
Assign NSInteger type;
Strong NSString *content;
Strong NSString *addInfo;

@end

@interface UserInfo :NSObject
Strong NSString *userName;
Assign BOOL *isFemal;
Strong NSString *introduce;
@end



