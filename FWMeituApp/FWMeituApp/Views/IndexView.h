//
//  IndexView.h
//  FWMeituApp
//
//  Created by ForrestWoo on 15-9-16.
//  Copyright (c) 2015年 ForrestWoo co,.ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IndexView : UIView <UIScrollViewDelegate>

@property (nonatomic, strong)  UIScrollView *scrollView;
@property (nonatomic, strong)  UIImageView *arrowView;

-(id)initWithFrame:(CGRect)frame;

@end
