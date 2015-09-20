//
//  FWBeautyViewController.h
//  FWMeituApp
//
//  Created by ForrestWoo on 15-9-19.
//  Copyright (c) 2015年 ForrestWoo co,.ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "FWProcessImageMainMode.h"

@interface FWBeautyViewController : UIViewController
{
    UIImagePickerController *imagePicker;
    FWProcessImageMainMode *modeView ;
}

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIImage *image;

- (id)initWithImage:(UIImage *)image;
@end
