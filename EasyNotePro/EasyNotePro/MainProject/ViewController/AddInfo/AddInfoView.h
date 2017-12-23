//
//  AddInfoView.h
//  EasyNotePro
//
//  Created by zhoudongwei on 2017/12/22.
//  Copyright © 2017年 ZSwift. All rights reserved.
//

#import "BaseView.h"

typedef void(^textInfo)(NSString *title, NSString *type, NSString *account, NSString *password, NSString *descript);
@interface AddInfoView : BaseView

Copy textInfo block_AccountInfo;
@end
