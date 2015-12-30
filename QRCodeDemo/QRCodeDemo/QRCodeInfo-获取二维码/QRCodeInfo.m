//
//  QRCodeInfo.m
//  QRCodeDemo
//
//  Created by rkxt_ios on 15/12/23.
//  Copyright © 2015年 ST. All rights reserved.
//

#import "QRCodeInfo.h"

@implementation QRCodeInfo

+ (NSString *)codeInfoWithImage:(UIImage *)image
{
    UIImage *imageUI = [QRCodeInfo imageBlackToTransparent:image];
    
    CIContext *context = [CIContext contextWithOptions:nil];
    CIDetector *detector = [CIDetector detectorOfType:CIDetectorTypeQRCode
                                              context:context
                                              options:@{CIDetectorAccuracy:CIDetectorAccuracyHigh}];
    CIImage *imageCI = [CIImage imageWithCGImage:imageUI.CGImage];
    NSArray *features = [detector featuresInImage:imageCI];
    CIQRCodeFeature *freature = [features firstObject];
    
    NSLog(@"%s, %@", __FUNCTION__, features);
    return freature.messageString;
}



+ (UIImage*) imageBlackToTransparent:(UIImage*) image

{
    
    // 分配内存
    
    const int imageWidth = image.size.width;
    
    const int imageHeight = image.size.height;
    
    size_t      bytesPerRow = imageWidth * 4;
    
    uint32_t* rgbImageBuf = (uint32_t*)malloc(bytesPerRow * imageHeight);
    
    
    
    // 创建context
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    
    CGContextRef context = CGBitmapContextCreate(rgbImageBuf, imageWidth, imageHeight, 8, bytesPerRow, colorSpace,
                                                 
                                                 kCGBitmapByteOrder32Little | kCGImageAlphaNoneSkipLast);
    
    CGContextDrawImage(context, CGRectMake(0, 0, imageWidth, imageHeight), image.CGImage);
    
    
    
    // 遍历像素
    
    int pixelNum = imageWidth * imageHeight;
    
    uint32_t* pCurPtr = rgbImageBuf;
    
    for (int i = 0; i < pixelNum; i++, pCurPtr++)
        
    {
        
        if ((*pCurPtr & 0x80808000) == 0x80808000)    // 将白色变成透明
            
        {
            
            uint8_t* ptr = (uint8_t*)pCurPtr;
            
            ptr[3] = 255; //0~255
            
            ptr[2] = 255;
            
            ptr[1] = 255;
            
            ptr[0] = 255;
            
        }
        
        else
            
        {
            
            // 改成下面的代码，会将图片转成想要的颜色
            
            uint8_t* ptr = (uint8_t*)pCurPtr;
            
            ptr[3] = 0; //0~255
            
            ptr[2] = 0;
            
            ptr[1] = 0;
            
            
            ptr[0] = 255;
        }
        
        
        
        
    }
    
    
    
    // 将内存转成image
    
    CGDataProviderRef dataProvider = CGDataProviderCreateWithData(NULL, rgbImageBuf, bytesPerRow * imageHeight, ProviderReleaseData1);
    
    CGImageRef imageRef = CGImageCreate(imageWidth, imageHeight, 8, 32, bytesPerRow, colorSpace,
                                        
                                        kCGImageAlphaLast | kCGBitmapByteOrder32Little, dataProvider,
                                        
                                        NULL, true, kCGRenderingIntentDefault);
    
    CGDataProviderRelease(dataProvider);
    
    
    
    UIImage* resultUIImage = [UIImage imageWithCGImage:imageRef];
    
    
    
    // 释放
    
    CGImageRelease(imageRef);
    
    CGContextRelease(context);
    
    CGColorSpaceRelease(colorSpace);
    
    // free(rgbImageBuf) 创建dataProvider时已提供释放函数，这里不用free
    
    
    
    return resultUIImage;
    
}


void ProviderReleaseData1 (void *info, const void *data, size_t size)

{
    
    free((void*)data);
    
}
@end
