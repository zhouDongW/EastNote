//
//  SelectImgSheet.m
//  EasyNotePro
//
//  Created by zhoudongwei on 2017/12/27.
//  Copyright © 2017年 ZSwift. All rights reserved.
//

#import "SelectImgSheet.h"

@interface SelectImgSheet ()
{
    
}
Strong UIView *bgView;
Strong UIButton *selectImg;  //从相册选择按钮
Strong UIButton *takePhoto;  //拍照按钮
Strong UIButton *cancelBtn;  //取消按钮

@end

@implementation SelectImgSheet

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self initSheet];
    }
    return self;
}

- (void)initSheet
{
    [self setBackgroundColor:[UIColor colorWithWhite:0.5 alpha:0.8]];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hiddenSheet)];
    [self addGestureRecognizer:tap];
    
    //bgView
    self.bgView = InitObject(UIView);
    self.bgView.frame = CGRectMake(0, ScreenHeight * 0.7, ScreenWidth, ScreenHeight * 0.3);
    self.bgView.backgroundColor = [UIColor whiteColor];
    [self addSubview:_bgView];
    
    //
    self.selectImg = InitObject(UIButton);
    self.selectImg.frame = CGRectMake((ScreenWidth - SizeFrom750(480))/2, SizeFrom750(20), SizeFrom750(480), SizeFrom750(80));
    [self.selectImg setTitle:@"从相册选择" forState:UIControlStateNormal];
    [self.selectImg setTintColor:[UIColor whiteColor]];
    [self.selectImg setBackgroundColor:mianBlue];
    [self.selectImg addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.bgView addSubview:_selectImg];
    
    self.takePhoto = InitObject(UIButton);
    self.takePhoto.frame = CGRectMake((ScreenWidth - SizeFrom750(480))/2, BOTTOM(_selectImg) + 15, SizeFrom750(480), SizeFrom750(80));
    [self.takePhoto setTitle:@"拍照" forState:UIControlStateNormal];
    [self.takePhoto setTintColor:[UIColor whiteColor]];
    [self.takePhoto setBackgroundColor:mianBlue];
    [self.takePhoto addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.bgView addSubview:_takePhoto];
    
    self.cancelBtn = InitObject(UIButton);
    self.cancelBtn.frame = CGRectMake((ScreenWidth - SizeFrom750(480))/2, BOTTOM(_takePhoto) + 15, SizeFrom750(480), SizeFrom750(80));
    [self.cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
    [self.cancelBtn setTintColor:[UIColor whiteColor]];
    [self.cancelBtn setBackgroundColor:mianBlue];
    [self.cancelBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.bgView addSubview:_cancelBtn];
}

- (void)hiddenSheet
{
    [UIView animateWithDuration:0.3 animations:^{
        self.alpha = 0;
    }];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self removeAllSubviews];
    });
}

- (void)btnClick:(UIButton *)sender
{
    NSString *type;
    if ([sender isEqual:self.selectImg]) {
        type = @"lib";
    }
    else if ([sender isEqual:self.takePhoto])
    {
        type = @"photo";
    }
    else
    {
        type = @"cancel";
    }
    
    if (self.typeBlock) {
        self.typeBlock(type);
    }
}
@end
