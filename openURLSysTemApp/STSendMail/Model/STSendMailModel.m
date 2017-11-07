//
//  STSendMailModel.m
//  openURLSysTemApp
//
//  Created by StarHui on 09/05/17.
//  Copyright © 2017年 StarHui. All rights reserved.
//

#import "STSendMailModel.h"

@implementation STSendMailAddRessModel

- (void) setAddressType:(STSendMailAddRessType)addressType{

    _addressType = addressType;
    NSMutableArray         *mailMutArr       = [NSMutableArray array];
   

    
    switch (addressType) {
        case STSendMailAddRessRecipientType:
            self.titeStr = @"📮 收件人";
//            [mailMutArr addObject:@""];
            break;
        case STSendMailAddRessCcType:
            
            self.titeStr = @"📧 抄送人";
            break;
        case STSendMailAddRessBCcType:
             self.titeStr = @"㊙️ 密送人";
            break;
            
        default:
            break;
    }
    [mailMutArr addObject:@""];
    self.mailAddressMutArr                   = mailMutArr;
}

@end

@implementation STSendMailModel

+ (instancetype) instance{
    
    STSendMailModel        *mailModel        = [[STSendMailModel alloc] init];
    STSendMailAddRessModel *mailAddressModel = [[STSendMailAddRessModel alloc] init];
    NSMutableArray         *tmepMutArr       = [NSMutableArray array];
    
    mailAddressModel.addressType             = STSendMailAddRessRecipientType;
    [tmepMutArr addObject:[mailAddressModel deepCopyAllPropertyValue]];
//    mailModel.mailRecipient                  = [mailAddressModel deepCopyAllPropertyValue];
    
    mailAddressModel.addressType             = STSendMailAddRessCcType;
//    mailModel.mailCc                         = [mailAddressModel deepCopyAllPropertyValue];
     [tmepMutArr addObject:[mailAddressModel deepCopyAllPropertyValue]];
    
    mailAddressModel.addressType             = STSendMailAddRessBCcType;
//    mailModel.mailBcc                        = [mailAddressModel deepCopyAllPropertyValue];
     [tmepMutArr addObject:[mailAddressModel deepCopyAllPropertyValue]];
    
    
    mailModel.mailArr = [tmepMutArr copy];
    
    return mailModel;
}

@end

