//
//  AccountVC.m
//  EasyNotePro
//
//  Created by zhoudongwei on 2017/12/21.
//  Copyright © 2017年 ZSwift. All rights reserved.
//

#import "AccountVC.h"
#import "AddInfoVC.h"

#import "AccountView.h"

#import "AccountModel.h"

@interface AccountVC ()
{
    NSMutableArray *dbGetArr;
}

Strong AccountView *mainView;
@end

@implementation AccountVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"账号";
    
    _mainView = [[AccountView alloc] init];
    _mainView.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight);
    self.view = _mainView;
    
    __weak typeof(self) weakSelf = self;
    _mainView.tableView.mj_header= [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            dbGetArr = [AccountModel getAllAccountData];
            [weakSelf.mainView configAccountView:dbGetArr];
            
            [_mainView.tableView.mj_header endRefreshing];
        });
        
    }];
    
    
    dbGetArr = [AccountModel getAllAccountData];
    [_mainView configAccountView:dbGetArr];
    
    _mainView.pBlock = ^(NSInteger index){
        AddInfoVC *avc = InitObject(AddInfoVC);
        avc.isShowAccount = YES;
        avc.accountData = [dbGetArr objectAtIndex:index];
        [weakSelf pushViewController:avc animated:YES];
    };
    
    _mainView.deBlock = ^(NSString *accountid) {
        BOOL del = [AccountModel delAccountInfo:accountid];
        if (del) {
            //
        }
        else
        {
            
        }
    };
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    MJRefreshHeader *header = [MJRefreshHeader headerWithRefreshingBlock:^{
        dbGetArr = [AccountModel getAllAccountData];
        [_mainView configAccountView:dbGetArr];
    }];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
}

@end
