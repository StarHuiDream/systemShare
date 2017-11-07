//
//  STSendMailAddNewAddressCell.h
//  openURLSysTemApp
//
//  Created by StarHui on 09/05/17.
//  Copyright © 2017年 StarHui. All rights reserved.
//

#import "STBaseCell.h"
@class STSendMailAddRessModel;

@protocol STSendMailAddNewAddressCellDelegate  <NSObject>

- (void) emailAddressDeleted;

- (void) emailAddressEditEnd;

@end

@interface STSendMailAddNewAddressCell : STBaseCell

+ (instancetype) instanceWithTableView:(UITableView *)tableView
                              delegate:(id<STSendMailAddNewAddressCellDelegate>) delegate
                      mailAddrsssModel:(STSendMailAddRessModel *)mailAddrsssModel;

@end
