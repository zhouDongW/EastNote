//
//  TopSearBarView.h
//  EasyNotePro
//
//  Created by zhoudongwei on 2018/1/11.
//  Copyright © 2018年 ZSwift. All rights reserved.
//

#import "BaseView.h"

typedef void(^returnSearText)(NSString *text);
@interface TopSearBarView : BaseView
{
    
}
Copy returnSearText tBlock;
Strong UIButton *backBtn;
@end
