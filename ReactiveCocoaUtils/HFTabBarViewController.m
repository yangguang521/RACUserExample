//
//  HFTabBarViewController.m
//  ReactiveCocoaUtils
//
//  Created by PC on 17/7/24.
//  Copyright © 2017年 LongPei. All rights reserved.
//

#import "HFTabBarViewController.h"
#import "HomeViewController.h"
#import "IntegralViewController.h"
#import "AccountViewController.h"
#import "MyProfileViewController.h"
@interface HFTabBarViewController ()

@end

@implementation HFTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self addTabBarController];
}

-(void)addTabBarController {
    
    //首页
    HomeViewController *indexVC = [[HomeViewController alloc]init];
    UINavigationController *tabNavIndex = [[UINavigationController alloc] initWithRootViewController:indexVC];
    
    //积分
    IntegralViewController *integralVC = [[IntegralViewController alloc]init];
    UINavigationController *tabNavIntegral = [[UINavigationController alloc]initWithRootViewController:integralVC];
    
    //账户
    AccountViewController *accountWithController = [[AccountViewController alloc] init];
    UINavigationController *tabNavdispatch = [[UINavigationController alloc]initWithRootViewController:accountWithController];
    
    //我的
    MyProfileViewController *myProfileController = [[MyProfileViewController alloc] init];
    UINavigationController *tabMav = [[UINavigationController alloc] initWithRootViewController:myProfileController];
    
    
    
    [self addChildViewController:tabNavIndex title:@"首页" imageNormal:[UIImage imageNamed:@"tab_homeunselect"] selectedImage:[UIImage imageNamed:@"tab_homeselect"]];
    [self addChildViewController:tabNavIntegral title:@"商城" imageNormal:[UIImage imageNamed:@"tab_integralunselect"] selectedImage:[UIImage imageNamed:@"tab_integralselect"]];
    [self addChildViewController:tabNavdispatch title:@"账户" imageNormal:[UIImage imageNamed:@"tab_accountunselect"] selectedImage:[UIImage imageNamed:@"tab_accountselect"]];
    [self addChildViewController:tabMav title:@"我" imageNormal:[UIImage imageNamed:@"tab_wounselect"] selectedImage:[UIImage imageNamed:@"tab_woselect"]];
}

-(void)addChildViewController:(UIViewController *)childVc title:(NSString *)title imageNormal:(UIImage *)image selectedImage:(UIImage *)selectedImage{
    [childVc.tabBarItem setImage:[image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [childVc.tabBarItem setSelectedImage:[selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    childVc.tabBarItem.title = title;
    
    //设置tabBarItem选中状态下文字的颜色
    NSMutableDictionary *selectedtextAttrs = [NSMutableDictionary dictionary];
    selectedtextAttrs[NSForegroundColorAttributeName] = [UIColor colorWithRed:14.f/255.f green:191.f/255.f blue:181.f/255.f alpha:1.f];
    [childVc.tabBarItem setTitleTextAttributes:selectedtextAttrs forState:UIControlStateSelected];
    [self addChildViewController:childVc];
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
