//
//  TCAlertUtil.m
//  TCChat
//
//  Created by TailC on 16/6/16.
//  Copyright © 2016年 TailC. All rights reserved.
//

#import "TCAlertUtil.h"

@implementation TCAlertUtil

+(void)showAlertWithViewController:(UIViewController *)viewController title:(NSString *)title message:(NSString *)message{
	
	UIAlertController* alert = [UIAlertController alertControllerWithTitle:title
																   message:message
															preferredStyle:UIAlertControllerStyleAlert];
 
	UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault
														  handler:^(UIAlertAction * action) {
															  
														  }];
 
	[alert addAction:defaultAction];
	[viewController presentViewController:alert animated:YES completion:nil];
	
}

@end
