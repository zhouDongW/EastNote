//
//  AddNoteVC.m
//  EasyNotePro
//
//  Created by zhoudongwei on 2017/12/28.
//  Copyright © 2017年 ZSwift. All rights reserved.
//

#import "AddNoteVC.h"
#import "AddNoteView.h"


@interface AddNoteVC ()
{
    BOOL isEdit;
}
Strong AddNoteView *mainView;

@end

@implementation AddNoteVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"随记添加";
    [self leftButtonSetImage:nil];
    isEdit = YES;
    
    if (_isShowNote) {
        [self rightBtnWithText:@"编辑"];
        isEdit = NO;
        self.title = @"随记信息查看";
    }
    
    _mainView = InitObject(AddNoteView);
    _mainView.isCanEdit = isEdit;
    _mainView.isSaveUpdate = _isShowNote;
    _mainView.noteId = _noteData.noteId;
    [_mainView configTextField:_noteData];
    self.view = _mainView;
    __weak typeof(self) weakSelf = self;
    //数据保存block
    _mainView.sBlock = ^(NSString *ntitle, NSString *ntime, NSString *ndescript) {
        NoteTable *model = [[NoteTable alloc] init];
        model.noteId = [CommonUtils createTimestamp];
        model.title = ntitle;
        model.time = ntime;
        model.descript = ndescript;
        
        BOOL rlt = [NoteModel addNoteInfo:model];
        if (rlt) {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"tip" message:@"save succeed" delegate:self cancelButtonTitle:@"sure" otherButtonTitles:nil, nil];
            [alert show];
            weakSelf.tabBarController.selectedIndex = 1;
        }
        else
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"tip" message:@"save fail" delegate:self cancelButtonTitle:@"sure" otherButtonTitles:nil, nil];
            [alert show];
        }
    };
    //gengxin
    _mainView.uBlock = ^(NSString *noteid, NSString *ntitle, NSString *ntime, NSString *ndescript) {
        NoteTable *model = [[NoteTable alloc] init];
        model.noteId = noteid;
        model.title = ntitle;
        model.time = ntime;
        model.descript = ndescript;
        
        BOOL update = [NoteModel updateNoteInfo:model];
        if (update) {
            //save succeed
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"tip" message:@"save succed" delegate:self cancelButtonTitle:@"sure" otherButtonTitles:nil, nil];
            [alert show];
            [weakSelf.navigationController popViewControllerAnimated:YES];
            weakSelf.tabBarController.selectedIndex = 1;
        }
        else
        {
            //save error
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"tip" message:@"save fail" delegate:self cancelButtonTitle:@"sure" otherButtonTitles:nil, nil];
            [alert show];
        }
    };
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
}

- (void)rightButtonClick:(UIButton *)sender
{
    [self rightBtnWithText:nil];
    
    isEdit = YES;
    _mainView.isCanEdit = isEdit;
    [_mainView changeTextFieldEdit];
}
@end
