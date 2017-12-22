//
//  DataManager.m
//  EasyNotePro
//
//  Created by zhoudongwei on 2017/12/21.
//  Copyright © 2017年 ZSwift. All rights reserved.
//

#import "DataManager.h"

@implementation DataManager
+ (NSString *)databasePath
{
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0] stringByAppendingPathComponent:@"Base.db"];
}

+ (instancetype)instance
{
    static DataManager *__instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self.class sharedQueue];
        __instance = self.new;
    });
    
    return __instance;
}

+ (FMDatabaseQueue *)sharedQueue
{
    ///单例方法，整个app运行只有一次dispatch—once，在第一次返回insQueue后，下次执行
    //查询onceToken值，返回上次内存中的insQueue
    static FMDatabaseQueue *__insQueue = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        __insQueue = [[FMDatabaseQueue alloc] initWithPath:self.class.databasePath];
    });
    
    return __insQueue;
    
}
@end
