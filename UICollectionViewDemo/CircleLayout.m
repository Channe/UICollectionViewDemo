//
//  CircleLayout.m
//  UICollectionViewDemo
//
//  Created by QianLei-Mac on 15/6/23.
//  Copyright (c) 2015年 channe-Mac. All rights reserved.
//

#import "CircleLayout.h"
#define kCalcAngle(x) x * M_PI / 180.0 

@implementation CircleLayout

//允许CollectionView Bounds发生变化时，重新进行布局
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds {
    return YES;
}

-(NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSLog(@"%@",NSStringFromClass([self class]));
    NSLog(@"%@", NSStringFromSelector(_cmd));
    
    NSMutableArray *array = [NSMutableArray array];
    NSInteger count = [self.collectionView numberOfItemsInSection:0];
    
    for (int i=0; i<count; i++) {
        UICollectionViewLayoutAttributes *attrs = [self layoutAttributesForItemAtIndexPath:[NSIndexPath indexPathForItem:i inSection:0]];
        [array addObject:attrs];
    }
    
    return array;
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%@",NSStringFromClass([self class]));
    NSLog(@"%@", NSStringFromSelector(_cmd));
    NSLog(@"%@", indexPath);
    
    UICollectionViewLayoutAttributes *attrs = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    attrs.size = CGSizeMake(60, 60);
    
    // 第几个Item
    NSInteger index = indexPath.item;
    
    // 半径100
    CGFloat radius = 100;
    
    // 圆心
    CGFloat circleX = self.collectionView.frame.size.width * 0.5;
    CGFloat circleY = self.collectionView.frame.size.height * 0.5;
    
    NSInteger count = [self.collectionView numberOfItemsInSection:0];
    CGFloat singleItemAngle = 360.0 / count;
    
    // 计算各个环绕的图片center
    attrs.center = CGPointMake(circleX + radius * cosf(kCalcAngle(singleItemAngle * index)), circleY - radius * sinf(kCalcAngle(singleItemAngle * index)));
    
    return attrs;
}

@end
