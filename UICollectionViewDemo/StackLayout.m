//
//  StackLayout.m
//  UICollectionViewDemo
//
//  Created by QianLei-Mac on 15/6/23.
//  Copyright (c) 2015年 channe-Mac. All rights reserved.
//

#import "StackLayout.h"
#define kCalcAngle(x) x * M_PI / 180.0

@implementation StackLayout

//允许CollectionView Bounds发生变化时，重新进行布局
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds {
    return YES;
}

//返回rect中的所有的元素的布局属性,返回的是包含UICollectionViewLayoutAttributes的NSArray
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

//返回对应于indexPath的位置的cell的布局属性
- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%@",NSStringFromClass([self class]));
    NSLog(@"%@", NSStringFromSelector(_cmd));
    NSLog(@"%@", indexPath);
    
    UICollectionViewLayoutAttributes *attrs = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    attrs.size = CGSizeMake(150, 150);
    attrs.center = CGPointMake(self.collectionView.frame.size.width * 0.5, self.collectionView.frame.size.height * 0.5);
    
    NSInteger index = indexPath.item;
    CGFloat angles[] ={0,15,30,45,60};
    NSInteger count = [self.collectionView numberOfItemsInSection:0];
    
    if (index >= 5) {
        attrs.hidden = YES;
    } else {
        attrs.transform = CGAffineTransformMakeRotation(kCalcAngle(angles[index]));
        attrs.zIndex = count - index;
    }
    
    return attrs;
}

@end
