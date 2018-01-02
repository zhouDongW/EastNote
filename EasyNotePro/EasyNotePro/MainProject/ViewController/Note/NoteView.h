//
//  NoteView.h
//  EasyNotePro
//
//  Created by zhoudongwei on 2017/12/28.
//  Copyright © 2017年 ZSwift. All rights reserved.
//

#import "BaseView.h"

typedef void(^pushBlock)(NSInteger index);
typedef void(^delBlock)(NSString *nid);
@interface NoteView : BaseView
{
    
}
Strong UITableView *tableView;
Copy pushBlock pBlock;
Copy delBlock dBlock;

- (void)configNoteView:(NSMutableArray *)mainDataArr;
@end
