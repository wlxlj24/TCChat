//
//  LoginViewController.m
//  TCChat
//
//  Created by TailC on 16/5/31.
//  Copyright © 2016年 TailC. All rights reserved.
//

#import "LoginViewController.h"
#import <EMSDK.h>

@interface LoginViewController ()

@property (weak, nonatomic) IBOutlet UITextField *accountTF;
@property (weak, nonatomic) IBOutlet UITextField *passwordTF;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

/** 登陆  */
- (IBAction)onClickLoginBtn:(id)sender {
	
	BOOL isAutoLogin = [EMClient sharedClient].options.isAutoLogin;
	
	if (isAutoLogin) {
		return;
	}
	
	[[EMClient sharedClient] asyncLoginWithUsername:self.accountTF.text
										   password:self.passwordTF.text
											success:^{
												NSLog(@"登陆成功");
												[[EMClient sharedClient].options setIsAutoLogin:YES];
												
												[self dismissViewControllerAnimated:YES completion:nil];
												
											}
											failure:^(EMError *aError) {
												NSLog(@"登陆失败%@",aError.description);
											}];
	
	
}

/** 注册  */
- (IBAction)onClickRegisterBtn:(id)sender {
	
	BOOL isAutoLogin = [EMClient sharedClient].options.isAutoLogin;
	
	if (isAutoLogin) {
		return;
	}
	
	
	[[EMClient sharedClient] asyncRegisterWithUsername:self.accountTF.text
											  password:self.passwordTF.text
											   success:^{
												   NSLog(@"注册成功");
											   }
											   failure:^(EMError *aError) {
												   NSLog(@"注册失败 %@",aError.description);
											   }];
	
}



@end
