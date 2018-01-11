//
//  SimpleMore.h
//  EasyNotePro
//
//  Created by zhoudongwei on 2017/12/21.
//  Copyright © 2017年 ZSwift. All rights reserved.
//
//常用宏定义

#ifndef SimpleMore_h
#define SimpleMore_h

//property 定义
#define Strong          @property(nonatomic, strong)
#define Weak            @property(nonatomic, weak)
#define Retain          @property(nonatomic, retain)
#define Copy            @property(nonatomic, copy)
#define Assign          @property(nonatomic, assign)

//屏幕尺寸
#define ScreenSize [UIScreen mainScreen].bounds.size
#define ScreenRect [UIScreen mainScreen].bounds
#define ScreenScale [UIScreen mainScreen].scale

#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height

//以6为基准 750*1334
#define SizeFrom750(x) ((x) * [UIScreen mainScreen].bounds.size.width / 750)

#define NaviStatuBarHight [[UIApplication sharedApplication] statusBarFrame].size.height
//#define NavHight 64   //X以后不再是20+44
#define NavHight ([[UIApplication sharedApplication] statusBarFrame].size.height + (44.f))

//宽 高 rect point等
#define WIDTH(X)  (X).frame.size.width
#define HEIGHT(X) (X).frame.size.height
#define STARTX(X) (X).frame.origin.x
#define STARTY(X) (X).frame.origin.y
#define LEFT(X)   (X).frame.origin.x
#define RIGHT(X)  ((X).frame.origin.x+X.frame.size.width)
#define TOP(X)    (X).frame.origin.y
#define BOTTOM(X) ((X).frame.origin.y+X.frame.size.height)
#define RECT(x,y,width,height) CGRectMake(x,y,width,height)

//初始化
#define InitObject(vc) [[vc alloc]init]
#define InitROOTVC(vc) [[UINavigationController alloc] initWithRootViewController:[[vc alloc]init]];

#define APPDELEGATE  ((AppDelegate *)[[UIApplication sharedApplication]delegate])

//沙盒路径
//
#define PATH_OF_APP_HOME    NSHomeDirectory()
//
#define PATH_OF_TEMP        NSTemporaryDirectory()
//
#define PATH_OF_DOCUMENT    [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]

// PNG JPG 图片路径
#define PNGPATH(NAME)           [[NSBundle mainBundle] pathForResource:[NSString stringWithUTF8String:NAME] ofType:@"png"]
#define JPGPATH(NAME)           [[NSBundle mainBundle] pathForResource:[NSString stringWithUTF8String:NAME] ofType:@"jpg"]
#define PATH(NAME, EXT)         [[NSBundle mainBundle] pathForResource:(NAME) ofType:(EXT)]

// 加载图片
#define PNGIMAGE(NAME)          [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:(NAME) ofType:@"png"]]
#define JPGIMAGE(NAME)          [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:(NAME) ofType:@"jpg"]]
#define IMAGE(NAME, EXT)        [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:(NAME) ofType:(EXT)]]
#define IMAGEBYENAME(name)       [UIImage imageNamed:name]

// 颜色(RGB)
#define RGBCOLOR(r, g, b)       [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]
#define RGBACOLOR(r, g, b, a)   [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]
// RGB颜色转换（16进制->10进制）
#define UIColorFromRGB(rgbValue)\
\
[UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 \
alpha:1.0]


// View 圆角和加边框
#define ViewBorderRadius(View, Radius, Width, Color)\
\
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES];\
[View.layer setBorderWidth:(Width)];\
[View.layer setBorderColor:[Color CGColor]]


// 当前版本
#define FSystemVersion          ([[[UIDevice currentDevice] systemVersion] floatValue])
#define DSystemVersion          ([[[UIDevice currentDevice] systemVersion] doubleValue])
#define SSystemVersion          ([[UIDevice currentDevice] systemVersion])
#define CFBundleShortVersionString ([[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"])
//去除.之后的版本号 如V1.2.0  则得到的为120
#define AppVerion [CFBundleShortVersionString stringByReplacingOccurrencesOfString:@"." withString:@""]
//系统构建版本号 当前作为内部版本号使用
#define AppBuildVersion [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]
//手机型号
#define PhoneModel              ([[UIDevice currentDevice] model])
// 当前语言
#define CURRENTLANGUAGE         ([[NSLocale preferredLanguages] objectAtIndex:0])

// 本地化字符串
/** NSLocalizedString宏做的其实就是在当前bundle中查找资源文件名“Localizable.strings”(参数:键＋注释) */
#define LocalString1(x, ...)     NSLocalizedString(x, nil)
#define LocalString(x)     ([StringsUtil getLocalString:x])
/** NSLocalizedStringFromTable宏做的其实就是在当前bundle中查找资源文件名“xxx.strings”(参数:键＋文件名＋注释) */
#define AppLocalString(x, ...)  NSLocalizedStringFromTable(x, @"someName", nil)
#define LF(key) [NSBundle.mainBundle localizedStringForKey:(key) value:@"" table:(@"OneLocalStrings")]

#endif /* SimpleMore_h */
