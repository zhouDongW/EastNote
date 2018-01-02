//
//  AddNoteView.h
//  EasyNotePro
//
//  Created by zhoudongwei on 2017/12/28.
//  Copyright © 2017年 ZSwift. All rights reserved.
//

#import "BaseView.h"
#import "NoteModel.h"

typedef void(^dataSave)(NSString *ntitle,NSString *ntime,NSString *ndescript);
typedef void(^dataUpdate)(NSString *noteid,NSString *ntitle,NSString *ntime,NSString *ndescript);
@interface AddNoteView : BaseView
{
    
}
Strong NSString *noteId;
Assign BOOL isCanEdit;
Assign BOOL isSaveUpdate; //yes 更新 no 保存
Copy dataSave sBlock;
Copy dataUpdate uBlock;

- (void)configTextField:(NoteTable *)model;
- (void)changeTextFieldEdit;
@end
