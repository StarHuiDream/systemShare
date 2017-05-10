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
            [mailMutArr addObject:@""];
            [mailMutArr addObject:@""];
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
    self.mailAddressMutArr                   = mailMutArr;
}

@end

@implementation STSendMailModel

+ (instancetype) instance{
    
    STSendMailModel        *mailModel        = [[STSendMailModel alloc] init];
    STSendMailAddRessModel *mailAddressModel = [[STSendMailAddRessModel alloc] init];
    
    mailAddressModel.addressType             = STSendMailAddRessRecipientType;
    mailModel.mailRecipient                  = [mailAddressModel deepCopyAllPropertyValue];
    
    mailAddressModel.addressType             = STSendMailAddRessCcType;
    mailModel.mailCc                         = [mailAddressModel deepCopyAllPropertyValue];
    
    mailAddressModel.addressType             = STSendMailAddRessBCcType;
    mailModel.mailBcc                        = [mailAddressModel deepCopyAllPropertyValue];
    
    return mailModel;
}

@end

