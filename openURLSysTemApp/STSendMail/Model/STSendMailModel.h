//
//  STSendMailModel.h
//  openURLSysTemApp
//
//  Created by StarHui on 09/05/17.
//  Copyright © 2017年 StarHui. All rights reserved.
//

#import "STBaseModel.h"

typedef NS_ENUM(NSInteger,STSendMailAddRessType) {
    /** 收件人  */
    STSendMailAddRessRecipientType = 1,
    /** 抄送 */
    STSendMailAddRessCcType,
    /** 密送 */
    STSendMailAddRessBCcType
};

@interface STSendMailAddRessModel : STBaseModel

/** 小标题 */
@property (copy, nonatomic) NSString *titeStr;
/** */
@property (copy, nonatomic) NSString *addButtonTitleStr;
/** */
@property (strong, nonatomic) NSMutableArray<NSString *> *mailAddressMutArr;
/**  */
@property (assign, nonatomic) STSendMailAddRessType addressType;

@end


@interface STSendMailModel : STBaseModel

/** 收件人、抄送、密送 */
@property (copy, nonatomic) NSArray<STSendMailAddRessModel *> *mailArr;
///** 收件人 */
//@property (strong, nonatomic) STSendMailAddRessModel *mailRecipient;
///** 抄送 */
//@property (strong, nonatomic) STSendMailAddRessModel *mailCc;
///** 密送送 */
//@property (strong, nonatomic) STSendMailAddRessModel *mailBcc;
/** 邮件主题 */
@property (copy, nonatomic) NSString *mailSubjectStr;
/** 邮件内容 */
@property (copy, nonatomic) NSString *mailContentStr;
/** 邮件附件 */
@property (copy, nonatomic) NSArray *mailAnnexArr;

+ (instancetype) instance;
@end


