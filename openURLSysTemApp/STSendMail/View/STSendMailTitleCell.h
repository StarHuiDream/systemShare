//
//  STSendMailTitleCell.h
//  openURLSysTemApp
//
//  Created by StarHui on 09/05/17.
//  Copyright © 2017年 StarHui. All rights reserved.
//

#import "STBaseCell.h"
@class STSendMailAddRessModel;

@protocol STSendMailTitleCellDelegate <NSObject>

- (void) addNewEmailAddress;
@end

@interface STSendMailTitleCell : STBaseCell

+(instancetype)instanceWithTableView:(UITableView *)tableView
                            delegate:(id<STSendMailTitleCellDelegate>)delegate
                        addressModel:(STSendMailAddRessModel *)addressModel;

@end
