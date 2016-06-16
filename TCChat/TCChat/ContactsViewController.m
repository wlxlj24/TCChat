//
//  ContactsViewController.m
//  TCChat
//
//  Created by TailC on 16/5/31.
//  Copyright © 2016年 TailC. All rights reserved.
//

#import "ContactsViewController.h"
#import <EMSDK.h>

static NSString * const contactsCellId = @"contactsCellId";

@interface ContactsViewController ()<UITableViewDelegate,UITableViewDataSource,EMClientDelegate>

@property (nonatomic,readwrite,strong) NSArray *contactsArr;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ContactsViewController

-(void)dealloc{
	[[EMClient sharedClient] removeDelegate:self];
}

- (void)viewDidLoad {
    [super viewDidLoad];
	
	[[EMClient sharedClient] addDelegate:self delegateQueue:nil];
	
	self.contactsArr= [[EMClient sharedClient].contactManager getContactsFromDB];
	if (self.contactsArr.count == 0) {
		EMError *error = nil;
		self.contactsArr = [[EMClient sharedClient].contactManager getContactsFromServerWithError:&error];
		if (!error) {
			NSLog(@"获取成功 -- %@",self.contactsArr);
		}
	}
	
	[self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:contactsCellId];
	
}

#pragma mark <UITableViewDelegate,UITableViewDataSource>
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
	return self.contactsArr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
	
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:contactsCellId forIndexPath:indexPath];
	
	cell.textLabel.text = self.contactsArr[indexPath.row];
	
	return cell;
}

/** 自动登录回调  */
- (void)didAutoLoginWithError:(EMError *)aError{
	
	if (!aError) {
		NSLog(@"登陆成功");
		
		EMError *error = nil;
		self.contactsArr = [[EMClient sharedClient].contactManager getContactsFromServerWithError:&error];
		if (!error) {
			NSLog(@"获取好友列表成功");
		}
		[self.tableView reloadData];
		
		
	}else{
		NSLog(@"登陆失败 %@",aError);
	}
}


@end
