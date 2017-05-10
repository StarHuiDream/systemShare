//
//  STSendMailSubjectCell.h
//  openURLSysTemApp
//
//  Created by StarHui on 09/05/17.
//  Copyright © 2017年 StarHui. All rights reserved.
//

#import "STBaseCell.h"

@protocol STSendMailSubjectCellDelegate <NSObject>

- (void) subjectEndChangeWith:(NSString *) subject;

@end

@interface STSendMailSubjectCell : STBaseCell

+ (instancetype) instanceWithtableView:(UITableView *) tableView
                              delegate:(id<STSendMailSubjectCellDelegate>) delegate;

@end
