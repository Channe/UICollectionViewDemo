//
//  FlowLayout.m
//  UICollectionViewDemo
//
//  Created by QianLei-Mac on 15/6/11.
//  Copyright (c) 2015年 channe-Mac. All rights reserved.
//

#import "FlowLayout.h"
#define kItemWidth 400

@implementation FlowLayout

-(instancetype)init
{
    if(self=[super init]){
        
    }
    return self;
}

//对布局中的内容进行初始化工作。如果init方法中执行的代码不起作用，可以放在prepareLayout中
- (void)prepareLayout {
    [super prepareLayout];
    // 设置为水平滚动
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
//    self.scrollDirection = UICollectionViewScrollDirectionVertical;

    // 设置每个Item之间的距离
    self.minimumLineSpacing = 50.0;
    // section中cell的边界范围(上/左/下/右)
    self.sectionInset = UIEdgeInsetsMake(100, 0.0, 100, 0.0);
    // 重新设置Item的尺寸，不然的话，有等比例缩小的可能
    self.itemSize = CGSizeMake(kItemWidth, kItemWidth);
}

#pragma mark - 重写父类的方法
//允许CollectionView Bounds发生变化时，重新进行布局
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds {
    return YES;
}

//获取CollectionView的所有Item项的layout，进行相应的处理(移动过程中，控制各个Item的缩放比例)
-(NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSArray *array = [super layoutAttributesForElementsInRect:rect];
    
    // 设置第一个和最后一个默认居中显示
//    NSLog(@"self.collectionView.frame.size.width:%f",self.collectionView.frame.size.width);
    CGFloat inset = (self.collectionView.frame.size.width - kItemWidth) * 0.5;
    self.collectionView.contentInset = UIEdgeInsetsMake(0, inset, 0, inset);//上/左/下/右
    
//    CGRect visibleRect;
//    visibleRect.origin =self.collectionView.contentOffset;
//    visibleRect.size = self.collectionView.frame.size;
    
//    CGFloat collectionViewCenterX = self.collectionView.contentOffset.x + self.collectionView.frame.size.width * 0.5;
//    
//    for (UICollectionViewLayoutAttributes *attrs in array)
//    {
//        // 只处理正在界面上面显示的Item
//        if(!CGRectIntersectsRect(visibleRect, attrs.frame)){
//            continue;
//        }
//        
//        // 计算各个Item的缩放比例(距离中线越近，缩放比例就越大)
//        CGFloat scale;
//        // 防止突变的情况(当Item的中心与collectionView中心的距离大于等于collectionView宽度的一半时，Item不缩放，平稳过度)
//        if(ABS(attrs.center.x - collectionViewCenterX) >= self.collectionView.frame.size.width * 0.5){
//            scale = 1;
//        }
//        else{
//            scale = 1 + 0.8 * (1 - ABS(attrs.center.x - collectionViewCenterX) / (self.collectionView.frame.size.width * 0.5));
//        }
//        //3D仿射变换
//        attrs.transform3D = CATransform3DMakeScale(scale, scale, 1);
//    }
    
    return array;
}

// 对于Item的细节计算，可以调用下面的方法，完成定位处理
// 当UICollectionView停止的那一刻ContentOffset的值(控制UICollectionView停止时，有一个Item一定居中显示)
// 1.proposedContentOffset默认的ContentOffset
- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity
{
    //1. 获取UICollectionView停止的时候的可视范围
    CGRect contentFrame;
    contentFrame.size = self.collectionView.frame.size;
    contentFrame.origin = proposedContentOffset;
    
    NSArray *array = [self layoutAttributesForElementsInRect:contentFrame];
    
    //2. 计算在可视范围的距离中心线最近的Item
    CGFloat minCenterX = CGFLOAT_MAX;
    CGFloat collectionViewCenterX = proposedContentOffset.x + self.collectionView.frame.size.width * 0.5;
    for (UICollectionViewLayoutAttributes *attrs in array) {
        if(ABS(attrs.center.x - collectionViewCenterX) < ABS(minCenterX)){
            minCenterX = attrs.center.x - collectionViewCenterX;
        }
    }
    
    //3. 补回ContentOffset，则正好将Item居中显示
    return CGPointMake(proposedContentOffset.x + minCenterX, proposedContentOffset.y);
}

@end
