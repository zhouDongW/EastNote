//
//  BaseViewController.h
//  MyBasePro
//
//  Created by zhoudongwei on 2017/10/9.
//  Copyright © 2017年 Zdw. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController
//设置左按钮图片
- (void)leftButtonSetImage:(NSString *)imageName;
//设置右按钮图片
- (void)rightButtonSetIamge:(NSString *)imageName;
//右边按钮文字
- (void)rightBtnWithText:(NSString*)text;


//有特殊事件重构
//右按钮点击事件

- (void)rightButtonClick:(UIButton *)sender;
//左按钮点击事件 一般为返回事件
- (void)goBackAction:(UIButton *)sender;

//跳转隐藏底部tabar
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated;

//判断wifi名称
- (NSString *)getWifiName;
//数据解析
- (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString;
- (NSDictionary *)dictionaryWithData:(NSData *)data;
//字典转字符串jsonString
- (NSString *)JsonStringWidhDict:(NSDictionary *)dict;
@end
