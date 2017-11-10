//
//  SocialShareViewController.m
//  openURLSysTemApp
//
//  Created by StarHui on 2017/11/7.
//  Copyright © 2017年 StarHui. All rights reserved.
//

#import "SocialShareViewController.h"

typedef enum : NSUInteger {
    ShareTypeTencentQQShare = 0,//  腾讯QQ
    ShareTypeTencentWeChat
} ShareType;

@interface ShareTypeModel:NSObject
@property (nonatomic, copy) NSString *title;
@property (nonatomic, assign) ShareType shareType;
@end

@implementation ShareTypeModel:NSObject
@end

static NSString *cellIdentifer = @"cellIdentiferKey";
@interface SocialShareViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, copy) NSArray *titlesArr;
@end

@implementation SocialShareViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITableView *tableView = [[UITableView alloc] init];
    tableView.frame = self.view.frame;
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.backgroundColor =  [UIColor yellowColor];
    [self.view addSubview:tableView];
    self.tableView = tableView;
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.titlesArr.count;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifer];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifer];
    }
    ShareTypeModel *model = self.titlesArr[indexPath.row];
    cell.textLabel.text = model.title;
    return cell;
}


#pragma mark - setter getter
-(NSArray *)titlesArr{
    
    if (!_titlesArr) {
        ShareTypeModel *model = [[ShareTypeModel alloc] init];
        model.shareType = ShareTypeTencentQQShare;
        model.title     = @"腾讯QQ分享";
        NSArray *titlesArr = @[model];
        _titlesArr = titlesArr;
    }
   
    return _titlesArr;
}

@end
