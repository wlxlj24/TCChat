//
//  AddFriendViewController.m
//  TCChat
//
//  Created by TailC on 16/6/16.
//  Copyright © 2016年 TailC. All rights reserved.
//

#import "AddFriendViewController.h"
#import <EMSDK.h>


@interface AddFriendViewController ()

@property (weak, nonatomic) IBOutlet UITextField *searchTF;

@end

@implementation AddFriendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)addFriendAction:(id)sender {
	if (self.searchTF.text.length == 0) {
		return;
	}
	EMError *error = [[EMClient sharedClient].contactManager addContact:self.searchTF.text message:@"我想加您为好友"];
	if (!error) {
		NSLog(@"添加成功");
	}
}



@end
