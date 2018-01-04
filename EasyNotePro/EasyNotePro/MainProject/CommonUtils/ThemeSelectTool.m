//
//  ThemeSelectTool.m
//  EasyNotePro
//
//  Created by zhoudongwei on 2018/1/3.
//  Copyright © 2018年 ZSwift. All rights reserved.
//

#import "ThemeSelectTool.h"

@implementation ThemeSelectTool
+ (UIColor *)themeColor
{
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    NSString *theme = [user objectForKey:@"Theme"];
    if (![theme length]) {
        theme = @"blue";
    }
    NSString *bundlePath = [[NSBundle mainBundle].resourcePath stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.bundle",theme]];
    NSBundle *themeBundle = [NSBundle bundleWithPath:bundlePath];
    NSString *plistPath = [themeBundle pathForResource:@"Theme" ofType:@"plist"];
    NSMutableDictionary *plistDic = [[NSMutableDictionary alloc] initWithContentsOfFile:plistPath];
    
    UIColor *themeColor;
    NSString *colorHexString = [plistDic objectForKey:@"colorHex"];
    if ([colorHexString length]) {
        themeColor = [UIColor colorWithHexString:colorHexString];
    }
    else
    {
        themeColor = [UIColor whiteColor];
    }
    return themeColor;
}

+ (UIImage *)imageWithImageName:(NSString *)imageName
{
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    NSString *theme = [user objectForKey:@"Theme"];
    if (![theme length]) {
        theme = @"blue";
    }
    NSString *bundlePath = [[NSBundle mainBundle].resourcePath stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.bundle",theme]];
    NSBundle *themeBundle = [NSBundle bundleWithPath:bundlePath];
    NSString *imgPath = [themeBundle pathForResource:imageName ofType:@"png"];
    
    //UIImage *img = [UIImage imageNamed:imageName inBundle:themeBundle compatibleWithTraitCollection:nil];
//    return img;
    return [UIImage imageWithContentsOfFile:imgPath];
    
}
@end
