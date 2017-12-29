//
//  AddInfoView.h
//  EasyNotePro
//
//  Created by zhoudongwei on 2017/12/22.
//  Copyright © 2017年 ZSwift. All rights reserved.
//

#import "BaseView.h"

typedef void(^pushBlock)(NSInteger index);
@interface AddInfoView : BaseView
{
    
}

Copy pushBlock pBlock;

- (void)hiddenView;
@end
