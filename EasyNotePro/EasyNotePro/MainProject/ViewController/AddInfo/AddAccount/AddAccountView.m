//
//  AddAccountView.m
//  EasyNotePro
//
//  Created by zhoudongwei on 2017/12/28.
//  Copyright © 2017年 ZSwift. All rights reserved.
//

#import "AddAccountView.h"
@interface AddAccountView()<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate>
{
    NSArray *titleArr;
    NSArray *placeHolderArr;    //palceholder内容
    NSArray *valueArr;
    
    NSString *titleStr;
    NSString *typeStr;
    NSString *accountStr;
    NSString *passwordStr;
    NSString *descriptStr;
}
Strong UITableView *tableView;

@end
@implementation AddAccountView

- (instancetype)init
{
    self = [super init];
    if (self) {
        titleArr = @[@"标题",@"类型",@"账号",@"密码",@"描述"];
        placeHolderArr = @[@"给这条账号记录定个标题吧",@"它是什么类型呢",@"输入您的账号",@"输入您的密码",@"该怎么描述它呢"];
        
        [self initTableView];
    }
    return self;
}

- (void)initTableView
{
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight) style:UITableViewStyleGrouped];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    self.tableView.showsVerticalScrollIndicator = NO;
    self.tableView.scrollEnabled = NO;
    self.tableView.allowsSelection = NO;
    self.tableView.sectionHeaderHeight = SizeFrom750(1);
    [self addSubview:self.tableView];
    
}

- (void)saveAccountInfo
{
    
    if (_isSaveUpdate) { //更新数据
        //输入提示判断
        if (titleStr && typeStr && accountStr && passwordStr && descriptStr) {
            //传值
            if (self.block_update) {
                self.block_update(_accid,titleStr, typeStr, accountStr, passwordStr, descriptStr);
            }
        }
        else
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"tip" message:@"somevalue nil" delegate:self cancelButtonTitle:@"yes" otherButtonTitles:nil];
            [alert show];
        }
    }
    else
    {
        //输入提示判断
        if (titleStr && typeStr && accountStr && passwordStr && descriptStr) {
            //传值
            if (self.block_AccountInfo) {
                self.block_AccountInfo(titleStr, typeStr, accountStr, passwordStr, descriptStr);
            }
        }
        else
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"tip" message:@"somevalue nil" delegate:self cancelButtonTitle:@"yes" otherButtonTitles:nil];
            [alert show];
        }
    }
}

- (void)configTextField:(AccountTable *)model
{
    if (model.title  && model.account && model.password && model.descript) {
        NSString *typeStr = [NSString stringWithFormat:@"%ld",(long)model.type];
        valueArr = @[model.title,@"0",model.account,model.password,model.descript];
    }
    
}

- (void)changeTextFieldEdit
{
    [_tableView reloadData];
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

#pragma mark Delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [titleArr count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellid = @"addInfoCell";
    UITableViewCell *cell  = [tableView dequeueReusableCellWithIdentifier:cellid];
    
    if (cell == nil)
    {
        cell =[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle
                                    reuseIdentifier:cellid];
    }
    cell.textLabel.text = [titleArr objectAtIndex:indexPath.row];
    
    UITextField *textfield = [[UITextField alloc] init];
    textfield.frame = CGRectMake(140, (normalCellH - SizeFrom750(60))/2, SizeFrom750(460), SizeFrom750(60));
    textfield.borderStyle = UITextBorderStyleRoundedRect;
    textfield.textAlignment = NSTextAlignmentRight;
    textfield.tag = textfieldTag + indexPath.row;
    textfield.delegate = self;
    textfield.placeholder = [placeHolderArr objectAtIndex:indexPath.row];
    [cell.contentView addSubview:textfield];
    if ([valueArr count] == 5) {
        textfield.text = [valueArr objectAtIndex:indexPath.row];
        //textfield.userInteractionEnabled = NO;
        //textfield.borderStyle = UITextBorderStyleNone;
        
        titleStr = [valueArr objectAtIndex:0];
        typeStr = [valueArr objectAtIndex:1];
        accountStr = [valueArr objectAtIndex:2];
        passwordStr = [valueArr objectAtIndex:3];
        descriptStr = [valueArr objectAtIndex:4];
    }
    
    if (_isCanEdit == YES) {
        textfield.userInteractionEnabled = YES;
    }
    else
    {
        textfield.userInteractionEnabled = NO;
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
    [saveBtn addTarget:self action:@selector(saveAccountInfo) forControlEvents:UIControlEventTouchUpInside];
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
    return normalCellH;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return SizeFrom750(1);
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 80.f;
}

//textfield delegate
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    NSInteger tag = textField.tag;
    NSString *newStr = nil;
    
    switch (tag) {
        case 1001:
        {
            newStr = [textField.text stringByAppendingString:string];
            //NSLog(@"%@",newStr);
            titleStr = newStr;
        }
            break;
        case 1002:
        {
            newStr = [textField.text stringByAppendingString:string];
            typeStr = newStr;
        }
            break;
        case 1003:
        {
            newStr = [textField.text stringByAppendingString:string];
            accountStr = newStr;
        }
            break;
        case 1004:
        {
            newStr = [textField.text stringByAppendingString:string];
            passwordStr = newStr;
        }
            break;
        case 1005:
        {
            newStr = [textField.text stringByAppendingString:string];
            descriptStr = newStr;
        }
            break;
        default:
            break;
    }
    return YES;
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    textField.inputAccessoryView = [self keyboardToolBar];
    return YES;
}

@end
