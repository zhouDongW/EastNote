//
//  PersonView.m
//  EasyNotePro
//
//  Created by zhoudongwei on 2017/12/21.
//  Copyright © 2017年 ZSwift. All rights reserved.
//

#import "PersonView.h"
@interface PersonView()<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate>
{
    NSArray *cellArr;
    
}
Strong UIImageView *topBg;
Strong UIImageView *iconImg;
Strong UIScrollView *scroll;
Strong UITableView *tableView;

@end

@implementation PersonView

- (instancetype)init
{
    self = [super init];
    if (self) {
        cellArr = @[@"1",@"2",@"3",@"4",@"5",@"6",@"7"];
        
        
        [self initTopView];
        [self initScrollView];
    }
    return self;
}

- (void)initTopView
{
    self.topBg = [[UIImageView alloc] initWithImage:IMAGEBYENAME(@"gr_bg")];
    self.topBg.frame = CGRectMake(0, 0, ScreenWidth, SizeFrom750(505));
    [self addSubview:_topBg];
    
    self.iconImg = [[UIImageView alloc] init];
    self.iconImg.frame = CGRectMake(0, 0, SizeFrom750(200), SizeFrom750(200));
    self.iconImg.center = CGPointMake(_topBg.center.x, _topBg.center.y - 20);
    ViewBorderRadius(_iconImg, SizeFrom750(100), 2, [UIColor grayColor]);
    [self.topBg addSubview:_iconImg];
}

- (void)initScrollView
{
    self.scroll = [[UIScrollView alloc] init];
    self.scroll.frame = CGRectMake(0, 5, ScreenWidth - 10, ScreenHeight - 44 -64);
    self.scroll.contentSize = CGSizeMake(ScreenWidth, ScreenHeight - 44 -64 + SizeFrom750(505) -30);
    self.scroll.userInteractionEnabled = YES;
    self.scroll.showsVerticalScrollIndicator = YES;  //垂直滚动条
    self.scroll.showsHorizontalScrollIndicator = NO; //水平滚动条
    self.scroll.alwaysBounceVertical = YES;
    self.scroll.bounces = NO;
    self.scroll.delegate = self;
    self.scroll.backgroundColor = [UIColor clearColor];
    [self addSubview:_scroll];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(5, SizeFrom750(505)-30, ScreenWidth - 10, ScreenHeight - 64 -44) style:UITableViewStyleGrouped];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    //self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.showsVerticalScrollIndicator = NO;
    //self.tableView.scrollEnabled = NO;
    self.tableView.allowsSelection = NO;
    self.tableView.sectionHeaderHeight = SizeFrom750(1);

    [_scroll addSubview:_tableView];
    
    NSLog(@"scrollViewFrame:%@",NSStringFromCGRect(_scroll.frame));
    NSLog(@"tableViewFrame:%@",NSStringFromCGRect(_tableView.frame));
}

#pragma mark Delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [cellArr count];
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
    cell.textLabel.text = [cellArr objectAtIndex:indexPath.row];
    
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
    return normalCellH;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return SizeFrom750(1);
}

//- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
//{
//
//}

//scrollView Delegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSLog(@"%f",_scroll.contentOffset.y);
    

}

@end
