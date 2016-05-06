//
//  Common.m
//  UICollectionViewDemo
//
//  Created by QianLei-Mac on 15/6/23.
//  Copyright (c) 2015年 channe-Mac. All rights reserved.
//

#import "Common.h"

@implementation Common


+ (UIImage *)createImageWithColor:(UIColor *)color Size:(CGSize)size{
    
    //获取UIColor的RGB值
    CGFloat red = 0.0, green = 0.0, blue = 0.0, alpha =0.0;
    [color getRed:&red green:&green blue:&blue alpha:&alpha];
    
    CGSize imageSize = size;
    UIGraphicsBeginImageContextWithOptions(imageSize, 0, [UIScreen mainScreen].scale);
    [[UIColor colorWithRed:red green:green blue:blue alpha:alpha] set];
    UIRectFill(CGRectMake(0, 0, imageSize.width, imageSize.height));
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

@end
