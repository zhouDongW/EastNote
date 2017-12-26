//
//  CommonUtils.m
//  MyBasePro
//
//  Created by zhoudongwei on 2017/11/10.
//  Copyright © 2017年 Zdw. All rights reserved.
//

#import "CommonUtils.h"
#import <SystemConfiguration/CaptiveNetwork.h>

@implementation CommonUtils
//获得WiFi名称
+ (NSString *)getWifiName
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

//根据时间获取星期几
+(NSString *)getTheDayOfTheWeekByDateString:(NSString *)dateString
{
    NSDateFormatter *inputFormatter=[[NSDateFormatter alloc]init];
    [inputFormatter setDateFormat:@"yyyy-MM-dd"];
    
    NSDate *formatterDate=[inputFormatter dateFromString:dateString];
    
    NSDateFormatter *outputFormatter=[[NSDateFormatter alloc]init];
    [outputFormatter setDateFormat:@"EEEE-MMMM-d"];
    
    NSString *outputDateStr=[outputFormatter stringFromDate:formatterDate];
    
    NSArray *weekArray=[outputDateStr componentsSeparatedByString:@"-"];
    
    return [weekArray objectAtIndex:0];

}

//生成时间戳
+(NSString *)createTimestamp
{
    NSDate *datenow=[NSDate date];
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    NSInteger interval = [zone secondsFromGMTForDate:datenow];
    NSDate *localeDate = [datenow  dateByAddingTimeInterval: interval];
    return [NSString stringWithFormat:@"%ld",(long)[localeDate timeIntervalSince1970]];
}


@end
