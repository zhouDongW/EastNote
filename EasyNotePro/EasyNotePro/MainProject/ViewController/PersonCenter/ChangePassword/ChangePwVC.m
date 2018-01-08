//
//  ChangePwVC.m
//  EasyNotePro
//
//  Created by zhoudongwei on 2018/1/5.
//  Copyright © 2018年 ZSwift. All rights reserved.
//

#import "ChangePwVC.h"

#import "ChangePwView.h"

@interface ChangePwVC ()
{
    
}
Strong ChangePwView *mainView;
@end

@implementation ChangePwVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"修改锁屏密码";
    [self leftButtonSetImage:nil];
    
    _mainView = [[ChangePwView alloc] init];
    _mainView.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight - 64);
    self.view = _mainView;
    
    __weak typeof(self) weakSelf = self;
    //修改保存
    _mainView.sBlock = ^(NSString *newPw) {
        NSUserDefaults *users = [NSUserDefaults standardUserDefaults];
        [users setObject:newPw forKey:@"screenKey"];
        [users synchronize];
        //alert
        
        [weakSelf.navigationController popViewControllerAnimated:YES];
    };
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}



@end
