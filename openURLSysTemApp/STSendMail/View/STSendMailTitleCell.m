//
//  STSendMailTitleCell.m
//  openURLSysTemApp
//
//  Created by StarHui on 09/05/17.
//  Copyright © 2017年 StarHui. All rights reserved.
//

#import "STSendMailTitleCell.h"
#import "STSendMailModel.h"

@interface STSendMailTitleCell()

@property (weak, nonatomic) IBOutlet UIButton *iconAndTitleButton;

@property (weak, nonatomic) IBOutlet UIButton *operationButton;

@property (weak, nonatomic) id<STSendMailTitleCellDelegate> delegate;

@property (strong, nonatomic) STSendMailAddRessModel *addressModel;

@end

@implementation STSendMailTitleCell

+(instancetype)instanceWithTableView:(UITableView *)tableView
                            delegate:(id<STSendMailTitleCellDelegate>)delegate
                        addressModel:(STSendMailAddRessModel *)addressModel{

    STSendMailTitleCell *cell   = [STSendMailTitleCell stbaseCellInstanceWithTableView:tableView];
    cell.delegate               = delegate;
    cell.addressModel           = addressModel;
    return cell;
}

- (IBAction)operationButtonOnClick:(id)sender {
    
}

- (void) setAddressModel:(STSendMailAddRessModel *)addressModel{
    
    
    self.iconAndTitleButton.enabled = NO;
    _addressModel = addressModel;
    [self.iconAndTitleButton setTitle:addressModel.titeStr forState:UIControlStateDisabled];
    

}

//🐶

@end
