//
//  ConversionViewController.m
//  TCChat
//
//  Created by TailC on 16/5/31.
//  Copyright © 2016年 TailC. All rights reserved.
//

#import "ConversionViewController.h"
#import <EMSDK.h>
#import "TCAlertUtil.h"

@interface ConversionViewController ()<EMClientDelegate,EMContactManagerDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ConversionViewController

-(void)dealloc{
	[[EMClient sharedClient] removeDelegate:self];
	[[EMClient sharedClient].contactManager removeDelegate:self];
}

- (void)viewDidLoad {
    [super viewDidLoad];
	
	[[EMClient sharedClient].contactManager addDelegate:self delegateQueue:nil];
	[[EMClient sharedClient] addDelegate:self delegateQueue:nil];
	
	if (![EMClient sharedClient].options.isAutoLogin) {
		
		UINavigationController *loginNav = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"loginNav"];
		[self presentViewController:loginNav animated:YES completion:nil];
	}
	
}

#pragma mark <EMClientDelegate>
/** 自动登录回调  */
- (void)didAutoLoginWithError:(EMError *)aError{
	
	if (!aError) {
		NSLog(@"登陆成功");
	}else{
		NSLog(@"登陆失败 %@",aError);
	}
}

/** SDK连接服务器的状态变化时会接收到该回调  */
- (void)didConnectionStateChanged:(EMConnectionState)aConnectionState{
	if (aConnectionState == EMConnectionConnected) {
		NSLog(@"已连接");
		self.title = @"会话";
	}else{
		NSLog(@"未连接");
		self.title = @"未连接";
	}
}

/*!
 *  当前登录账号在其它设备登录时会接收到该回调
 */
- (void)didLoginFromOtherDevice{
	NSLog(@"当前登录账号在其它设备登录时会接收到该回调");
}

/*!
 *  当前登录账号已经被从服务器端删除时会收到该回调
 */
- (void)didRemovedFromServer{
	NSLog(@"当前登录账号已经被从服务器端删除时会收到该回调");
}

#pragma mark <EMContactManagerDelegate>
/*!
 *  用户B同意用户A的加好友请求后，用户A会收到这个回调
 */
- (void)didReceiveAgreedFromUsername:(NSString *)aUsername{
	
	NSString *message = [NSString stringWithFormat:@"%@ 接受了你的好友请求",aUsername];
	
	[TCAlertUtil showAlertWithViewController:self title:@"好友请求" message:message];
	
}

/*!
 *  用户B拒绝用户A的加好友请求后，用户A会收到这个回调
 */
- (void)didReceiveDeclinedFromUsername:(NSString *)aUsername{
	
	NSString *message = [NSString stringWithFormat:@"%@ 拒绝了你的好友请求",aUsername];
	
	[TCAlertUtil showAlertWithViewController:self title:@"好友请求" message:message];
	
}


@end
