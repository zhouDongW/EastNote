//
//  ChangeThemeView.m
//  EasyNotePro
//
//  Created by zhoudongwei on 2018/1/3.
//  Copyright © 2018年 ZSwift. All rights reserved.
//

#import "ChangeThemeView.h"

@interface ChangeThemeView()
{
    
}


@end
@implementation ChangeThemeView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initLabel];
    }
    return self;
}

- (void)initLabel
{
    _blueLab = InitObject(UIButton);
    _blueLab.frame = CGRectMake(15, 64, 120, 30);
    _blueLab.titleLabel.font = [UIFont systemFontOfSize:22];
    [_blueLab setTitle:@"天蓝" forState:UIControlStateNormal];
    [_blueLab setTitleColor:mianBlue forState:UIControlStateNormal];
    [self addSubview:_blueLab];
    
    _orangeLab = InitObject(UIButton);
    _orangeLab.frame = CGRectMake(15, BOTTOM(_blueLab)+40, 120, 30);
    _orangeLab.titleLabel.font = [UIFont systemFontOfSize:22];
    [_orangeLab setTitle:@"橙黄" forState:UIControlStateNormal];
    [_orangeLab setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    [self addSubview:_orangeLab];
    
    _redLab = InitObject(UIButton);
    _redLab.frame = CGRectMake(15, BOTTOM(_orangeLab)+40, 120, 30);
    _redLab.titleLabel.font = [UIFont systemFontOfSize:22];
    [_redLab setTitle:@"鲜红" forState:UIControlStateNormal];
    [_redLab setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [self addSubview:_redLab];
    
    //点击事件添加到vc上
//    [_blueLab addTarget:self action:@selector(blueClick) forControlEvents:UIControlEventTouchUpInside];
//    [_orangeLab addTarget:self action:@selector(orangeClick) forControlEvents:UIControlEventTouchUpInside];
//    [_redLab addTarget:self action:@selector(redClick) forControlEvents:UIControlEventTouchUpInside];
}


@end
