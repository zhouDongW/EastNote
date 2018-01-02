//
//  AddNoteVC.h
//  EasyNotePro
//
//  Created by zhoudongwei on 2017/12/28.
//  Copyright © 2017年 ZSwift. All rights reserved.
//

#import "BaseViewController.h"
#import "NoteModel.h"

@interface AddNoteVC : BaseViewController
{
    
}
//yes 为noteVC跳转过来，textfield不可修改
Assign BOOL isShowNote;

Strong NoteTable *noteData;
@end
