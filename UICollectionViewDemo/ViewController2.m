//
//  ViewController2.m
//  UICollectionViewDemo
//
//  Created by QianLei-Mac on 15/6/23.
//  Copyright (c) 2015年 channe-Mac. All rights reserved.
//

#import "ViewController2.h"
#import "CollectionViewCell.h"
#import "Common.h"
#import "CircleLayout.h"
#import "StackLayout.h"

@interface ViewController2 ()<UICollectionViewDataSource,UISearchControllerDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@property (nonatomic,strong) NSMutableArray *images;

@end

@implementation ViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.collectionView.backgroundColor = [UIColor whiteColor];
    // 注册CollectionViewCell
    [self.collectionView registerClass:[CollectionViewCell class] forCellWithReuseIdentifier:@"Collection"];
}

-(NSMutableArray *)images {
    if (!_images) {
        _images = [NSMutableArray arrayWithArray:@[[UIColor redColor],
                                                   [UIColor blueColor],
                                                   [UIColor blackColor],
                                                   [UIColor brownColor],
                                                   [UIColor yellowColor],
                                                   [UIColor grayColor],
                                                   [UIColor greenColor],
                                                   [UIColor purpleColor],
                                                   [UIColor magentaColor],
                                                   [UIColor lightGrayColor],
                                                   [UIColor darkGrayColor],
                                                   [UIColor orangeColor],
                                                   [UIColor cyanColor]]];
    }
    return _images;
}

#pragma mark - UICollectionView DataSource
// 每个section的item个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.images.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    // UICollectionViewCell内部已经实现了循环使用，所以不用判断为空，自己创建
    CollectionViewCell *cell = (CollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"Collection" forIndexPath:indexPath];
    
    UIImage *image = [Common createImageWithColor:self.images[indexPath.item]
                                           Size:CGSizeMake(cell.imageView.frame.size.width,
                                                           cell.imageView.frame.size.height)];
    
    //加载图片
    cell.imageView.image = image;
    
    //设置label文字
    cell.label.text = [NSString stringWithFormat:@"%ld",(long)indexPath.row];
    
    return cell;
}

//点击item触发
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    //    // 1. 删除模型数据
    //    [self.images removeObjectAtIndex:indexPath.item];
    //
    //    // 2. 删除UI元素
    //    [collectionView deleteItemsAtIndexPaths:@[indexPath]];
}

#pragma mark - 点击屏幕空白处，切换布局模式
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    if ([self.collectionView.collectionViewLayout isKindOfClass:[StackLayout class]]) {
        [self.collectionView setCollectionViewLayout:[[CircleLayout alloc] init] animated:YES];
    } else {
        [self.collectionView setCollectionViewLayout:[[StackLayout alloc] init] animated:YES];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
