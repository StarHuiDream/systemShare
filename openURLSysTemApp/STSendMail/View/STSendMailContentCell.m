//
//  STSendMailContentCell.m
//  openURLSysTemApp
//
//  Created by StarHui on 09/05/17.
//  Copyright © 2017年 StarHui. All rights reserved.
//

#import "STSendMailContentCell.h"

@interface  STSendMailContentCell()
<
UITextViewDelegate
>

@property (weak, nonatomic) IBOutlet UITextView *contentTextV;

@property (weak, nonatomic) id<STSendMailContentCellDelegate> delegate;

@end

@implementation STSendMailContentCell

+ (instancetype) instanceWithtableView:(UITableView *) tableView
                              delegate:(id<STSendMailContentCellDelegate>) delegate{

    STSendMailContentCell *cell = [STSendMailContentCell stbaseCellInstanceWithTableView:tableView];
    cell.delegate               = delegate;
    cell.contentTextV.delegate  = cell;
    return cell;
}

-(instancetype) initWithCoder:(NSCoder *)aDecoder{

    self = [super initWithCoder:aDecoder];
    if (self) {
        
        self.contentTextV.delegate = self;
  
    }
    return self;
}

- (void) layoutSubviews{

    [super layoutSubviews];
    
//    self.contentTextV.layer.borderColor = [UIColor grayColor].CGColor;
//    self.contentTextV.layer.borderWidth = 1.0f;
//    self.contentTextV.layer.cornerRadius = 5.0f;
    
}



@end
