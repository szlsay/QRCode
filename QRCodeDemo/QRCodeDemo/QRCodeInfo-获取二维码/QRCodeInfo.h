//
//  QRCodeInfo.h
//  QRCodeDemo
//
//  Created by rkxt_ios on 15/12/23.
//  Copyright © 2015年 ST. All rights reserved.
//

@import Foundation;
@import UIKit;
@import CoreImage;
@interface QRCodeInfo : NSObject
/**
 *  1.获取图片中的二维码信息
 */

+ (NSString *)codeInfoWithImage:(UIImage *)image;

+ (UIImage*) imageBlackToTransparent:(UIImage*) image
;
@end
