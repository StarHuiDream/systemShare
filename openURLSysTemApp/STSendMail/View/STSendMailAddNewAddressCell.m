//
//  STSendMailAddNewAddressCell.m
//  openURLSysTemApp
//
//  Created by StarHui on 09/05/17.
//  Copyright © 2017年 StarHui. All rights reserved.
//

#import "STSendMailAddNewAddressCell.h"
#import "STSendMailModel.h"

@interface STSendMailAddNewAddressCell()

@property (weak, nonatomic) IBOutlet UITextField *emailAddressTextF;

@property (weak, nonatomic) id<STSendMailAddNewAddressCellDelegate> delegate;

@property (strong, nonatomic) STSendMailAddRessModel *mailAddrsssModel;

@end

@implementation STSendMailAddNewAddressCell

+ (instancetype) instanceWithTableView:(UITableView *)tableView
                              delegate:(id<STSendMailAddNewAddressCellDelegate>) delegate
                      mailAddrsssModel:(STSendMailAddRessModel *)mailAddrsssModel{

    STSendMailAddNewAddressCell *cell = [STSendMailAddNewAddressCell stbaseCellInstanceWithTableView:tableView];
    cell.delegate                     = delegate;
    cell.mailAddrsssModel             = mailAddrsssModel;
    return cell;
}


- (IBAction)emailAddressEndChange:(UITextField *)sender {
    
    NSString *mailAddrss = sender.text;
    [self.mailAddrsssModel.mailAddressMutArr replaceObjectAtIndex:0 withObject:mailAddrss];

}
- (IBAction)deleteButtonOnClick:(id)sender {
}

@end
