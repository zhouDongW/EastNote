//
//  TopSearBarView.m
//  EasyNotePro
//
//  Created by zhoudongwei on 2018/1/11.
//  Copyright © 2018年 ZSwift. All rights reserved.
//

#import "TopSearBarView.h"

@interface TopSearBarView()<UISearchBarDelegate>
{
    
}
Strong UISearchBar *searBar;

Strong UITableView *tableView;
@end
@implementation TopSearBarView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = mianBlue;
        [self initSearBar];
        [self initTableView];
    }
    return self;
}

- (void)initSearBar
{
    self.searBar = [[UISearchBar alloc] init];
    _searBar.frame = CGRectMake(40, NaviStatuBarHight + 10, ScreenWidth - 50, 30);
    _searBar.barTintColor = [UIColor whiteColor];  //搜索框背景颜色
    _searBar.backgroundImage = [[UIImage alloc] init];  //设置背景图，去掉上下黑线
    _searBar.showsCancelButton = YES;   //取消按钮不隐藏
    _searBar.placeholder = @"输入查询账号";
    //通过kvc获取私有变量searchField
    UITextField *textfield = [_searBar valueForKey:@"searchField"];
    if (textfield) {
        [textfield setBackgroundColor:[UIColor whiteColor]];
        textfield.layer.cornerRadius = 16.0f;
        //textfield.layer.borderColor = [UIColor colorWithRed:247/255.0 green:75/255.0 blue:31/255.0 alpha:1].CGColor;
        textfield.layer.borderWidth = 1;
        textfield.layer.masksToBounds = YES;
    }
    
    self.searBar.delegate = self;
    [self addSubview:_searBar];
    
    self.backBtn = InitObject(UIButton);
    _backBtn.frame = CGRectMake(5, NaviStatuBarHight + 10, 30, 30);
    [_backBtn setBackgroundImage:IMAGEBYENAME(@"back") forState:UIControlStateNormal];
    [self addSubview:_backBtn];
    
}

- (void)initTableView
{
    
}

#pragma mark searchbarDelegate
- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar
{
    
    
    return YES;
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    NSLog(@"%@",searchBar.text);
    
    if (self.tBlock) {
        self.tBlock(searchBar.text);
    }
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    [_searBar resignFirstResponder];
}
@end
