//
//  SelectTimeSheet.h
//  EasyNotePro
//
//  Created by zhoudongwei on 2017/12/29.
//  Copyright © 2017年 ZSwift. All rights reserved.
//
//时间选择菜单

#import "BaseView.h"
@protocol SelectTimeDelegate <NSObject>
- (void)dataPickerSaveBtn:(NSString *)time;
- (void)dataPickerCancelBtn;

@end

@interface SelectTimeSheet : BaseView

Copy NSString *title;
Weak id<SelectTimeDelegate>delegate;

- (void)show;
@end
