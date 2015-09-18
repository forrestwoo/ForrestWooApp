//
//  FWFucView.h
//  FWMeituApp
//
//  Created by ForrestWoo on 15-9-17.
//  Copyright (c) 2015年 ForrestWoo co,.ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FWFucView : UIView

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UILabel *textView;

- (void)initView:(NSArray *)arr;

@end
