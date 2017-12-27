//
//  PersonDataModel.h
//  EasyNotePro
//
//  Created by zhoudongwei on 2017/12/27.
//  Copyright © 2017年 ZSwift. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PersonDataModel : NSObject
+ (void)saveUserIcon:(UIImage *)iconimg;

+ (UIImage *)getIconImg;
@end
