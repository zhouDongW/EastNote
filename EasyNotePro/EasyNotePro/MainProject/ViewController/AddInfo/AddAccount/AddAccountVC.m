//
//  AddAccountVC.m
//  EasyNotePro
//
//  Created by zhoudongwei on 2017/12/28.
//  Copyright © 2017年 ZSwift. All rights reserved.
//

#import "AddAccountVC.h"

#import "AddAccountView.h"

@interface AddAccountVC ()
{
    BOOL isEdit;
}

Strong AddAccountView *addView;
@end

@implementation AddAccountVC

- (void)viewDidLoad {
    [super viewDidLoad];
        
        self.title = @"账号添加";
        [self leftButtonSetImage:nil];
        isEdit = YES;
        
        //查看状态
        if (_isShowAccount) {
            [self rightBtnWithText:@"编辑"];
            isEdit = NO;
            self.title = @"账号信息查看";
        }
        
        _addView = [[AddAccountView alloc] init];
        _addView.isCanEdit = isEdit;
        _addView.isSaveUpdate = _isShowAccount;
        self.view = _addView;
        
        _addView.accid = _accountData.accountId;
        [self.addView configTextField:_accountData];
        
        AccountTable *accountM = InitObject(AccountTable);
        __weak typeof(self) weakSelf = self;
        //数据保存
        self.addView.block_AccountInfo = ^(NSString *title, NSString *type, NSString *account, NSString *password, NSString *descript){
            accountM.title = title;
            accountM.type = 0;
            accountM.account = account;
            accountM.password = password;
            accountM.descript = descript;
            //时间戳当id
            accountM.accountId = [CommonUtils createTimestamp];
            
            BOOL save = [AccountModel addAccountInfo:accountM];
            if (save) {
                //save succeed
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"tip" message:@"save succed" delegate:self cancelButtonTitle:@"sure" otherButtonTitles:nil, nil];
                [alert show];
                weakSelf.tabBarController.selectedIndex = 0;
            }
            else
            {
                //save error
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"tip" message:@"save fail" delegate:self cancelButtonTitle:@"sure" otherButtonTitles:nil, nil];
                [alert show];
            }
        };
        
        //数据更新
        self.addView.block_update = ^(NSString *accountid, NSString *title, NSString *type, NSString *account, NSString *password, NSString *descript) {
            accountM.title = title;
            accountM.type = 0;
            accountM.account = account;
            accountM.password = password;
            accountM.descript = descript;
            accountM.accountId = accountid;
            
            BOOL update = [AccountModel updateAccountInfo:accountM];
            if (update) {
                //save succeed
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"tip" message:@"save succed" delegate:self cancelButtonTitle:@"sure" otherButtonTitles:nil, nil];
                [alert show];
                [weakSelf.navigationController popViewControllerAnimated:YES];
            }
            else
            {
                //save error
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"tip" message:@"save fail" delegate:self cancelButtonTitle:@"sure" otherButtonTitles:nil, nil];
                [alert show];
            }
        };
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

    - (void)rightButtonClick:(UIButton *)sender
    {
        [self rightBtnWithText:nil];
        
        isEdit = YES;
        _addView.isCanEdit = isEdit;
        [_addView changeTextFieldEdit];
    }

@end
