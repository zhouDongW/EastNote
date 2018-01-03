//
//  AddNoteView.m
//  EasyNotePro
//
//  Created by zhoudongwei on 2017/12/28.
//  Copyright © 2017年 ZSwift. All rights reserved.
//

#import "AddNoteView.h"
#import "TextViewCell.h"
#import "SelectTimeSheet.h"
@interface AddNoteView()<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate,UITextViewDelegate,SelectTimeDelegate>
{
    NSArray *titleArr;
    NSArray *valueArr;
    
    NSArray *cellTitleArr;
    
    NSString *nTitle;
    NSString *nTime;
    NSString *nDescription;
}
Strong UITableView *tableView;
Strong UITextField *titleTF;
Strong UILabel *timeLab;

Strong SelectTimeSheet *timeSheet;
@end

@implementation AddNoteView

- (instancetype)init
{
    self =[super init];
    if (self) {
        cellTitleArr = @[@"标题",@"时间",@"详情描述:"];
        [self initTableView];
    }
    return self;
}

- (void)initTableView
{
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight - 64) style:UITableViewStyleGrouped];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    //self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.showsVerticalScrollIndicator = NO;
    self.tableView.scrollEnabled = NO;
    self.tableView.allowsSelection = NO;
    self.tableView.sectionHeaderHeight = SizeFrom750(1);
    [self addSubview:self.tableView];
}

- (void)selectNoteTime
{
    //_timeSheet = [[SelectTimeSheet alloc] initWithFrame:CGRectMake(0, ScreenHeight - 300, ScreenWidth, 300)];
    _timeSheet = [[SelectTimeSheet alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight)];
    _timeSheet.delegate = self;
    
    [_timeSheet show];
    [self addSubview:_timeSheet];
}

- (UIView *)keyboardToolBar
{
    UIView *view = InitObject(UIView);
    view.frame = CGRectMake(0, 0, ScreenWidth, 40);
    view.backgroundColor = [UIColor grayColor];
    
    UIButton *btn = InitObject(UIButton);
    btn.frame = CGRectMake(ScreenWidth - 60, 5, 60, 30);
    [btn setTitle:@"完成" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(textWithOut) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:btn];
    
    return view;
}

- (void)textWithOut
{
    [self endEditing:YES];
}

- (void)saveNotetInfo
{
    if (_isSaveUpdate) {
        if (nTitle && nTime && nDescription) {
            if (self.uBlock) {
                self.uBlock(_noteId, nTitle, nTime, nDescription);
            }
        } else {
            
        }
    } else {
        if (nTitle && nTime && nDescription) {
            if (self.sBlock) {
                self.sBlock(nTitle, nTime, nDescription);
            }
        }
        else
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"tip" message:@"somevalue nil" delegate:self cancelButtonTitle:@"yes" otherButtonTitles:nil];
            [alert show];
        }
    }
}

- (void)configTextField:(NoteTable *)model
{
    if (model.title  && model.time && model.descript) {
        valueArr = @[model.title,model.time,model.descript];
    }
}
- (void)changeTextFieldEdit
{
    [_tableView reloadData];
}
#pragma mark Delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger row = indexPath.row;
    static NSString *cellid = @"mycell";
    UITableViewCell *cell  = [tableView dequeueReusableCellWithIdentifier:cellid];
    
    if (cell == nil)
    {
        cell =[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle
                                    reuseIdentifier:cellid];
    }
    if (row == 0) {
        cell.textLabel.text = [cellTitleArr objectAtIndex:row];
        
        self.titleTF = InitObject(UITextField);
        self.titleTF.frame = CGRectMake(160, 15, SizeFrom750(280), SizeFrom750(60));
        self.titleTF.borderStyle = UITextBorderStyleRoundedRect;
        self.titleTF.placeholder = @"为随记添加一个标题";
        self.titleTF.delegate = self;
        
        [cell.contentView addSubview:_titleTF];
        if ([valueArr count] == 3) {
            _titleTF.text = [valueArr objectAtIndex:0];
            nTitle = [valueArr objectAtIndex:0];
        }
        
        if (_isCanEdit == YES) {
            _titleTF.userInteractionEnabled = YES;
        }
        else
        {
            _titleTF.userInteractionEnabled = NO;
        }
    }
    else if (row == 1)
    {
        cell.textLabel.text = [cellTitleArr objectAtIndex:row];
        
        self.timeLab = InitObject(UILabel);
        self.timeLab.frame = CGRectMake( 120, 10, SizeFrom750(340), SizeFrom750(60));
        self.timeLab.text = @"....-..-..-..";
        [cell.contentView addSubview:_timeLab];
        
        UIButton *selectBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        selectBtn.frame = CGRectMake(ScreenWidth - 80, 10, SizeFrom750(140), SizeFrom750(60));
        [selectBtn setTitle:@"选择时间" forState:UIControlStateNormal];
        [selectBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [selectBtn addTarget:self action:@selector(selectNoteTime) forControlEvents:UIControlEventTouchUpInside];
        [cell.contentView addSubview:selectBtn];
        if ([valueArr count]== 3) {
            _timeLab.text = [valueArr objectAtIndex:1];
            nTime = [valueArr objectAtIndex:1];
        }
        
        if (_isCanEdit == YES) {
            selectBtn.hidden = NO;
            selectBtn.userInteractionEnabled = YES;
            [selectBtn setTitleColor:mianBlue forState:UIControlStateNormal];
        }
        else
        {
            selectBtn.userInteractionEnabled = NO;
            //[selectBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
            selectBtn.hidden = YES;
        }
    }
    else if (row == 2) {
        TextViewCell *tcell = [[TextViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellid];
        tcell.textView.delegate =  self;
        tcell.titleLab.text = [cellTitleArr objectAtIndex:row];
        
        cell = tcell;
        if ([valueArr count] == 3) {
            tcell.textView.text = [valueArr objectAtIndex:2];
            nDescription = [valueArr objectAtIndex:2];
        }
        
        if (_isCanEdit == YES) {
            tcell.textView.userInteractionEnabled = YES;
        }
        else
        {
            tcell.textView.userInteractionEnabled = NO;
        }
    }
    
    return cell;
}

//- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
//{
//
//}

- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc] init];
    UIButton *saveBtn = InitObject(UIButton);
    saveBtn.frame = CGRectMake((ScreenWidth - 180)/2, 15, 180, 40);
    saveBtn.backgroundColor = mianBlue;
    saveBtn.layer.cornerRadius = 15;
    [saveBtn setTitle:@"保存" forState:UIControlStateNormal];
    [saveBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [saveBtn addTarget:self action:@selector(saveNotetInfo) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:saveBtn];
    
    if (_isCanEdit) {
        saveBtn.userInteractionEnabled = YES;
        [saveBtn setBackgroundColor:mianBlue];
    }
    else
    {
        saveBtn.userInteractionEnabled = NO;
        [saveBtn setBackgroundColor:[UIColor grayColor]];
    }
    return view;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 2) {
        return 200;
    }
    else
    {
        return normalCellH;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return SizeFrom750(1);
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 80.f;
}

//SelectTimeSheet Delegate
- (void)dataPickerSaveBtn:(NSString *)time
{
    _timeLab.text = time;
    nTime = time;
    
    [UIView animateWithDuration:1 animations:^{
        _timeSheet.frame = CGRectMake(0, ScreenHeight, ScreenWidth, 300);
    }];
}

- (void)dataPickerCancelBtn
{
    [UIView animateWithDuration:1 animations:^{
        _timeSheet.frame = CGRectMake(0, ScreenHeight, ScreenWidth, 300);
    }];
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    textField.inputAccessoryView = [self keyboardToolBar];
    return YES;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    nTitle = [textField.text stringByAppendingString:string];
    return YES;
}

- (BOOL)textViewShouldBeginEditing:(UITextView *)textView
{
    textView.inputAccessoryView = [self keyboardToolBar];
    return YES;
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    nDescription = [textView.text stringByAppendingString:text];
    return YES;
}
@end
