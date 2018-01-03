//
//  ChangeThemeVC.m
//  EasyNotePro
//
//  Created by zhoudongwei on 2018/1/3.
//  Copyright © 2018年 ZSwift. All rights reserved.
//

#import "ChangeThemeVC.h"
#import "BaseTabBarVC.h"

#import "ChangeThemeView.h"

@interface ChangeThemeVC ()
{
    
}
Strong ChangeThemeView *mainView;
@end

@implementation ChangeThemeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"更改主题";
    [self leftButtonSetImage:nil];
    
    _mainView = [[ChangeThemeView alloc] init];
    _mainView.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight - 64);
    self.view = _mainView;
    
    [_mainView.blueLab addTarget:self action:@selector(blueClick) forControlEvents:UIControlEventTouchUpInside];
    [_mainView.orangeLab addTarget:self action:@selector(orangeClick) forControlEvents:UIControlEventTouchUpInside];
    [_mainView.redLab addTarget:self action:@selector(redClick) forControlEvents:UIControlEventTouchUpInside];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

- (void)blueClick
{
    [self configTheme:@"blue"];
}
- (void)orangeClick
{
    [self configTheme:@"orange"];
}
- (void)redClick
{
    [self configTheme:@"red"];
}

- (void)configTheme:(NSString *)theme
{
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    [user setObject:theme forKey:@"Theme"];
    [user synchronize];
    
    //重新生成tabbar，显示theme变换
    self.view.window.rootViewController = [[BaseTabBarVC alloc] init];
}
@end
