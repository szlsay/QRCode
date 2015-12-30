//
//  QRCodeUtil.h
//  QRCodeDemo
//
//  Created by rkxt_ios on 15/12/23.
//  Copyright © 2015年 ST. All rights reserved.
//

@import Foundation;
@import AVFoundation;
@import UIKit;

@interface QRCodeUtil : NSObject
+ (CGRect)screenBounds;

/**
 *  相机捕获定位
 */
+ (AVCaptureVideoOrientation)videoOrientationFromCurrentDeviceOrientation;
@end
