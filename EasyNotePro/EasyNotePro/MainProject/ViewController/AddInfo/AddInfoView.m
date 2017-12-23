//
//  AddInfoView.m
//  EasyNotePro
//
//  Created by zhoudongwei on 2017/12/22.
//  Copyright © 2017年 ZSwift. All rights reserved.
//

#import "AddInfoView.h"

@interface AddInfoView()<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate>
{
    NSArray *titleArr;
    NSArray *placeHolderArr;    //palceholder内容
    
    NSString *titleStr;
    NSString *typeStr;
    NSString *accountStr;
    NSString *passwordStr;
    NSString *descriptStr;
}
Strong UITableView *tableView;

@end

@implementation AddInfoView

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
@end
