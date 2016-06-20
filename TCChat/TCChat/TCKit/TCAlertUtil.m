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

+(void)showAlertWithViewController:(UIViewController *)viewController
							 title:(NSString *)title
						   message:(NSString *)message
				   leftAcitonTitle:(NSString *)leftTitle
					   leftHandler:(alertActionBlock)leftActionBlock
				  rightActionTitle:(NSString *)rightTitle
					  rightHandler:(alertActionBlock)rightActionBlock{
	UIAlertController* alert = [UIAlertController alertControllerWithTitle:title
																   message:message
															preferredStyle:UIAlertControllerStyleAlert];
 
	UIAlertAction *leftAction = [UIAlertAction actionWithTitle:leftTitle style:UIAlertActionStyleDefault
														  handler:^(UIAlertAction * action) {
															  leftActionBlock();
														  }];
	UIAlertAction *rightAciton = [UIAlertAction actionWithTitle:rightTitle style:UIAlertActionStyleDefault
														  handler:^(UIAlertAction * action) {
															  rightActionBlock();
														  }];

 
	[alert addAction:leftAction];
	[alert addAction:rightAciton];
	[viewController presentViewController:alert animated:YES completion:nil];
}

@end
