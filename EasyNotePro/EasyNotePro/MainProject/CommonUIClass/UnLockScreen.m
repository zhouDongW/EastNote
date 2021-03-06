//
//  UnLockScreen.m
//  EasyNotePro
//
//  Created by zhoudongwei on 2018/1/8.
//  Copyright © 2018年 ZSwift. All rights reserved.
//

#import "UnLockScreen.h"

@interface UnLockScreen()<UITextFieldDelegate>
{
    
}
Strong UITextField *keyInputTF;
Strong UIButton *sureBtn;

@end

@implementation UnLockScreen

- (instancetype) init
{
    self = [super init];
    if (self) {
        
        self.backgroundColor = [UIColor colorWithWhite:1 alpha:0.8];
        [self initScreenContent];
    }
    return self;
}

- (void)initScreenContent
{
    _keyInputTF = InitObject(UITextField);
    _keyInputTF.frame = CGRectMake(60, 140, ScreenWidth - 120, 40);
    _keyInputTF.borderStyle = UITextBorderStyleRoundedRect;
    _keyInputTF.placeholder = @"输入锁屏密码";
    _keyInputTF.textAlignment = NSTextAlignmentCenter;
    _keyInputTF.delegate = self;
    _keyInputTF.keyboardType = UIKeyboardTypeNumberPad;
    [self addSubview:_keyInputTF];
    
    _sureBtn = InitObject(UIButton);
    _sureBtn.frame = CGRectMake(80, BOTTOM(_keyInputTF) + 80, ScreenWidth - 160, 40);
    [_sureBtn setTitle:@"确定" forState:UIControlStateNormal];
    [_sureBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_sureBtn setBackgroundColor:mianBlue];
    [_sureBtn addTarget:self action:@selector(sureClick) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_sureBtn];
    
}

- (void)sureClick
{
    NSString *getKey = _keyInputTF.text;
    
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    NSString *saveKey = [user objectForKey:@"screenKey"];
    if ([saveKey isEqualToString:getKey]) {
        [self hiddenLock];
    } else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"tip" message:@"screct key error" delegate:self cancelButtonTitle:@"qure" otherButtonTitles:nil, nil];
        [alert show];
    }
}

- (void)hiddenLock
{
    [self removeFromSuperview];
}
@end
