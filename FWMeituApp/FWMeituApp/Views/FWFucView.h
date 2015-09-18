//
//  FWFucView.h
//  FWMeituApp
//
//  Created by ForrestWoo on 15-9-17.
//  Copyright (c) 2015年 ForrestWoo co,.ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FWFucView;
@protocol FWImageProcessFucDelegate <NSObject>

- (void)functionView:(FWFucView *)fuctionView;

@end

@interface FWFucView : UIView

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UILabel *textView;
@property (nonatomic, assign) id<FWImageProcessFucDelegate> delegate;

- (void)initView:(NSArray *)arr;

@end
