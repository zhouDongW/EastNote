//
//  PersonVC.m
//  EasyNotePro
//
//  Created by zhoudongwei on 2017/12/21.
//  Copyright © 2017年 ZSwift. All rights reserved.
//

#import "PersonVC.h"
#import "ChangeThemeVC.h"

#import "PersonView.h"
#import "SelectImgSheet.h"

#import "PersonDataModel.h"


@interface PersonVC ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate>
{
    SelectImgSheet *selectSheet;
}
Strong PersonView *mainView;

@end

@implementation PersonVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"个人中心";
    
    _mainView = [[PersonView alloc] init];
    _mainView.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight);
    self.view = _mainView;
    
    __block typeof(self) weakSelf = self;
    _mainView.seBlock = ^() {
        selectSheet = [[SelectImgSheet alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight)];
        __block typeof(selectSheet) weakSheet = selectSheet;
        selectSheet.typeBlock = ^(NSString *type) {
            if ([type isEqualToString:@"lib"]) {
                [weakSelf getImgFromAlbum];
            }
            else if ([type isEqualToString:@"photo"])
            {
                [weakSelf getImgFromCamera];
            }
            else
            {
                [weakSelf cancelGetImg];
            }
            [weakSheet hiddenSheet];
        };
        [weakSelf.tabBarController.view addSubview:selectSheet];
    };
    
    UIImage *img = [PersonDataModel getIconImg];
    _mainView.iconImg.image = img;
    
    //tableview跳转block
    _mainView.pBlock = ^(NSInteger index) {
        switch (index) {
            case 0:
                {
                    
                }
                break;
            case 1:
            {
                
            }
                break;
            case 2:
            {
                
            }
                break;
            case 3: //换主题颜色
            {
                ChangeThemeVC *cvc = InitObject(ChangeThemeVC);
                [weakSelf pushViewController:cvc animated:YES];
            }
                break;
                
            default:
                break;
        }
    };
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

- (void)getImgFromAlbum
{
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    picker.delegate = self;
    picker.allowsEditing = YES;
    
    [self presentViewController:picker animated:YES completion:^{
        
    }];
}

- (void)getImgFromCamera
{
    UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeCamera;
    
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.delegate = self;
        picker.allowsEditing = YES;
        picker.sourceType = sourceType;
        
        [self presentViewController:picker animated:YES completion:^{
            
        }];
    }
}

- (void)cancelGetImg
{
    [selectSheet hiddenSheet];
}

#pragma mark Delegate
//
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    UIImage *img = [info objectForKey:UIImagePickerControllerEditedImage];
    _mainView.iconImg.image = img;
    [PersonDataModel saveUserIcon:img];
//    if () {
//
//    } else {
//
//    }
    
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:nil];
}

//

@end
