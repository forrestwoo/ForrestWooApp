//
//  FWProcessImageMainMode.h
//  FWMeituApp
//
//  Created by ForrestWoo on 15-9-20.
//  Copyright (c) 2015年 ForrestWoo co,.ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FWProcessImageMainMode : UIView
{
    UIImage *touchedImage;
    UIImage *begainImage;
}

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UILabel *textLabel;

- (id)initWithImage:(UIImage *)image text:(NSString *)text;
- (id)initWithImage:(UIImage *)image TouchedImage:(UIImage *)touchImage text:(NSString *)text;


@end
