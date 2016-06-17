//
//  TCAlertUtil.h
//  TCChat
//
//  Created by TailC on 16/6/16.
//  Copyright © 2016年 TailC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void(^alertActionBlock)(void);

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

/**
 *  显示“2个按钮”提示框
 *
 *  @param viewController   要显示的VC
 *  @param title            标题
 *  @param message          信息
 *  @param leftTitle        左按钮标题
 *  @param leftActionBlock  左按钮回调
 *  @param rightTitle       右按钮标题
 *  @param rightActionBlock 右按钮回调
 */
+(void)showAlertWithViewController:(UIViewController *)viewController
							 title:(NSString *)title
						   message:(NSString *)message
				   leftAcitonTitle:(NSString *)leftTitle
					   leftHandler:(alertActionBlock)leftActionBlock
				  rightActionTitle:(NSString *)rightTitle
					  rightHandler:(alertActionBlock)rightActionBlock;


@end
