//
//  NoteVC.m
//  EasyNotePro
//
//  Created by zhoudongwei on 2017/12/21.
//  Copyright © 2017年 ZSwift. All rights reserved.
//

#import "NoteVC.h"
#import "AddNoteVC.h"

#import "NoteView.h"

#import "NoteModel.h"

@interface NoteVC ()
{
    NSMutableArray *dbGetArr;
}
Strong NoteView *mainView;
@end

@implementation NoteVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"随记";
    _mainView = [[NoteView alloc] init];
    _mainView.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight);
    self.view = _mainView;
    
    __weak typeof(self) weakSelf = self;
    _mainView.tableView.mj_header= [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            dbGetArr = [NoteModel getAllNoteData];
            [weakSelf.mainView configNoteView:dbGetArr];
            
            [_mainView.tableView.mj_header endRefreshing];
        });
        
    }];
    
    dbGetArr = [NoteModel getAllNoteData];
    [_mainView configNoteView:dbGetArr];

    //点击跳转详情
    _mainView.pBlock = ^(NSInteger index) {
        AddNoteVC *nvc = InitObject(AddNoteVC);
        nvc.noteData = [dbGetArr objectAtIndex:index];
        nvc.isShowNote = YES;
        
        [weakSelf pushViewController:nvc animated:YES];
    };
    //shanchu
    _mainView.dBlock = ^(NSString *nid) {
        BOOL dele = [NoteModel delNoteInfo:nid];
        if (dele) {
            //
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"tip" message:@"delete succees" delegate:self cancelButtonTitle:@"sure" otherButtonTitles:nil, nil];
            [alert show];
        }
        else
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"tip" message:@"fail to delete" delegate:self cancelButtonTitle:@"sure" otherButtonTitles:nil, nil];
            [alert show];
        }
    };
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
