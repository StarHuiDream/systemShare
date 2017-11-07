//
//  STSendMailSubjectCell.m
//  openURLSysTemApp
//
//  Created by StarHui on 09/05/17.
//  Copyright © 2017年 StarHui. All rights reserved.
//

#import "STSendMailSubjectCell.h"
#import "STSendMailModel.h"

@interface STSendMailSubjectCell()

@property (weak, nonatomic) IBOutlet UITextField *subjectTextF;

@property (weak, nonatomic) id<STSendMailSubjectCellDelegate> delegate;

@property (strong, nonatomic) STSendMailModel *mailModel;

@end

@implementation STSendMailSubjectCell

+ (instancetype) instanceWithtableView:(UITableView *) tableView
                              delegate:(id<STSendMailSubjectCellDelegate>) delegate
                             mailModel:(STSendMailModel *)mailModel{

    STSendMailSubjectCell *cell = [STSendMailSubjectCell stbaseCellInstanceWithTableView:tableView];
    cell.delegate               = delegate;
    cell.mailModel              = mailModel;
    return cell;
}

- (IBAction)subjectEndChange:(UITextField *)sender {
    
    self.mailModel.mailSubjectStr = sender.text;
}

@end
