//
//  AddItem.m
//  EasyNotePro
//
//  Created by zhoudongwei on 2017/12/28.
//  Copyright © 2017年 ZSwift. All rights reserved.
//

#import "AddItem.h"

@implementation AddItem
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initItemContent];
    }
    return self;
}

- (void)initItemContent
{
    self.itemImg = InitObject(UIImageView);
    self.itemImg.frame = CGRectMake((SizeFrom750(710)/4 - SizeFrom750(80))/2, 0, SizeFrom750(80), SizeFrom750(80));
    //self.itemImg.center = CGPointMake(self.center.x, self.center.y);
    
    [self.contentView addSubview:_itemImg];
    
    self.itemLab = InitObject(UILabel);
    self.itemLab.frame = CGRectMake((SizeFrom750(710)/4 - SizeFrom750(100))/2, BOTTOM(_itemImg), SizeFrom750(100), SizeFrom750(40));
    //self.itemLab.center = CGPointMake(self.center.x, _itemLab.origin.y);
    self.itemLab.font = [UIFont systemFontOfSize:12.0];
    self.itemLab.text = @"itemTitle";
    [self.contentView addSubview:_itemLab];
    
    UIView *vline = InitObject(UIView);
    vline.frame = CGRectMake(SizeFrom750(710)/4 - 1, SizeFrom750(30), 1, SizeFrom750(90));
    vline.backgroundColor = [UIColor grayColor];
    [self.contentView addSubview:vline];
}
@end
