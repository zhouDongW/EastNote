//
//  PersonDataModel.m
//  EasyNotePro
//
//  Created by zhoudongwei on 2017/12/27.
//  Copyright © 2017年 ZSwift. All rights reserved.
//

#import "PersonDataModel.h"

@implementation PersonDataModel
+ (void)saveUserIcon:(UIImage *)iconimg
{
    NSFileManager *fm = [NSFileManager defaultManager];
    NSString *path = PATH_OF_DOCUMENT;
    path = [NSString stringWithFormat:@"%@/Icon",path];
    [fm  createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:nil];
    path = [NSString stringWithFormat:@"%@/icon.png",path];
    NSData *data = UIImagePNGRepresentation(iconimg);
    [data writeToFile:path atomically:YES];
}

+ (UIImage *)getIconImg
{
    NSString *path = PATH_OF_DOCUMENT;
    path = [NSString stringWithFormat:@"%@/Icon/icon.png",path];
    NSData *data = [[NSData alloc] initWithContentsOfFile:path];
    UIImage *img = [[UIImage alloc] initWithData:data scale:1.0];
    return img;
}
@end
