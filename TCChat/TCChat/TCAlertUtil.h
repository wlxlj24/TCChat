//
//  TCAlertUtil.h
//  TCChat
//
//  Created by TailC on 16/6/16.
//  Copyright © 2016年 TailC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface TCAlertUtil : NSObject

/**
 *  显示“确认”提示框
 *
 *  @param viewController 要显示的VC
 *  @param title          标题
 *  @param message        消息
 */
+(void)showAlertWithViewController:(UIViewController *)viewController
							 title:(NSString *)title
						   message:(NSString *)message;


@end
