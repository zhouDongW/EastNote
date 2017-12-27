//
//  AccountView.h
//  EasyNotePro
//
//  Created by zhoudongwei on 2017/12/21.
//  Copyright © 2017年 ZSwift. All rights reserved.
//

#import "BaseView.h"

typedef void(^pushBlock)(NSInteger index);
typedef void(^refreshBlock)(void);
typedef void(^deleBlock)(NSString *accountid);
@interface AccountView : BaseView
{
    
}
Strong UITableView *tableView;

Copy pushBlock pBlock;
Copy refreshBlock reBlock;
Copy deleBlock deBlock;
- (void)configAccountView:(NSMutableArray *)mainDataArr;
@end
