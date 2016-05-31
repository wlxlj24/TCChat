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
	
	[self cheakAutoLogin];
	
	[self valueForKey:@"fdsa"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)cheakAutoLogin{
	EMError *error = [[EMClient sharedClient] loginWithUsername:@"8001" password:@"111111"];
	if (!error)
	{
		[[EMClient sharedClient].options setIsAutoLogin:YES];
	}
}

- (IBAction)onClickLoginBtn:(id)sender {
	
	EMError *error = [[EMClient sharedClient] registerWithUsername:@"8001" password:@"111111"];
	if (error==nil) {
		NSLog(@"注册成功");
	}
	
}

- (IBAction)onClickRegisterBtn:(id)sender {
	
	BOOL isAutoLogin = [EMClient sharedClient].options.isAutoLogin;
	if (!isAutoLogin) {
		EMError *error = [[EMClient sharedClient] loginWithUsername:@"8001" password:@"111111"];
		if (error==nil) {
			NSLog(@"登陆成功");
		}
	}
	
}



@end
