//
//  SelectImgSheet.h
//  EasyNotePro
//
//  Created by zhoudongwei on 2017/12/27.
//  Copyright © 2017年 ZSwift. All rights reserved.
//
//图片选择弹出框

#import <UIKit/UIKit.h>

typedef void(^btnTypeBlock)(NSString *type);
@interface SelectImgSheet : UIView

Copy btnTypeBlock typeBlock;

- (void)hiddenSheet;
@end
