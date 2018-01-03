//
//  PersonView.h
//  EasyNotePro
//
//  Created by zhoudongwei on 2017/12/21.
//  Copyright © 2017年 ZSwift. All rights reserved.
//

#import "BaseView.h"

typedef void(^selectBlock)(void);
typedef void(^pushBlock)(NSInteger index);  //tableview点击跳转
@interface PersonView : BaseView
{
    
}
Strong UIImageView *iconImg;

Copy selectBlock seBlock;
Copy pushBlock pBlock;
@end
