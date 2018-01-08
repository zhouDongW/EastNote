//
//  ChangePwView.h
//  EasyNotePro
//
//  Created by zhoudongwei on 2018/1/5.
//  Copyright © 2018年 ZSwift. All rights reserved.
//

#import "BaseView.h"

typedef void(^saveBlock)(NSString *newPw);
@interface ChangePwView : BaseView
{
    
}

Copy saveBlock sBlock;
@end
