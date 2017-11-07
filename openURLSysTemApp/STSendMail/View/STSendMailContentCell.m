//
//  STSendMailContentCell.m
//  openURLSysTemApp
//
//  Created by StarHui on 09/05/17.
//  Copyright © 2017年 StarHui. All rights reserved.
//

#import "STSendMailContentCell.h"
#import "STSendMailModel.h"

@interface  STSendMailContentCell()
<
UITextViewDelegate
>

@property (weak, nonatomic) IBOutlet UITextView *contentTextV;

@property (weak, nonatomic) id<STSendMailContentCellDelegate> delegate;

@property (strong, nonatomic) STSendMailModel *mailModel;

@end

@implementation STSendMailContentCell

+ (instancetype) instanceWithtableView:(UITableView *) tableView
                              delegate:(id<STSendMailContentCellDelegate>) delegate
                             mailModel:(STSendMailModel *)mailModel {

    STSendMailContentCell *cell = [STSendMailContentCell stbaseCellInstanceWithTableView:tableView];
    cell.delegate               = delegate;
    cell.contentTextV.delegate  = cell;
    cell.mailModel              = mailModel;
    return cell;
}

-(instancetype) initWithCoder:(NSCoder *)aDecoder{

    self = [super initWithCoder:aDecoder];
    if (self) {
        
        self.contentTextV.delegate = self;
  
    }
    return self;
}

#pragma -mark UITextViewDelegate
- (void)textViewDidEndEditing:(UITextView *)textView{
    
    self.mailModel.mailContentStr = textView.text;

}


@end
