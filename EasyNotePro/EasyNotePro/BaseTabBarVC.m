//
//  BaseTabBarVC.m
//  EasyNotePro
//
//  Created by zhoudongwei on 2018/1/3.
//  Copyright © 2018年 ZSwift. All rights reserved.
//

#import "BaseTabBarVC.h"
#import "AccountVC.h"
#import "AddInfoVC.h"
#import "NoteVC.h"
#import "OtherVC.h"
#import "PersonVC.h"

@interface BaseTabBarVC ()

@end

@implementation BaseTabBarVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    AccountVC *accountVC = [[AccountVC alloc] init];
    accountVC.tabBarItem.title = @"账号";
    accountVC.tabBarItem.image = IMAGEBYENAME(@"main_acc");
//    accountVC.tabBarItem.selectedImage = IMAGEBYENAME(@"main_acc_ed");
    accountVC.tabBarItem.selectedImage = [[ThemeSelectTool imageWithImageName:@"main_acc_ed"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    //UIImage 渲染模式 默认UIImageRenderingModeAutomatic，在navi和tabber默认显示蓝色，需要设置为UIImageRenderingModeAlwaysOriginal/始终绘制图片原始状态，不使用Tint Color
    
    AddInfoVC *addVC = [[AddInfoVC alloc] init];
    addVC.tabBarItem.title = @"添加";
    addVC.tabBarItem.image = IMAGEBYENAME(@"main_add");
//    addVC.tabBarItem.selectedImage = IMAGEBYENAME(@"main_add_ed");
    addVC.tabBarItem.selectedImage = [[ThemeSelectTool imageWithImageName:@"main_add_ed"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    NoteVC *noteVC = [[NoteVC alloc] init];
    noteVC.tabBarItem.title = @"随记";
    noteVC.tabBarItem.image = IMAGEBYENAME(@"main_note");
    //noteVC.tabBarItem.selectedImage = IMAGEBYENAME(@"main_note_ed");
    noteVC.tabBarItem.selectedImage = [[ThemeSelectTool imageWithImageName:@"main_note_ed"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    OtherVC *otherVC = [[OtherVC alloc] init];
    otherVC.tabBarItem.title = @"其他";
    otherVC.tabBarItem.image = IMAGEBYENAME(@"main_other");
    //otherVC.tabBarItem.selectedImage = IMAGEBYENAME(@"main_other_ed");
    otherVC.tabBarItem.selectedImage = [[ThemeSelectTool imageWithImageName:@"main_other_ed"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    PersonVC *personVC = [[PersonVC alloc] init];
    personVC.tabBarItem.title = @"个人";
    personVC.tabBarItem.image = IMAGEBYENAME(@"main_per");
//    personVC.tabBarItem.selectedImage = IMAGEBYENAME(@"main_per_ed");
    personVC.mainView.iconImg.image = [ThemeSelectTool imageWithImageName:@"main_per_ed"];
    personVC.tabBarItem.selectedImage = [[ThemeSelectTool imageWithImageName:@"main_per_ed"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    //字体
//     [[UITabBarItem appearance] setTitleTextAttributes:@{ NSForegroundColorAttributeName:[UIColor whiteColor]} forState:UIControlStateNormal];
    [[UITabBarItem appearance] setTitleTextAttributes:@{ NSForegroundColorAttributeName:[ThemeSelectTool themeColor]} forState:UIControlStateSelected];
    
    UINavigationController *acNaviVC = [[UINavigationController alloc] initWithRootViewController:accountVC];
    UINavigationController *adNaviVC = [[UINavigationController alloc] initWithRootViewController:addVC];
    UINavigationController *noNaviVC = [[UINavigationController alloc] initWithRootViewController:noteVC];
    UINavigationController *otNaviVC = [[UINavigationController alloc] initWithRootViewController:otherVC];
    UINavigationController *peNaviVC = [[UINavigationController alloc] initWithRootViewController:personVC];
    
    acNaviVC.navigationBar.backgroundColor = [ThemeSelectTool themeColor];
    [acNaviVC.navigationBar setBackgroundImage:[UIImage imageWithColor:[ThemeSelectTool themeColor]] forBarMetrics:UIBarMetricsDefault];
    
    self.viewControllers = @[acNaviVC,noNaviVC,adNaviVC,otNaviVC,peNaviVC];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}



@end
