//
//  STSendSMSViewController.m
//  openURLSysTemApp
//
//  Created by StarHui on 08/05/17.
//  Copyright © 2017年 StarHui. All rights reserved.
//

#import "STSendSMSViewController.h"
#import "STSendSMSImageCollectionViewCell.h"
#import <MessageUI/MessageUI.h>

@interface STSendSMSViewController ()
<UICollectionViewDelegate,
UICollectionViewDataSource,
MFMessageComposeViewControllerDelegate>

@property (weak, nonatomic) IBOutlet UITextField *phoneNumTextf;
@property (weak, nonatomic) IBOutlet UITextField *subjecTextF;
@property (weak, nonatomic) IBOutlet UITextView *contentTextV;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation STSendSMSViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)phoneNumChanegEnd:(id)sender {
    
    
}

- (IBAction)subjectChangeEnd:(id)sender {
}

- (IBAction)tapOnClick:(id)sender {
    
    [self.view endEditing: YES];
}
- (IBAction)sendSMSOnClick:(id)sender {
    
     [self.view endEditing: YES];
    
    if (![MFMessageComposeViewController canSendText]) {
        NSLog(@"不支持发送短信");
        return ;
    }
    
    
    MFMessageComposeViewController *messageController=[[MFMessageComposeViewController alloc]init];
    //收件人
    messageController.recipients=[self.phoneNumTextf.text componentsSeparatedByString:@","];
    //信息正文
    messageController.body=self.contentTextV.text;
    //设置代理,注意这里不是delegate而是messageComposeDelegate
    messageController.messageComposeDelegate = self;
    //如果运行商支持主题
    if([MFMessageComposeViewController canSendSubject]){
        messageController.subject=self.subjecTextF.text;
    }
    //如果运行商支持附件
//    if ([MFMessageComposeViewController canSendAttachments]) {
//        /*第一种方法*/
//        //messageController.attachments=...;
//        
//        /*第二种方法*/
//        NSArray *attachments= [self.attachments.text componentsSeparatedByString:@","];
//        if (attachments.count>0) {
//            [attachments enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
//                NSString *path=[[NSBundle mainBundle]pathForResource:obj ofType:nil];
//                NSURL *url=[NSURL fileURLWithPath:path];
//                [messageController addAttachmentURL:url withAlternateFilename:obj];
//            }];
//        }
//        
//        /*第三种方法*/
//        //            NSString *path=[[NSBundle mainBundle]pathForResource:@"photo.jpg" ofType:nil];
//        //            NSURL *url=[NSURL fileURLWithPath:path];
//        //            NSData *data=[NSData dataWithContentsOfURL:url];
//        /**
//         *  attatchData:文件数据
//         *  uti:统一类型标识，标识具体文件类型，详情查看：帮助文档中System-Declared Uniform Type Identifiers
//         *  fileName:展现给用户看的文件名称
//         */
//        //            [messageController addAttachmentData:data typeIdentifier:@"public.image"  filename:@"photo.jpg"];
//    }
    [self presentViewController:messageController animated:YES completion:nil];
}



#pragma -mark UICollectionViewDataSource

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{

    return 3;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    STSendSMSImageCollectionViewCell * cell = [STSendSMSImageCollectionViewCell instanceWithCollection:collectionView andIndex:indexPath];    
    return cell;
}
#pragma -mark UICollectionViewDelegate
//-(CGSize)sizeForChildContentContainer:(id<UIContentContainer>)container withParentContainerSize:(CGSize)parentSize{
//
//    CGSize size = CGSizeMake(50, 50);
//    return size;
//}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{


    
}

#pragma -mark MFMessageComposeViewControllerDelegate
//发送完成，不管成功与否
-(void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result{
    switch (result) {
        case MessageComposeResultSent:
            NSLog(@"发送成功.");
            break;
        case MessageComposeResultCancelled:
            NSLog(@"取消发送.");
            break;
        default:
            NSLog(@"发送失败.");
            break;
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
