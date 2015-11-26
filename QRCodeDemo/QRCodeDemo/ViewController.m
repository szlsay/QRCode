//
//  ViewController.m
//  QRCodeDemo
//
//  Created by rkxt_ios on 15/11/26.
//  Copyright © 2015年 ST. All rights reserved.
//

#import "ViewController.h"
#import "QRCodeImage.h"
@interface ViewController ()
@property ( nonatomic, weak, nullable) UIImageView *qrImageView; //
@end

@implementation ViewController

#pragma mark - lift cycle 生命周期

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    QRCodeImage *qrCodeImage = [QRCodeImage codeImageWithString:@"https://github.com/STShenZhaoliang/QRCode"
                                                           size:200
                                                          color:[UIColor orangeColor]
                                                           icon:[UIImage imageNamed:@"icon.jpg"]
                                                      iconWidth:50];
    UIImageView *qrImageView = [[UIImageView alloc]initWithImage:qrCodeImage];
    qrImageView.center = self.view.center;
    [self.view addSubview:qrImageView];
    self.qrImageView = qrImageView;
    
}

#pragma mark - Delegate 视图委托

#pragma mark - event response 事件相应

#pragma mark - private methods 私有方法

#pragma mark - getters and setters 属性

@end
