//
//  CollectionViewCell.m
//  UICollectionViewDemo
//
//  Created by QianLei-Mac on 15/6/11.
//  Copyright (c) 2015年 channe-Mac. All rights reserved.
//

#import "CollectionViewCell.h"

@implementation CollectionViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (instancetype)initWithFrame:(CGRect)frame {
    if(self = [super initWithFrame:frame]){
        self = [[[NSBundle mainBundle] loadNibNamed:@"CollectionViewCell" owner:nil options:nil] lastObject];
    }
    return self;
}

@end
