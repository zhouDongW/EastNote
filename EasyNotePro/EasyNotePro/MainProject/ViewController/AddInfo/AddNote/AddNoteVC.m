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
    
}
Strong AddNoteView *mainView;
@end

@implementation AddNoteVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"随记添加";
    [self leftButtonSetImage:nil];
    
    _mainView = InitObject(AddNoteView);
    self.view = _mainView;
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

@end
