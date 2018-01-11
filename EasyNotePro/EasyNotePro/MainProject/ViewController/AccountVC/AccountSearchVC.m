//
//  AccountSearchVC.m
//  EasyNotePro
//
//  Created by zhoudongwei on 2018/1/11.
//  Copyright © 2018年 ZSwift. All rights reserved.
//

#import "AccountSearchVC.h"
#import "TopSearBarView.h"

@interface AccountSearchVC ()
{
    
}
Strong TopSearBarView *searBar;
@end

@implementation AccountSearchVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _searBar = InitObject(TopSearBarView);
    _searBar.frame = CGRectMake(0, 0, ScreenWidth, NavHight);
    [self.view addSubview:_searBar];
    
    //搜索内容返回
    _searBar.tBlock = ^(NSString *text) {
        
    };
    
    [_searBar.backBtn addTarget:self action:@selector(backBtnClick) forControlEvents:UIControlEventTouchUpInside];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    self.navigationController.navigationBar.hidden = NO;
}

- (void)backBtnClick
{
    [self.navigationController popViewControllerAnimated:YES];
}
@end
