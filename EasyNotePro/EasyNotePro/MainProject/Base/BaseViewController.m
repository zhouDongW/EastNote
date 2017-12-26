//
//  BaseViewController.m
//  MyBasePro
//
//  Created by zhoudongwei on 2017/10/9.
//  Copyright © 2017年 Zdw. All rights reserved.
//

#import "BaseViewController.h"
#import <SystemConfiguration/CaptiveNetwork.h>

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    if(DSystemVersion >= 7.0)
    {
        self.edgesForExtendedLayout = UIRectEdgeNone;
        self.navigationController.navigationBar.translucent = NO; //透明度
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}
//跳转隐藏底部tabar
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    viewController.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:viewController animated:animated];
}

#pragma mark 自定义事件
- (void)leftButtonSetImage:(NSString *)imageName
{
    [self.navigationItem setHidesBackButton:YES];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, SizeFrom750(30), SizeFrom750(30));
    [btn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    if (!imageName) {
        [btn setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
        btn.tag = tagBack;
    }
    [btn addTarget:self action:@selector(goBackAction:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *back = [[UIBarButtonItem alloc] initWithCustomView:btn];
    self.navigationItem.leftBarButtonItem = back;
}

- (void)goBackAction:(UIButton *)sender
{
    if (sender.tag == 1000) {
        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (void)rightButtonSetIamge:(NSString *)imageName
{
    [self.navigationItem setHidesBackButton:YES];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, SizeFrom750(30), SizeFrom750(30));
    if ([imageName isEqualToString:@""]) {
        
    }
    [btn setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(rightButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *back = [[UIBarButtonItem alloc] initWithCustomView:btn];
    self.navigationItem.rightBarButtonItem = back;
}

- (void)rightBtnWithText:(NSString*)text
{
    [self.navigationItem setHidesBackButton:YES];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, 44, 44);
    btn.titleLabel.textColor = Color66;
    btn.titleLabel.font = [UIFont systemFontOfSize:SizeFrom750(32)];
    [btn setTitle:text forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [btn addTarget:self action:@selector(rightButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem * back = [[UIBarButtonItem alloc] initWithCustomView:btn];
    self.navigationItem.rightBarButtonItem = back;
}

- (void)rightButtonClick:(UIButton *)sender
{
    //由VC自己处理
}

#pragma mark - 判断 wifi 名字

- (NSString *)getWifiName
{
    NSString *wifiName = nil;
    CFArrayRef wifiInterfaces = CNCopySupportedInterfaces();
    
    if (!wifiInterfaces) {
        return nil;
    }
    
    NSArray *interfaces = (__bridge NSArray *)wifiInterfaces;
    
    for (NSString *interfaceName in interfaces) {
        CFDictionaryRef dictRef = CNCopyCurrentNetworkInfo((__bridge CFStringRef)(interfaceName));
        
        if (dictRef) {
            NSDictionary *networkInfo = (__bridge NSDictionary *)dictRef;
            wifiName = [networkInfo objectForKey:(__bridge NSString *)kCNNetworkInfoKeySSID];
            CFRelease(dictRef);
        }
    }
    
    CFRelease(wifiInterfaces);
    return wifiName;
}

- (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString {
    if (jsonString == nil) {
        return nil;
    }
    
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    
    if(err) {
        return nil;
    }
    return dic;
}

- (NSDictionary *)dictionaryWithData:(NSData *)data {
    
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    if(err) {
        return nil;
    }
    return dic;
}
- (NSString *)JsonStringWidhDict:(NSDictionary *)dict
{
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:&error];
    NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    return jsonString;
}
@end

