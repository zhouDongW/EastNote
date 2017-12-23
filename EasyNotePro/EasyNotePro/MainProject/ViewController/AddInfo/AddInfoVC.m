//
//  AddInfoVC.m
//  EasyNotePro
//
//  Created by zhoudongwei on 2017/12/21.
//  Copyright © 2017年 ZSwift. All rights reserved.
//

#import "AddInfoVC.h"

#import "AddInfoView.h"

#import "AccountModel.h"
@interface AddInfoVC ()
{
    
}

Strong AddInfoView *addView;
@end

@implementation AddInfoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"账号添加";
    [self leftButtonSetImage:nil];
    
    _addView = [[AddInfoView alloc] init];
    self.view = _addView;
    
    AccountTable *accountM = InitObject(AccountTable);
    
    __weak typeof(self) weakSelf = self;
    self.addView.block_AccountInfo = ^(NSString *title, NSString *type, NSString *account, NSString *password, NSString *descript){
        accountM.title = title;
        //accountM.type = type;
        accountM.account = account;
        accountM.password = password;
        accountM.descript = descript;
        //时间戳当id
        accountM.accountId = [CommonUtils createTimestamp];
        
        BOOL save = [AccountModel addAccountInfo:accountM];
        if (save) {
            //save succeed
            
            weakSelf.tabBarController.selectedIndex = 0;
        }
        else
        {
            //save error
        }
     };
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}



@end
