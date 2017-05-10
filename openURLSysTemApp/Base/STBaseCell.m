//
//  STBaseCell.m
//  openURLSysTemApp
//
//  Created by StarHui on 09/05/17.
//  Copyright © 2017年 StarHui. All rights reserved.
//

#import "STBaseCell.h"

@implementation STBaseCell

+ (instancetype) stbaseCellInstanceWithTableView:(UITableView *)tableView{
    
    NSString *identifer = NSStringFromClass(self);
    STBaseCell * cell = [tableView dequeueReusableCellWithIdentifier:identifer];
    return cell;
}

- (instancetype)init{

    self = [super init];
    if (self) {
        [self stBaseCellSetupSubviews];
    }
    return self;
}

- (instancetype) initWithCoder:(NSCoder *)aDecoder{

    self = [super initWithCoder:aDecoder];
    if (self) {
        [self stBaseCellSetupSubviews];
    }
    return self;
}

- (instancetype) initWithFrame:(CGRect)frame{

    self = [super initWithFrame:frame];
    if (self) {
        [self stBaseCellSetupSubviews];
    }
    return self;
}

- (void) stBaseCellSetupSubviews{

    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.showsReorderControl = YES;
}


@end
