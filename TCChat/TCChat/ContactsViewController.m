//
//  ContactsViewController.m
//  TCChat
//
//  Created by TailC on 16/5/31.
//  Copyright © 2016年 TailC. All rights reserved.
//

#import "ContactsViewController.h"
#import <EMSDK.h>
#import "TCAlertUtil.h"

static NSString * const contactsCellId = @"contactsCellId";

@interface ContactsViewController ()<UITableViewDelegate,UITableViewDataSource,EMClientDelegate,EMContactManagerDelegate>

@property (nonatomic,readwrite,strong) NSArray *contactsArr;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ContactsViewController

-(void)dealloc{
	[[EMClient sharedClient] removeDelegate:self];
	[[EMClient sharedClient].contactManager removeDelegate:self];
}

- (void)viewDidLoad {
    [super viewDidLoad];
	
	[[EMClient sharedClient] addDelegate:self delegateQueue:nil];
	[[EMClient sharedClient].contactManager addDelegate:self delegateQueue:nil];
	
	[self tableViewHeaderRefresh];
	
	[self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:contactsCellId];
	
}


-(void)tableViewHeaderRefresh{
	
	[[EMClient sharedClient].contactManager asyncGetContactsFromServer:^(NSArray *aList) {
		self.contactsArr = aList;
		NSLog(@"获取成功 -- %@",self.contactsArr);
		[self.tableView reloadData];
		
	} failure:^(EMError *aError) {
		NSLog(@"获取失败 -- %@",aError);
	}];
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

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
	
	NSString *userName = self.contactsArr[indexPath.row];
	
	if (editingStyle == UITableViewCellEditingStyleDelete) {
		[[EMClient sharedClient].contactManager asyncDeleteContact:userName
														   success:^{
															   NSLog(@"删除成功");
															   [self.tableView reloadData];
														   }
														   failure:^(EMError *aError) {
															   NSLog(@"删除失败");
														   }];
	}
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
