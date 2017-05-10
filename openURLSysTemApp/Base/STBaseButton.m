//
//  STBaseButton.m
//  openURLSysTemApp
//
//  Created by StarHui on 09/05/17.
//  Copyright © 2017年 StarHui. All rights reserved.
//

#import "STBaseButton.h"

@implementation STBaseButton

- (instancetype)init{
    
    self = [super init];
    if (self) {
        [self STBaseButtonSetupSubviews];
    }
    return self;
}

- (instancetype) initWithCoder:(NSCoder *)aDecoder{
    
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self STBaseButtonSetupSubviews];
    }
    return self;
}

- (instancetype) initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        [self STBaseButtonSetupSubviews];
    }
    return self;
}

- (void) STBaseButtonSetupSubviews{
    
    self.titleLabel.numberOfLines = 0;
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
}

@end
