//
//  AppDelegate+Config.m
//  EasyNotePro
//
//  Created by zhoudongwei on 2017/12/21.
//  Copyright © 2017年 ZSwift. All rights reserved.
//

#import "AppDelegate+Config.h"

@implementation AppDelegate (Config)
- (void)configSQL
{
    NSFileManager *fm = [NSFileManager defaultManager];
    NSString *path = PATH_OF_DOCUMENT;
    path = [NSString stringWithFormat:@"%@/Base.db",path];
    NSLog(@"数据库地址======\n%@",path);
    
    //复制数据库
    if (![fm fileExistsAtPath:path]) {
        NSString *pathInBundle = [[NSBundle mainBundle] pathForResource:@"Base" ofType:@"db"];
        NSError *error;
        [fm copyItemAtPath:pathInBundle toPath:path error:&error];
    }
    
    //数据库字段升级
    
}
@end
