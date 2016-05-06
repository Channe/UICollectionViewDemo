//
//  TabBarViewController.m
//  UICollectionViewDemo
//
//  Created by QianLei-Mac on 15/6/23.
//  Copyright (c) 2015年 channe-Mac. All rights reserved.
//

#import "TabBarViewController.h"
#import "ViewController.h"
#import "ViewController2.h"

@interface TabBarViewController ()

@property (nonatomic, strong) ViewController *viewController;
@property (nonatomic, strong) ViewController2 *viewController2;

@end

@implementation TabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //页面1
    self.viewController.tabBarItem.title = @"FlowLayout";
    self.viewController.title = @"Flow";
    self.viewController.tabBarItem.tag = 1;
    
    //页面2
    self.viewController2.tabBarItem.title = @"CircleStackLayout";
    self.viewController2.title = @"Layout";
    self.viewController2.tabBarItem.tag = 2;
    
    self.viewControllers = @[self.viewController,self.viewController2];
    self.selectedIndex = 0;
}

- (ViewController *)viewController{
    if (!_viewController) {
        _viewController = [[ViewController alloc] initWithNibName:@"ViewController" bundle:[NSBundle mainBundle]];
    }
    return _viewController;
}

- (ViewController2 *)viewController2{
    if (!_viewController2) {
        _viewController2 = [[ViewController2 alloc] initWithNibName:@"ViewController2" bundle:[NSBundle mainBundle]];
    }
    return _viewController2;
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
