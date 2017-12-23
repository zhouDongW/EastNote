//
//  CommonUtils.h
//  MyBasePro
//
//  Created by zhoudongwei on 2017/11/10.
//  Copyright © 2017年 Zdw. All rights reserved.
//
//一些通用工具方法
#import <Foundation/Foundation.h>

@interface CommonUtils : NSObject
//得到WiFi名称
+(NSString *)getWifiName;
//根据时间获取星期几
+(NSString *)getTheDayOfTheWeekByDateString:(NSString *)dateString;

//生成时间戳
+(NSString *)createTimestamp;



@end
