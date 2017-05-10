//
//  STSendMailSubjectCell.m
//  openURLSysTemApp
//
//  Created by StarHui on 09/05/17.
//  Copyright © 2017年 StarHui. All rights reserved.
//

#import "STSendMailSubjectCell.h"

@interface STSendMailSubjectCell()

@property (weak, nonatomic) IBOutlet UITextField *subjectTextF;

@property (weak, nonatomic) id<STSendMailSubjectCellDelegate> delegate;

@end

@implementation STSendMailSubjectCell

+ (instancetype) instanceWithtableView:(UITableView *) tableView
                              delegate:(id<STSendMailSubjectCellDelegate>) delegate{

    STSendMailSubjectCell *cell = [STSendMailSubjectCell stbaseCellInstanceWithTableView:tableView];
    cell.delegate               = delegate;
    return cell;
}

- (IBAction)subjectEndChange:(id)sender {
    
}

@end
