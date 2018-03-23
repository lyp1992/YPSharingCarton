//
//  LYPCleanHomePageVC.m
//  LYPShareCartoolManager
//
//  Created by laiyp on 2018/3/21.
//  Copyright © 2018年 laiyongpeng. All rights reserved.
//

#import "LYPCleanHomePageVC.h"
#import "LYPCleanHomeCell.h"
#import "LYPPersonMainVC.h"
#import "LYPMessageMainVC.h"
#import "KKSliderMenuTool.h"

#import "LYPCleanMainVC.h"

@interface LYPCleanHomePageVC ()<UICollectionViewDelegate ,UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic, strong) NSArray *numArr;

@end

static NSString *cleanHomeCellId = @"cleanHomeCellId";
@implementation LYPCleanHomePageVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.numArr = @[@"A区男厕",@"A区女厕",@"B区男厕",@"B区女厕"];
    
    [self setNavBar];//导航栏
    [self setupUI];
}

-(void)setupUI
{
 
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    self.collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 64, self.view.width, self.view.height) collectionViewLayout:flowLayout];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    [self.collectionView registerClass:[LYPCleanHomeCell class] forCellWithReuseIdentifier:cleanHomeCellId];
    [self.view addSubview:self.collectionView];
}

-(void)setNavBar{
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithNomalImage:@"navigationbar_list_normal" selectImage:@"navigationbar_list_hl" target:self action:@selector(showPersonVC)];
    self.title = [LYPUserSingle shareUserSingle].deviceToken;
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithNomalImage:@"navigationbar_msg" selectImage:@"navigationbar_msg" target:self action:@selector(showMessageVC)];
    self.navigationController.navigationBar.backgroundColor =  RGBACOLOR(43, 45, 51, 1);

}
#pragma method
-(void)showPersonVC{
    
    LYPPersonMainVC *perVc = [[LYPPersonMainVC alloc]init];
    
    [KKSliderMenuTool showWithRootViewController:self contentViewController:perVc];
    
}

-(void)showMessageVC{
    
    LYPMessageMainVC *messVC = [[LYPMessageMainVC alloc]init];
    [self.navigationController pushViewController:messVC animated:YES];
}

#pragma mark --UICollectionViewDelegate
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.numArr.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    LYPCleanHomeCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cleanHomeCellId forIndexPath:indexPath];
    cell.titleStr = self.numArr[indexPath.item];
    return cell;
}

- (CGSize)collectionView:(UICollectionView*)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath*)indexPath{
    
    return CGSizeMake(150, 150);
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    LYPCleanMainVC *cleanMainVC = [[LYPCleanMainVC alloc]init];
    [self.navigationController pushViewController:cleanMainVC animated:YES];
}

@end
