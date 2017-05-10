//
//  STSendSMSImageCollectionViewCell.m
//  openURLSysTemApp
//
//  Created by StarHui on 08/05/17.
//  Copyright © 2017年 StarHui. All rights reserved.
//

#import "STSendSMSImageCollectionViewCell.h"

@implementation STSendSMSImageCollectionViewCell
+(instancetype)instanceWithCollection:(UICollectionView *)collection andIndex:(NSIndexPath *)index{

    NSString *identifer =  NSStringFromClass(self);
    
    STSendSMSImageCollectionViewCell *cell = [collection dequeueReusableCellWithReuseIdentifier:identifer forIndexPath:index];
    return cell;
}
@end
