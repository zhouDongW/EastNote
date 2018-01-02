//
//  NoteModel.m
//  EasyNotePro
//
//  Created by zhoudongwei on 2018/1/2.
//  Copyright © 2018年 ZSwift. All rights reserved.
//

#import "NoteModel.h"

@implementation NoteModel
//获取所有账号数据
+ (NSMutableArray *)getAllNoteData
{
    NSMutableArray *noteArr = [[NSMutableArray alloc] init];
    FMDatabaseQueue *queue = [self.class sharedQueue];
    [queue inDatabase:^(FMDatabase * _Nonnull db) {
        FMResultSet *result = [db executeQuery:@"select * from NoteTable"];
        while ([result next]) {
            NoteTable *model = [[NoteTable alloc] init];
            model.noteId = [result stringForColumn:@"noteId"];
            model.title = [result stringForColumn:@"title"];
            model.time = [result stringForColumn:@"time"];
            model.descript = [result stringForColumn:@"descript"];
            
            [noteArr addObject:model];
        }
        [result close];
    }];
    return noteArr;
    
}

//添加账号信息
+ (BOOL)addNoteInfo:(NoteTable *)note
{
    __block BOOL rlt = NO;
    FMDatabaseQueue *queue = [self.class sharedQueue];
    [queue inDatabase:^(FMDatabase * _Nonnull db) {
        rlt = [db executeUpdate:@"replace into NoteTable(noteId,title,time,descript) values(?,?,?,?)",
               note.noteId,
               note.title,
               note.time,
               note.descript];
    }];
    return rlt;
}

//删除一条账号信息
+ (BOOL)delNoteInfo:(NSString *)noteid
{
    __block BOOL rlt = NO;
    FMDatabaseQueue *queue = [self.class sharedQueue];
    [queue inDatabase:^(FMDatabase * _Nonnull db) {
        rlt = [db executeUpdate:@"delete from NoteTable where noteId = ?",noteid];
    }];
    return rlt;
}

//更新一条账号信息
+ (BOOL)updateNoteInfo:(NoteTable *)note
{
    __block BOOL rlt = NO;
    FMDatabaseQueue *queue = [self.class sharedQueue];
    [queue inDatabase:^(FMDatabase * _Nonnull db) {
        rlt = [db executeUpdate:@"update NoteTable set title = ?,time = ?,descript = ? where noteId = ?",
               note.title,
               note.time,
               note.descript,
               note.noteId];
    }];
    return rlt;
}

@end
