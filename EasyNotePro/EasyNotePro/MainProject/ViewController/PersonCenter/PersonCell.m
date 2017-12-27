//
//  PersonCell.m
//  EasyNotePro
//
//  Created by zhoudongwei on 2017/12/27.
//  Copyright © 2017年 ZSwift. All rights reserved.
//

#import "PersonCell.h"
@interface PersonCell()
{
    
}

@end

@implementation PersonCell

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
    _iconImg = InitObject(UIImageView);
    _iconImg.frame = CGRectMake(10, (normalCellH - SizeFrom750(60))/2, SizeFrom750(60), SizeFrom750(60));
    
    [self.contentView addSubview:_iconImg];
    
    _expLab = InitObject(UILabel);
    _expLab.frame = CGRectMake(RIGHT(_iconImg) + 20, (normalCellH - SizeFrom750(60))/2, SizeFrom750(180), SizeFrom750(60));
    _expLab.font = [UIFont systemFontOfSize:22];
    [_expLab setTextColor:[UIColor grayColor]];
    [self.contentView addSubview:_expLab];
}
@end
