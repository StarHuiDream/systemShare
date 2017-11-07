//
//  STSendMailViewController.m
//  openURLSysTemApp
//
//  Created by StarHui on 09/05/17.
//  Copyright © 2017年 StarHui. All rights reserved.
//

#import "STSendMailViewController.h"
#import "STSendMailTitleCell.h"
#import "STSendMailAddNewAddressCell.h"
#import "STSendMailSubjectCell.h"
#import "STSendMailContentCell.h"

#import "STSendMailModel.h"

#import <MessageUI/MessageUI.h>


@interface STSendMailViewController ()
<
UITableViewDelegate,
UITableViewDataSource,
//UITableViewDataSourcePrefetching,
STSendMailTitleCellDelegate,
STSendMailAddNewAddressCellDelegate,
STSendMailSubjectCellDelegate,
STSendMailContentCellDelegate,
MFMailComposeViewControllerDelegate
>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) STSendMailModel *mailModel;

@end

@implementation STSendMailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self.tableView setEditing:YES animated:YES];

}

- (IBAction)viewBeTap:(id)sender {
    
    [self.view endEditing:YES];
    [self.tableView endEditing:YES];
//    [self.tableView setEditing:!self.tableView.editing animated:YES];
}


- (IBAction)sendMailOnClick:(id)sender {
    
    //判断当前是否能够发送邮件
    if ([MFMailComposeViewController canSendMail]) {
        MFMailComposeViewController *mailController=[[MFMailComposeViewController alloc]init];
        //设置代理，注意这里不是delegate，而是mailComposeDelegate
        mailController.mailComposeDelegate = self;
        //设置收件人
        STSendMailAddRessModel *mailRecipientsAddressModel = self.mailModel.mailArr.firstObject;
        [mailController setToRecipients:[mailRecipientsAddressModel.mailAddressMutArr copy]];
        //设置抄送人
        STSendMailAddRessModel *mailCcAddressModel = self.mailModel.mailArr[1];
        if (mailCcAddressModel.mailAddressMutArr.count) {
            [mailController setCcRecipients:[mailCcAddressModel.mailAddressMutArr copy ]];
        }
        //设置密送人
         STSendMailAddRessModel *mailBCcAddressModel = self.mailModel.mailArr.lastObject;
        if (mailBCcAddressModel.mailAddressMutArr.count) {
            [mailController setBccRecipients:[mailBCcAddressModel.mailAddressMutArr copy]];
        }
        //设置主题
        [mailController setSubject:self.mailModel.mailSubjectStr];
        //设置内容
        [mailController setMessageBody:self.mailModel.mailContentStr isHTML:YES];
//        //添加附件
//        if (self.attachments.text.length>0) {
//            NSArray *attachments=[self.attachments.text componentsSeparatedByString:@","] ;
//            [attachments enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
//                NSString *file=[[NSBundle mainBundle] pathForResource:obj ofType:nil];
//                NSData *data=[NSData dataWithContentsOfFile:file];
//                [mailController addAttachmentData:data mimeType:@"image/jpeg" fileName:obj];//第二个参数是mimeType类型，jpg图片对应image/jpeg
//            }];
//        }
        [self presentViewController:mailController animated:YES completion:nil];
        
    }
    
}

#pragma  -mark MFMailComposeViewControllerDelegate
-(void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error{
    switch (result) {
        case MFMailComposeResultSent:
            NSLog(@"发送成功.");
            break;
        case MFMailComposeResultSaved://如果存储为草稿（点取消会提示是否存储为草稿，存储后可以到系统邮件应用的对应草稿箱找到）
            NSLog(@"邮件已保存.");
            break;
        case MFMailComposeResultCancelled:
            NSLog(@"取消发送.");
            break;
            
        default:
            NSLog(@"发送失败.");
            break;
    }
    if (error) {
        NSLog(@"发送邮件过程中发生错误，错误信息：%@",error.localizedDescription);
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}


#pragma -mark UITableViewDataSource

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{

    return 5;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (section == 0
        || section == 1
        || section == 2) {
        
         STSendMailAddRessModel        *mailAddressModel        = self.mailModel.mailArr[section];
        
        return mailAddressModel.mailAddressMutArr.count;
    }
    
//    else if (section == 1){
//    
//        return self.mailModel.mailCc.mailAddressMutArr.count;
//    }else if (section == 2){
//    
//        return self.mailModel.mailBcc.mailAddressMutArr.count;
//    }
//    

    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
//    if (indexPath.section == 0 && indexPath.row == 0) {
//        
//        STSendMailTitleCell *recipientTitleCell = [STSendMailTitleCell instanceWithTableView:tableView delegate:self
//                                                                                addressModel:self.mailModel.mailRecipient] ;
//        return recipientTitleCell;
//    } else if (indexPath.section == 1 && indexPath.row == 0){
//        
//        STSendMailTitleCell *mailCcTitleCell = [STSendMailTitleCell instanceWithTableView:tableView delegate:self
//                                                                             addressModel:self.mailModel.mailCc] ;
//        return mailCcTitleCell;
//    }else if (indexPath.section == 2 && indexPath.row == 0){
//        
//        STSendMailTitleCell *mailBCcTitleCell = [STSendMailTitleCell instanceWithTableView:tableView delegate:self
//                                                                              addressModel:self.mailModel.mailBcc] ;
//        
//        return mailBCcTitleCell;
//    }
    if (indexPath.section == 3) {
        
        STSendMailSubjectCell *mailSubjectCell = [STSendMailSubjectCell instanceWithtableView:tableView delegate:self
                                                  mailModel:self.mailModel];
        return mailSubjectCell;
    }else if (indexPath.section == 4){
    
        STSendMailContentCell *contentCell = [STSendMailContentCell instanceWithtableView:tableView delegate:self
                                              mailModel:self.mailModel];
        return contentCell;
    }
    
    STSendMailAddRessModel *mailAddrssModel = self.mailModel.mailArr[indexPath.section];
    
    
    STSendMailAddNewAddressCell *addEmailAddressCell = [STSendMailAddNewAddressCell instanceWithTableView:tableView delegate:self mailAddrsssModel:mailAddrssModel];
    return addEmailAddressCell;
}



#pragma  -mark UITableViewDelegate

- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{

    if (section    == 0
        || section == 1
        || section == 2) {
   
        return 45.0f;
    }
    return 0.01f;
}
- (UIView *) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{

   
    
    if (section    == 0
        || section == 1
        || section == 2) {
        
         STSendMailAddRessModel        *mailAddressModel        = self.mailModel.mailArr[section];
    
    
        
        
        STSendMailTitleCell *mailAddressTitleCell = [STSendMailTitleCell instanceWithTableView:tableView delegate:self
                                                                                      addressModel:mailAddressModel] ;
        
        
        return mailAddressTitleCell;
    }
    
    return [[UIView alloc] init];
}

//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//
////     [self.tableView setEditing:YES animated:YES];
//}

//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
//    
//    
//    if (section == 0) {
//        
//        STSendMailTitleCell *recipientTitleCell = [STSendMailTitleCell instanceWithTableView:tableView delegate:self
//                                                                           addressModel:self.mailModel.mailRecipient] ;
//        return recipientTitleCell;
//    }else if (section == 1){
//        
//        STSendMailTitleCell *mailCcTitleCell = [STSendMailTitleCell instanceWithTableView:tableView delegate:self
//                                                                                addressModel:self.mailModel.mailCc] ;
//        return mailCcTitleCell;
//        
//        
//    }else if (section == 2){
//        
//        STSendMailTitleCell *mailBCcTitleCell = [STSendMailTitleCell instanceWithTableView:tableView delegate:self
//                                                                             addressModel:self.mailModel.mailBcc] ;
//        
//        return mailBCcTitleCell;
//    }
//
//   
//    return [[UIView alloc] init];
//}

//-(void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *) fromIndexPath
//     toIndexPath:(NSIndexPath *)toIndexPath{
//    
//     NSString *tempStr = @"";
//    STSendMailAddRessModel        *mailAddressModel        = self.mailModel.mailArr[section];
//    
//    
//    if (fromIndexPath.section    == 0) {
//        
//         tempStr = self.mailModel.mailRecipient.mailAddressMutArr[fromIndexPath.row ];
//    }else if (fromIndexPath.section == 1){
//        
//        tempStr = self.mailModel.mailCc.mailAddressMutArr[fromIndexPath.row - 1];
//    }else if (fromIndexPath.section == 2){
//        
//         tempStr = self.mailModel.mailBcc.mailAddressMutArr[fromIndexPath.row - 1];
//    }
//    
//    
//    if (toIndexPath.section    == 0) {
//        
//        [self.mailModel.mailRecipient.mailAddressMutArr removeObjectAtIndex:fromIndexPath.row - 1];
//        [self.mailModel.mailRecipient.mailAddressMutArr insertObject:tempStr atIndex:toIndexPath.row - 1];
//
//
//    }else if (toIndexPath.section == 1){
//    
//    }else if (toIndexPath.section == 2){
//    
//    }
//}


- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    if (indexPath.section == 4) {
        
        return  300.0f;
    }
    
    return 45.0f;
}

//- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
//
//    if ( (indexPath.section    == 0
//        || indexPath.section == 1
//        || indexPath.section == 2) && indexPath.row) {
//    
//    return UITableViewCellEditingStyleDelete;
//    }
//    
//    return UITableViewCellEditingStyleNone;
//}
//
//- (NSArray *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath
//
//{
//    
//    // 添加一个删除按钮
//    
//    UITableViewRowAction *deleteRowAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDestructive title:@"删除" handler:^(UITableViewRowAction *action, NSIndexPath *indexPath) {
//        
////        NSLog(@点击了删除);
//        
//        
//        // 1. 更新数据
//        
////        [_allDataArray removeObjectAtIndex:indexPath.row];
//        
//        // 2. 更新UI
//        
//        [tableView deleteRowsAtIndexPaths:@[indexPath]withRowAnimation:UITableViewRowAnimationAutomatic];
//        
//    }];
//    
//    
//    // 删除一个置顶按钮
//    
//    UITableViewRowAction *topRowAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault title:@"置顶" handler:^(UITableViewRowAction *action, NSIndexPath *indexPath) {
//        
////        NSLog(@点击了置顶);
//        
//        
//        // 1. 更新数据
//        
////        [_allDataArray exchangeObjectAtIndex:indexPath.row withObjectAtIndex:0];
//        
//        
//        // 2. 更新UI
////        
////        NSIndexPath *firstIndexPath = [NSIndexPath indexPathForRow:0inSection:indexPath.section];
////        
////        [tableView moveRowAtIndexPath:indexPathtoIndexPath:firstIndexPath];
//        
//    }];
//    
//    topRowAction.backgroundColor = [UIColor blueColor];
//    
//    
//    // 添加一个更多按钮
//    
//    UITableViewRowAction *moreRowAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal title:@"更多" handler:^(UITableViewRowAction *action, NSIndexPath *indexPath) {
//        
////        NSLog(@点击了更多);
//        
//        
//        [tableView reloadRowsAtIndexPaths:@[indexPath]withRowAnimation:UITableViewRowAnimationMiddle];
//        
//    }];
//    
////    moreRowAction.backgroundEffect = [UIBlurEffecteffectWithStyle:UIBlurEffectStyleDark];
//    
//    
//    // 将设置好的按钮放到数组中返回
//    
//    return @[deleteRowAction, topRowAction, moreRowAction];
//    
//}

//- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
//    
//    if ((indexPath.section    == 0
//        || indexPath.section == 1
//        || indexPath.section == 2) && indexPath.row) {
//        
//        return YES;
//    }
//    return NO;
//}
//-(BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath{
//    
//    if ((indexPath.section    == 0
//         || indexPath.section == 1
//         || indexPath.section == 2) && indexPath.row) {
//        
//        return YES;
//    }
//   
//    return NO;
//}
//- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath{
//    return @"删除";
//}

//-(void)tableView:(UITableView*)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath*)indexPath{
//    
//    
//    if (editingStyle==UITableViewCellEditingStyleDelete) {
//    
//        [self.mailModel.mailRecipient.mailAddressMutArr removeObjectAtIndex:0];
//    
//        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
//    }
//}

#pragma -mark STSendMailTitleCellDelegate
-(void) addNewEmailAddress{

}

#pragma -mark STSendMailAddNewAddressCellDelegate

- (void) emailAddressDeleted{

}

- (void) emailAddressEditEnd{

    
}

#pragma -mark STSendMailSubjectCellDelegate

- (void) subjectEndChangeWith:(NSString *)subject{
    
}

#pragma -mark STSendMailContentCellDelegate

- (void) contentEndChangeWith:(NSString *)subject{

}


#pragma  -mark 懒加载

- (STSendMailModel *) mailModel{

    if (!_mailModel) {
        
        _mailModel =  [STSendMailModel instance];
    }

    return _mailModel;
}

@end
