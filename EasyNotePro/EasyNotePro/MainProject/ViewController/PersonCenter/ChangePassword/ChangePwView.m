//
//  ChangePwView.m
//  EasyNotePro
//
//  Created by zhoudongwei on 2018/1/5.
//  Copyright © 2018年 ZSwift. All rights reserved.
//

#import "ChangePwView.h"

@interface ChangePwView()<UITextFieldDelegate>
{
    NSArray *placeholderArr;
    
}
Strong UITextField *oldPwTF;
Strong UITextField *newsPwTF;
Strong UITextField *renewsPwTF;
Strong UIButton *sureBtn;
@end

@implementation ChangePwView

- (instancetype)init
{
    self = [super init];
    if (self) {
        placeholderArr = @[@"验证旧密码",@"请输入新密码",@"再次输入新密码"];
        [self initContent];
    }
    return self;
}

- (void)initContent
{
    _oldPwTF = InitObject(UITextField);
    _oldPwTF.frame = CGRectMake(60, 80, ScreenWidth - 120, 40);
    //_oldPwTF.placeholder = [placeholderArr objectAtIndex:0];
    NSAttributedString *attributed = [[NSAttributedString alloc] initWithString:[placeholderArr objectAtIndex:0] attributes:@{NSForegroundColorAttributeName:[UIColor orangeColor]}];
    _oldPwTF.attributedPlaceholder = attributed;
    _oldPwTF.delegate = self;
    _oldPwTF.keyboardType = UIKeyboardTypeNumberPad;
    _oldPwTF.secureTextEntry = YES;
    [self addSubview:_oldPwTF];
    
    _newsPwTF = InitObject(UITextField);
    _newsPwTF.frame = CGRectMake(60, BOTTOM(_oldPwTF) + 60, ScreenWidth - 120, 40);
    _newsPwTF.placeholder = [placeholderArr objectAtIndex:1];
    _newsPwTF.keyboardType = UIKeyboardTypeNumberPad;
    [self addSubview:_newsPwTF];
    
    _renewsPwTF = InitObject(UITextField);
    _renewsPwTF.frame = CGRectMake(60, BOTTOM(_newsPwTF) + 60, ScreenWidth - 120, 40);
    _renewsPwTF.placeholder = [placeholderArr objectAtIndex:2];
    _renewsPwTF.keyboardType = UIKeyboardTypeNumberPad;
    [self addSubview:_renewsPwTF];
    
    _sureBtn = InitObject(UIButton);
    _sureBtn.frame = CGRectMake(70, BOTTOM(_renewsPwTF) + 60, ScreenWidth - 140, 40);
    [_sureBtn setTitle:@"确认修改" forState:UIControlStateNormal];
    [_sureBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_sureBtn addTarget:self action:@selector(sureClick) forControlEvents:UIControlEventTouchUpInside];
    [_sureBtn setBackgroundColor:mianBlue];
    [self addSubview:_sureBtn];
}

- (void)sureClick
{
    //输入值判断
    if ([self checkPw]) {
        if (self.sBlock) {
            self.sBlock(_renewsPwTF.text);
        }
    }
}

- (BOOL)checkPw
{
    NSString *pw0 = _oldPwTF.text;
    NSString *pw1 = _newsPwTF.text;
    NSString *pw2 = _renewsPwTF.text;
    
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    NSString *oldpw = [user objectForKey:@"screenKey"];
    if (![oldpw isEqualToString:pw0]) {
        //旧密码不正确
        //alert
        NSLog(@"旧密码不正确");
        return NO;
    }
    else if(![pw1 isEqualToString:pw2])
    {
        //新密码和确认密码不同
        //alert
        NSLog(@"新密码和确认密码不同");
        return NO;
    }
    return YES;
}
@end
