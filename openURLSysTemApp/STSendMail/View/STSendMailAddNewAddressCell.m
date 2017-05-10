//
//  STSendMailAddNewAddressCell.m
//  openURLSysTemApp
//
//  Created by StarHui on 09/05/17.
//  Copyright © 2017年 StarHui. All rights reserved.
//

#import "STSendMailAddNewAddressCell.h"

@interface STSendMailAddNewAddressCell()

@property (weak, nonatomic) IBOutlet UITextField *emailAddressTextF;

@property (weak, nonatomic) id<STSendMailAddNewAddressCellDelegate> delegate;

@end

@implementation STSendMailAddNewAddressCell

+ (instancetype) instanceWithTableView:(UITableView *)tableView
                              delegate:(id<STSendMailAddNewAddressCellDelegate>) delegate{

    STSendMailAddNewAddressCell *cell = [STSendMailAddNewAddressCell stbaseCellInstanceWithTableView:tableView];
    cell.delegate                     = delegate;
    return cell;
}


- (IBAction)emailAddressEndChange:(id)sender {

}
- (IBAction)deleteButtonOnClick:(id)sender {
}

@end
