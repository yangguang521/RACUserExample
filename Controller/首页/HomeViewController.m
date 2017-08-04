//
//  HomeViewController.m
//  ReactiveCocoaUtils
//
//  Created by PC on 17/7/24.
//  Copyright © 2017年 LongPei. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()
@property (weak, nonatomic) IBOutlet UITextField *phoneField;//手机号
@property (weak, nonatomic) IBOutlet UITextField *passwordField;//密码
@property (weak, nonatomic) IBOutlet UIButton *logButton;//登录按钮

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"CombineSignal";
    //只有手机号和密码 输入框长度都大于0 才能点击登录button
    @weakify(self)
    RACSignal *logEnableSignal = [[RACSignal combineLatest:@[self.phoneField.rac_textSignal,self.passwordField.rac_textSignal] reduce:^id(NSString *phone,NSString *password){
        NSLog(@"111");
        return @(phone.length>0&&password.length>0);
    }] takeUntil:self.rac_willDeallocSignal];
    RAC(self.logButton, enabled) = logEnableSignal;
    [logEnableSignal subscribeNext:^(NSNumber *x) {
        @strongify(self)
        self.logButton.backgroundColor = [x integerValue] == 1 ? UIColorWithCode(0xfd5e5e):UIColorWithCode(0xcccccc);
    }];
    [[[self.logButton rac_signalForControlEvents:UIControlEventTouchUpInside] takeUntil:self.rac_willDeallocSignal] subscribeNext:^(id x) {
        NSLog(@"点击了登录按钮");
    }];
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
