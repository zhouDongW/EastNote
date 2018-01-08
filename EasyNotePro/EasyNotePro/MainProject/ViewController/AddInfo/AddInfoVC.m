//
//  AddInfoVC.m
//  EasyNotePro
//
//  Created by zhoudongwei on 2017/12/21.
//  Copyright © 2017年 ZSwift. All rights reserved.
//

#import "AddInfoVC.h"
#import "AddAccountVC.h"
#import "AddNoteVC.h"

#import "AddInfoView.h"

@interface AddInfoVC ()
{
    
}
Strong AddInfoView *mainView;
@end

@implementation AddInfoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"账号添加";
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    _mainView = InitObject(AddInfoView);
    _mainView.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight);
    //[self.tabBarController.view addSubview:_mainView];
    self.view = _mainView;
    
    __block typeof(self) weakSelf = self;
    //页面跳转
    _mainView.pBlock = ^(NSInteger index) {
        switch (index) {
            case 0:
            {
                AddAccountVC *avc = InitObject(AddAccountVC);
                
                //用自定义push方法pop后tabbar隐藏了
                //[weakSelf pushViewController:avc animated:YES];
                avc.hidesBottomBarWhenPushed = YES;
                [weakSelf.navigationController pushViewController:avc animated:YES];
            }
                break;
            case 1:
            {
                AddNoteVC *nvc = InitObject(AddNoteVC);
                nvc.hidesBottomBarWhenPushed = YES;
                [weakSelf.navigationController pushViewController:nvc animated:YES];
                //[weakSelf pushViewController:nvc animated:YES];
            }
                break;
            case 2:
            {
                
            }
                break;
            default:
                break;
        }
    };
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
}

@end
