//
//  NoteModel.h
//  EasyNotePro
//
//  Created by zhoudongwei on 2018/1/2.
//  Copyright © 2018年 ZSwift. All rights reserved.
//

#import "DataManager.h"
#import "MainDataModel.h"

@interface NoteModel : DataManager
//获取所有账号数据
+ (NSMutableArray *)getAllNoteData;

//添加账号信息
+ (BOOL)addNoteInfo:(NoteTable *)note;

//删除一条账号信息
+ (BOOL)delNoteInfo:(NSString *)noteid;

//更新一条账号信息
+ (BOOL)updateNoteInfo:(NoteTable *)note;
@end
