//
//  AccountVC.m
//  EasyNotePro
//
//  Created by zhoudongwei on 2017/12/21.
//  Copyright © 2017年 ZSwift. All rights reserved.
//

#import "AccountVC.h"

#import "AccountView.h"

#import "AccountModel.h"

@interface AccountVC ()
{
    
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
    
    NSMutableArray *arr = [AccountModel getAllAccountData];
//    [_mainView configAccountView:arr];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
}

@end
