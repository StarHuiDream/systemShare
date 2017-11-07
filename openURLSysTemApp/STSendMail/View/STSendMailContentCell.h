//
//  STSendMailContentCell.h
//  openURLSysTemApp
//
//  Created by StarHui on 09/05/17.
//  Copyright © 2017年 StarHui. All rights reserved.
//

#import "STBaseCell.h"
@class STSendMailModel;

@protocol STSendMailContentCellDelegate <NSObject>

- (void) contentEndChangeWith:(NSString *) subject;

@end

@interface STSendMailContentCell : STBaseCell

+ (instancetype) instanceWithtableView:(UITableView *) tableView
                              delegate:(id<STSendMailContentCellDelegate>) delegate
                             mailModel:(STSendMailModel *)mailModel;

@end
