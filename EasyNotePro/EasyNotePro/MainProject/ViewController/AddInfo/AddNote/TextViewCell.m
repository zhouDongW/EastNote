//
//  TextViewCell.m
//  EasyNotePro
//
//  Created by zhoudongwei on 2017/12/28.
//  Copyright © 2017年 ZSwift. All rights reserved.
//

#import "TextViewCell.h"
@interface TextViewCell()
{
    
}


@end

@implementation TextViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initCellContent];
    }
    return self;
}

- (void)initCellContent
{
    self.titleLab = InitObject(UILabel);
    self.titleLab.frame = CGRectMake(15, 5, SizeFrom750(180), SizeFrom750(60));
    
    [self.contentView addSubview:_titleLab];
    
    self.textView = InitObject(UITextView);
    self.textView.frame = CGRectMake(15, BOTTOM(_titleLab) + 10, ScreenWidth - 20, 140);
    self.textView.layer.borderWidth = 1.0;
    self.textView.layer.borderColor = [UIColor grayColor].CGColor;
//    self.textView.delegate = self;
    
    [self.contentView addSubview:_textView];
}
@end
