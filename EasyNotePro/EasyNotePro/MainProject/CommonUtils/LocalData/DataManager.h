//
//  DataManager.h
//  EasyNotePro
//
//  Created by zhoudongwei on 2017/12/21.
//  Copyright © 2017年 ZSwift. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <FMDB/FMDB.h>

@interface DataManager : NSObject

+ (instancetype)instance;
+ (FMDatabaseQueue *)sharedQueue;

@end
