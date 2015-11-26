# QRCode
一行代码生成二维码，可以自定义二维码的颜色，宽度，中间头像及中间头像的宽度。
## 效果图
![](https://github.com/STShenZhaoliang/QRCode/blob/master/picture.png)

## 代码举例
    QRCodeImage *qrCodeImage = [QRCodeImage codeImageWithString:@"https://github.com/STShenZhaoliang/QRCode"
                                                           size:200
                                                          color:[UIColor orangeColor]
                                                           icon:[UIImage imageNamed:@"icon.jpg"]
                                                      iconWidth:50];
    UIImageView *qrImageView = [[UIImageView alloc]initWithImage:qrCodeImage];
    qrImageView.center = self.view.center;
    [self.view addSubview:qrImageView];


