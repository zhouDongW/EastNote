//
//  SelectTimeSheet.m
//  EasyNotePro
//
//  Created by zhoudongwei on 2017/12/29.
//  Copyright © 2017年 ZSwift. All rights reserved.
//

#import "SelectTimeSheet.h"
@interface SelectTimeSheet()<UIPickerViewDelegate,UIPickerViewDataSource>
Strong UIView *dataView;
Strong UIPickerView *pickerView;
Strong UIView *toolView;
Strong UILabel *titleLab;

Strong NSMutableArray *dataArry;  //总数据源


//数据数组
Strong NSMutableArray *yearArr;
Strong NSMutableArray *monthArr;
Strong NSMutableArray *dayArr;
Strong NSMutableArray *hourArr;
Strong NSArray *timeArr;  //当前时间数组

//选中的时间字段
Copy NSString *year;
Copy NSString *month;
Copy NSString *day;
Copy NSString *hour;
@end

@implementation SelectTimeSheet

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        
        [self configArrData];
        [self configToolView];
        [self configPickerView];
    }
    return self;
}

- (void)configArrData
{
    _dataArry = [[NSMutableArray alloc] init];
    [_dataArry addObject:self.yearArr];
    [_dataArry addObject:self.monthArr];
    [_dataArry addObject:self.dayArr];
    [_dataArry addObject:self.hourArr];
}

- (NSMutableArray *)yearArr
{
    if (!_yearArr) {
        _yearArr = [[NSMutableArray alloc] init];
        for (int i = 1970; i < 2099; i++) {
            [_yearArr addObject:[NSString stringWithFormat:@"%d年",i]];
        }
    }
    return _yearArr;
}
- (NSMutableArray *)monthArr
{
    if (!_monthArr) {
        _monthArr = [[NSMutableArray alloc] init];
        for (int i = 1; i <= 12; i++) {
            [_monthArr addObject:[NSString stringWithFormat:@"%d月",i]];
        }
    }
    return _monthArr;
}
- (NSMutableArray *)dayArr
{
    if (!_dayArr) {
        _dayArr = [[NSMutableArray alloc] init];
        for (int i = 1; i <= 31; i++) {
            [_dayArr addObject:[NSString stringWithFormat:@"%d日",i]];
        }
    }
    return _dayArr;
}
- (NSMutableArray *)hourArr
{
    if (!_hourArr) {
        _hourArr = [[NSMutableArray alloc] init];
        for (int i = 0; i < 24; i++) {
            [_hourArr addObject:[NSString stringWithFormat:@"%d时",i]];
        }
    }
    return _hourArr;
}
- (NSArray *)timeArr
{
    if (!_timeArr) {
        _timeArr = [[NSArray alloc] init];
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"yyyy年,MM月,dd日,HH时"];
        NSDate *date = [NSDate date];
        NSString *time = [formatter stringFromDate:date];
        _timeArr = [time componentsSeparatedByString:@","];
    }
    return _timeArr;
}

- (void)configToolView
{
    self.toolView = InitObject(UIView);
    self.toolView.frame = CGRectMake(0, 0, ScreenWidth, 44);
    [self addSubview:_toolView];
    
    UIButton *saveBtn = InitObject(UIButton);
    saveBtn.frame = CGRectMake(ScreenWidth - 50, 5, 40, 40);
    [saveBtn setTitle:@"确定" forState:UIControlStateNormal];
    [saveBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [saveBtn addTarget:self action:@selector(saveClick) forControlEvents:UIControlEventTouchUpInside];
    [_toolView addSubview:saveBtn];
    
    UIButton *cancelBtn = InitObject(UIButton);
    cancelBtn.frame = CGRectMake(10, 5, 40, 40);
    [cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
    [cancelBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [cancelBtn addTarget:self action:@selector(cancelClick) forControlEvents:UIControlEventTouchUpInside];
    [_toolView addSubview:cancelBtn];
    
    self.titleLab = InitObject(UILabel);
    self.titleLab.frame = CGRectMake(60, 5, ScreenWidth - 120, 40);
    self.titleLab.textAlignment = NSTextAlignmentCenter;
    self.titleLab.textColor = [UIColor blackColor];
    self.titleLab.text = @"选择时间";
    [_toolView addSubview:_titleLab];
}

- (void)configPickerView
{
    self.pickerView = InitObject(UIPickerView);
    self.pickerView.frame = CGRectMake(0, BOTTOM(_toolView), ScreenWidth, HEIGHT(self) - 44);
    self.pickerView.backgroundColor = [UIColor whiteColor];
    self.pickerView.dataSource = self;
    self.pickerView.delegate = self;
    self.pickerView.showsSelectionIndicator = YES;  //显示器
    [self addSubview:_pickerView];
}
- (void)cancelClick
{
    if ([self.delegate respondsToSelector:@selector(dataPickerCancelBtn)]) {
        [self.delegate dataPickerCancelBtn];
    }
}

- (void)saveClick
{
    NSString *wholeTime = [NSString stringWithFormat:@"%@-%@-%@-%@",_year,_month,_day,_hour];
    if ([self.delegate respondsToSelector:@selector(dataPickerSaveBtn:)]) {
        [self.delegate dataPickerSaveBtn:wholeTime];
    }
}
#pragma mark Delegate
//PickerView Delegate
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView;
{
    return [_dataArry count];
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    //NSLog(@"%lu",(unsigned long)[_dataArry[component] count]);
    return [_dataArry[component] count];
    
}

- (nullable NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
//    NSLog(@"%@",[_dayArr[component] objectAtIndex:row%[_dataArry[component] count]]);
//    return [_dayArr[component] objectAtIndex:row%[_dataArry[component] count]];
    NSString *title;
    if (component == 0) {
        title = [_yearArr objectAtIndex:row];
    }
    else if (component == 1)
    {
        title = [_monthArr objectAtIndex:row];
    }
    else if (component == 2)
    {
        title = [_dayArr objectAtIndex:row];
    }
    else
    {
        title = [_hourArr objectAtIndex:row];
    }
    return title;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if (component == 0) {
        _year = [_yearArr objectAtIndex:row];
    }
    else if (component == 1)
    {
        _month = [_monthArr objectAtIndex:row];
    }
    else if (component == 2)
    {
        _day = [_dayArr objectAtIndex:row];
    }
    else if (component == 3)
    {
        _hour = [_hourArr objectAtIndex:row];
    }
}

- (void)show
{
    _year = [NSString stringWithFormat:@"%ld年",[self.timeArr[0] integerValue]];
    //_month = [NSString stringWithFormat:@"%ld月",[_timeArr[1] integerValue]];
    _month = @"9月";
    _day = [NSString stringWithFormat:@"%ld日",[_timeArr[2] integerValue]];
    _hour = [NSString stringWithFormat:@"%ld时",[_timeArr[3] integerValue]];
    
    [_pickerView selectRow:[_yearArr indexOfObject:_year] inComponent:0 animated:YES];
    [_pickerView selectRow:[_monthArr indexOfObject:_month] inComponent:1 animated:YES];
    [_pickerView selectRow:[_dayArr indexOfObject:_day] inComponent:2 animated:YES];
    [_pickerView selectRow:[_hourArr indexOfObject:_hour] inComponent:3 animated:YES];
    
}
@end
