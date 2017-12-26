//
//  AccountView.m
//  EasyNotePro
//
//  Created by zhoudongwei on 2017/12/21.
//  Copyright © 2017年 ZSwift. All rights reserved.
//

#import "AccountView.h"
#import "AccountCell.h"

#import "AccountModel.h"

@interface AccountView()<UITableViewDelegate,UITableViewDataSource>
{
    NSMutableArray *dataArr;
}


@end

@implementation AccountView

- (instancetype)init
{
    self = [super init];
    if (self) {
        dataArr = [[NSMutableArray alloc] init];
        
        [self initTableView];
    }
    return self;
}

- (void)initTableView
{
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight) style:UITableViewStyleGrouped];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    //self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.showsVerticalScrollIndicator = NO;
//    self.tableView.scrollEnabled = NO;
    //self.tableView.allowsSelection = NO;
    self.tableView.sectionHeaderHeight = SizeFrom750(1);
    [self addSubview:self.tableView];
    
}

- (void)configAccountView:(NSMutableArray *)mainDataArr
{
    dataArr = mainDataArr;
    [self.tableView reloadData];
    
}

#pragma mark Delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [dataArr count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellid = @"mycell";
    UITableViewCell *cell  = [tableView dequeueReusableCellWithIdentifier:cellid];
    
    if (cell == nil)
    {
        cell =[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle
                                    reuseIdentifier:cellid];
    }
    AccountTable *model = [[AccountTable alloc] init];
    model = [dataArr objectAtIndex:indexPath.row];
    cell.textLabel.text = model.title;
    
    return cell;
}

//- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
//{
//
//}

//- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
//{
//
//}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (_pBlock) {
        self.pBlock(indexPath.row);
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return normalCellH;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 1.0f;
}

//- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
//{
//
//}

@end
