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
@interface AddNoteView()<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate,SelectTimeDelegate>
{
    NSArray *cellTitleArr;
    
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
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight - 44 - 64) style:UITableViewStyleGrouped];
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
    _timeSheet = [[SelectTimeSheet alloc] initWithFrame:CGRectMake(0, 200, ScreenWidth, 300)];
    _timeSheet.delegate = self;
    
    [_timeSheet show];
    [self addSubview:_timeSheet];
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
        
    }
    else if (row == 1)
    {
        cell.textLabel.text = [cellTitleArr objectAtIndex:row];
        
        self.timeLab = InitObject(UILabel);
        self.timeLab.frame = CGRectMake( 120, 10, SizeFrom750(280), SizeFrom750(60));
        self.timeLab.text = @"....-..-..-..";
        [cell.contentView addSubview:_timeLab];
        
        UIButton *selectBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        selectBtn.frame = CGRectMake(ScreenWidth - 60, 10, SizeFrom750(120), SizeFrom750(60));
        [selectBtn setTitle:@"选择时间" forState:UIControlStateNormal];
        [selectBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [selectBtn addTarget:self action:@selector(selectNoteTime) forControlEvents:UIControlEventTouchUpInside];
        [cell.contentView addSubview:selectBtn];
    }
    else if (row == 2) {
        TextViewCell *tcell = [[TextViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellid];
        tcell.titleLab.text = [cellTitleArr objectAtIndex:row];
        
        cell = tcell;
    }
    
    return cell;
}

//- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
//{
//
//}
//
//- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
//{
//
//}

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

//- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
//{
//
//}

//SelectTimeSheet Delegate
- (void)dataPickerSaveBtn:(NSString *)time
{
    _timeLab.text = time;
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


@end
