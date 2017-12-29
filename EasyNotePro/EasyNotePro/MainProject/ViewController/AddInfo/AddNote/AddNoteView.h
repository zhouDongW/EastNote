//
//  AddNoteView.h
//  EasyNotePro
//
//  Created by zhoudongwei on 2017/12/28.
//  Copyright © 2017年 ZSwift. All rights reserved.
//

#import "BaseView.h"

typedef void(^dataSave)(NSString *ntitle,NSString *ntime,NSString *ndescript);
@interface AddNoteView : BaseView

Copy dataSave sBlock;
@end
