//
//  AccountModel.m
//  EasyNotePro
//
//  Created by zhoudongwei on 2017/12/22.
//  Copyright © 2017年 ZSwift. All rights reserved.
//

#import "AccountModel.h"

@implementation AccountModel

+ (NSMutableArray *)getAllAccountData;
{
    NSMutableArray *modelArr = [[NSMutableArray alloc] init];
    FMDatabaseQueue *queue = [self.class sharedQueue];
    [queue inDatabase:^(FMDatabase * _Nonnull db) {
        FMResultSet *resultSet = [db executeQuery:@"select * from AccountTable"];
        while ([resultSet next]) {
            AccountTable *aModel = [[AccountTable alloc] init];
            aModel.accountId = [resultSet stringForColumn:@"accountId"];
            aModel.type = [resultSet intForColumn:@"type"];
            aModel.title = [resultSet stringForColumn:@"title"];
            aModel.account = [resultSet stringForColumn:@"account"];
            aModel.password = [resultSet stringForColumn:@"password"];
            aModel.descript = [resultSet stringForColumn:@"descript"];
            
            [modelArr addObject:aModel];
        }
        [resultSet close];
    }];
    return modelArr;
}

+ (BOOL)addAccountInfo:(AccountTable *)account
{
    __block BOOL rlt = NO;
    FMDatabaseQueue *queue = [self.class sharedQueue];
    [queue inDatabase:^(FMDatabase * _Nonnull db) {
//        rlt = [db executeQuery:@"insert into AccountTable(accountId,type,title,account,password,descript) values(?,?,?,?,?,?)",
//                                  account.accountId,
//                                  account.type,
//                                  account.title,
//                                  account.account,
//                                  account.password,
//                                  account.descript
//                                  ];
        rlt = [db executeUpdate:@"replace into AccountTable(accountId,type,title,account,password,descript) values(?,?,?,?,?,?)",
               account.accountId,
               @0,
               account.title,
               account.account,
               account.password,
               account.descript];
    }];
    return rlt;
}

+ (BOOL)delAccountInfo:(NSString *)accountid
{
    __block BOOL rlt = NO;
    FMDatabaseQueue *queue = [self.class sharedQueue];
    [queue inDatabase:^(FMDatabase * _Nonnull db) {
        rlt = [db executeQuery:@"delete from AccountTable where accountId = ?",accountid];
    }];
    return rlt;
    
}

+ (BOOL)updateAccountInfo:(AccountTable *)account
{
    __block BOOL rlt = NO;
    FMDatabaseQueue *queue = [self.class sharedQueue];
    [queue inDatabase:^(FMDatabase * _Nonnull db) {
        rlt = [db executeUpdate:@"update accountTable set account = ?,type = ?, title = ?,password = ?, descript = ? where accountId = ?",
               account.account,
               @0,
               account.title,
               account.password,
               account.descript,
               account.accountId];
    }];
    return rlt;
}
@end
