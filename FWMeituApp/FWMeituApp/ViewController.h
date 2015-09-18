//
//  ViewController.h
//  FWMeituApp
//
//  Created by ForrestWoo on 15-9-16.
//  Copyright (c) 2015年 ForrestWoo co,.ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "FWFucView.h"

@interface ViewController : UIViewController <UIScrollViewDelegate, FWImageProcessFucDelegate>
{
    UIButton *btnArrow;
}

@property (nonatomic ,strong) UIScrollView *scrolleView;
@property (nonatomic, strong) UIPageControl *pageControl;

@end

