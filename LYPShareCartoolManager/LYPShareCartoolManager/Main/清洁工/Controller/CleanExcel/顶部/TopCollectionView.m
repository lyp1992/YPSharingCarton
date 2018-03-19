//
//  TopCollectionView.m
//  JoeExcelView
//
//  Created by Joe on 2016/12/9.
//  Copyright © 2016年 QQ. All rights reserved.
//

#import "TopCollectionView.h"
#import "TopCollectionViewCell.h"
#import "JoeExcel.h"

static NSString *topClIdentify = @"topCollectionViewCellIdentify";

@interface TopCollectionView ()<UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) NSArray *numArr;

@end

@implementation TopCollectionView
@synthesize numArr;

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(nonnull UICollectionViewLayout *)layout{
    if (self = [super initWithFrame:frame collectionViewLayout:layout]) {
        self.backgroundColor = [UIColor whiteColor];
        self.delegate = self;
        self.dataSource = self;
        [self registerClass:[TopCollectionViewCell class] forCellWithReuseIdentifier:topClIdentify];\
        
        numArr = @[@"设备ID", @"场所", @"大楼", @"楼层", @"类型", @"区域", @"蹲位", @"换纸", @"换电池"];
    }
    return self;
}

- (id)valueForUndefinedKey:(NSString *)key{
    return TopCollectionViewObserver;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}

#pragma mark --collectionViewDataSource&&collectionViewDelegate

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return numArr.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    TopCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:topClIdentify forIndexPath:indexPath];
    cell.topTextLab.text = numArr[indexPath.row];
    return cell;
}

- (CGSize)collectionView:(UICollectionView*)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath*)indexPath{
    
    return CGSizeMake(100, 45);
}


- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    
    return 0;
    
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    
    return 0;
    
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    [self setValue:[NSValue valueWithCGPoint:scrollView.contentOffset] forKey:TopCollectionViewObserver];
}

@end
