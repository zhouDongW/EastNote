//
//  AddInfoView.m
//  EasyNotePro
//
//  Created by zhoudongwei on 2017/12/22.
//  Copyright © 2017年 ZSwift. All rights reserved.
//

#import "AddInfoView.h"
#import "AddItem.h"

@interface AddInfoView()<UICollectionViewDelegate,UICollectionViewDataSource>
{
    NSString *addItemID;
    NSArray *itemTitleArr;
    NSArray *itemImgArr;
}
Strong UIView *bgView;
Strong UIImageView *bgImgView;
Strong UICollectionView *collView;

@end

@implementation AddInfoView

- (instancetype)init
{
    self = [super init];
    if (self) {
        itemTitleArr = @[@"添加账号",@"添加随记",@"更多其他"];
        itemImgArr = @[@"",@"",@""];
        
//        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hiddenView)];
//        [self addGestureRecognizer:tap];
        
        self.backgroundColor = [UIColor whiteColor];
        
        [self initViewContent];
        
    }
    return self;
}

- (void)initViewContent
{
    UIControl *control = [[UIControl alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight * 0.65)];
    [control addTarget:self action:@selector(hiddenView) forControlEvents:UIControlEventTouchDown];
    [self addSubview:control];
    
    self.bgView = InitObject(UIView);
    self.bgView.frame = CGRectMake((ScreenWidth - SizeFrom750(710))/2, ScreenHeight * 0.65, SizeFrom750(710), ScreenHeight * 0.35);
    //self.bgView.backgroundColor = [UIColor grayColor];
    self.bgView.userInteractionEnabled = YES;
    [self addSubview:_bgView];
    
    self.bgImgView = InitObject(UIImageView);
    self.bgImgView.frame = CGRectMake(0, 0, SizeFrom750(710), SizeFrom750(139));
    self.bgImgView.image = IMAGEBYENAME(@"bg_sm");
    [_bgView addSubview:_bgImgView];
    
    [self initCollectionView];
}

- (void)initCollectionView
{
    addItemID = @"collViewItem";
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.minimumLineSpacing = 0;
    layout.minimumInteritemSpacing = 0;
    layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
    
    self.collView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, BOTTOM(_bgImgView), SizeFrom750(710), 150) collectionViewLayout:layout];
    self.collView.dataSource = self;
    self.collView.delegate = self;
    self.collView.scrollEnabled = NO;
    self.collView.backgroundColor = [UIColor whiteColor];
    [_bgView addSubview:_collView];
    
    [self.collView registerClass:[AddItem class] forCellWithReuseIdentifier:addItemID];
}

- (void)hiddenView
{
    self.alpha = 0;
    CGRect frame = self.frame;
    frame.origin.y = frame.origin.y + frame.size.height;
    self.frame = frame;
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self removeFromSuperview];
        
    });
}

#pragma mark Deleagte
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [itemTitleArr count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    AddItem *item = [collectionView dequeueReusableCellWithReuseIdentifier:addItemID forIndexPath:indexPath];
    if (item == nil) {
        item = [[AddItem alloc] init];
    }
    item.backgroundColor = [UIColor whiteColor];
    item.itemLab.text = [itemTitleArr objectAtIndex:indexPath.row];
    item.itemImg.image = IMAGEBYENAME([itemImgArr objectAtIndex:indexPath.row]);
    
    return item;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath;
{
    if (self.pBlock) {
        self.pBlock(indexPath.row);
    }
}

#pragma mark ---- UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return (CGSize){SizeFrom750(710)/4,SizeFrom750(120)};
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 0.f;
}

@end
