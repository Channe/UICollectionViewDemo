//
//  Common.h
//  UICollectionViewDemo
//
//  Created by QianLei-Mac on 15/6/23.
//  Copyright (c) 2015年 channe-Mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Common : NSObject

//生成指定颜色指定大小的图片
+ (UIImage *)createImageWithColor:(UIColor *)color Size:(CGSize)size;

@end
