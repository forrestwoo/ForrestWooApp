//
//  UIImage+ImageScale.h
//  FWMeituApp
//
//  Created by ForrestWoo on 15-9-24.
//  Copyright (c) 2015年 ForrestWoo co,.ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (ImageScale)

+(UIImage *) imageCompressForWidth:(UIImage *)sourceImage targetWidth:(CGFloat)defineWidth;
+(UIImage *) imageCompressForWidth:(UIImage *)sourceImage targetHeight:(CGFloat)defineHeight;

@end
