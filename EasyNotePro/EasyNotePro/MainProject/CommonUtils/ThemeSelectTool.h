//
//  ThemeSelectTool.h
//  EasyNotePro
//
//  Created by zhoudongwei on 2018/1/3.
//  Copyright © 2018年 ZSwift. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ThemeSelectTool : NSObject

/**
 *    @brief  根据资源文件获取主题颜色
 *
 *    @return 主题颜色
 */
+ (UIColor *)themeColor;

/**
 *    @brief  根据资源文件名获取图片
 *
 *    @param imageName 本地资源文件图片名称
 *
 *    @return 资源图片
 */
+ (UIImage *)imageWithImageName:(NSString *)imageName;
@end
