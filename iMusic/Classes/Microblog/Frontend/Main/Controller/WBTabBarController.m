//
//  WBTabBarController.m
//  iMusic
//
//  Created by Mark Lewis on 19-3-5.
//  Copyright (c) 2019年 Tsinghua University. All rights reserved.
//

#import "WBTabBarController.h"
#import "WBMainNavgationController.h"

#import "ZZHomeViewController.h"
#import "ZZMessageViewController.h"
#import "ZZDiscoverViewController.h"
#import "ZZProfileViewController.h"
@interface WBTabBarController ()

@end

@implementation WBTabBarController


/**
 *  添加一个子控制器
 *
 *  @param childVc           子控制器对象
 *  @param title             标题
 *  @param imageName         图标
 *  @param selectedImageName 选中的图标
 */
- (void)addOneChildViewController:(UIViewController *)childViewController title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName
{
    childViewController.view.backgroundColor = ZZRandomColor;
    // 设置标题
    childViewController.tabBarItem.title = title;
    // 设置图标
    childViewController.tabBarItem.image = [UIImage imageWithName:imageName];
    // 设置选中的图标
    UIImage *selectedImage = [UIImage imageWithName:selectedImageName];
    if (iOS7)
    {
        // 声明这张图片用原图(别渲染)
        selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
    childViewController.tabBarItem.selectedImage = selectedImage;
    
    
    // 添加导航控制器
    WBMainNavgationController *navVC = [[WBMainNavgationController alloc] initWithRootViewController:childViewController];
    // 添加为tabbar控制器的子控制器
    [self addChildViewController:navVC];
}

// 在iOS7中, 会对selectedImage的图片进行再次渲染为蓝色// 要想显示原图, 就必须得告诉它: 不要渲染
// /Users/用户名/Library/Application Support/Developer/Shared/Xcode/Plug-ins

#pragma mark - ViewController Lifecycle
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        // Custom initialization
        self.view.backgroundColor = [UIColor grayColor];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 添加4个子控制器
    ZZHomeViewController *home = [[ZZHomeViewController alloc] init];
    [self addOneChildViewController:home title:@"首页" imageName:@"tabbar_home" selectedImageName:@"tabbar_home_selected"];
    
    ZZMessageViewController *message = [[ZZMessageViewController alloc] init];
    [self addOneChildViewController:message title:@"消息" imageName:@"tabbar_message_center" selectedImageName:@"tabbar_message_center_selected"];
    
    ZZDiscoverViewController *discover = [[ZZDiscoverViewController alloc] init];
    [self addOneChildViewController:discover title:@"发现" imageName:@"tabbar_discover" selectedImageName:@"tabbar_discover_selected"];
    
    ZZProfileViewController *profile = [[ZZProfileViewController alloc] init];
    [self addOneChildViewController:profile title:@"我" imageName:@"tabbar_profile" selectedImageName:@"tabbar_profile_selected"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
