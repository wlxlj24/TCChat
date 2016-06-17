//
//  SettingTableViewController.m
//  TCChat
//
//  Created by TailC on 16/6/17.
//  Copyright © 2016年 TailC. All rights reserved.
//

#import "SettingTableViewController.h"
#import <EMSDK.h>

@interface SettingTableViewController ()

@property (weak, nonatomic) IBOutlet UIButton *logoutBtn;

@end

@implementation SettingTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	
	NSString *userName = [[EMClient sharedClient] currentUsername];
	NSString *title = [NSString stringWithFormat:@"退出登录（%@）",userName];
	
	[self.logoutBtn setTitle:title forState:UIControlStateNormal];
	
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)logoutAction:(id)sender {
	[[EMClient sharedClient] asyncLogout:YES
								 success:^{
									 NSLog(@"退出成功");
									 
									 UINavigationController *loginNav = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"loginNav"];
									 [self presentViewController:loginNav animated:YES completion:nil];
									 
								 } failure:^(EMError *aError) {
									 NSLog(@"退出失败");
								 }];
}


@end
