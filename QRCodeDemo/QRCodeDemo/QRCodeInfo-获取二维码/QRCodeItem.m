//
//  QRCodeItem.m
//  QRCodeDemo
//
//  Created by rkxt_ios on 15/12/23.
//  Copyright © 2015年 ST. All rights reserved.
//

#import "QRCodeItem.h"

@implementation QRCodeItem

- (instancetype)initWithFrame:(CGRect)frame
                        title:(NSString *)title
{
    if (self = [[QRCodeItem alloc]initWithFrame:frame]) {
        [self setTitle:title forState:UIControlStateNormal];
    }
    return self;
}

@end
