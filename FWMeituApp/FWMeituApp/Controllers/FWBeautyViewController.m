//
//  FWBeautyViewController.m
//  FWMeituApp
//
//  Created by ForrestWoo on 15-9-19.
//  Copyright (c) 2015年 ForrestWoo co,.ltd. All rights reserved.
//

#define kWidth 50
#define kHeight 67
#define kPoint_Y 590

#import "FWBeautyViewController.h"

@interface FWBeautyViewController ()

@end

@implementation FWBeautyViewController

- (id)initWithImage:(UIImage *)image
{
    if (self = [super init]) {
        self.image = image;
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor  = [UIColor blackColor];
    
    self.title = @"美化图片";
    
    modeView = [FWButton buttonWithType:UIButtonTypeCustom];
    [modeView setTitle:@"智能优化" forState:UIControlStateNormal];
    [modeView setImage:[UIImage imageNamed:@"icon_function_autoBeauty_a@2x.png"] forState:UIControlStateNormal];
    [modeView setImage:[UIImage imageNamed:@"icon_function_autoBeauty_b@2x.png"] forState:UIControlStateHighlighted];
    [modeView setBackgroundColor:[UIColor clearColor]];
    [modeView.titleLabel setFont:[UIFont systemFontOfSize:10]];
    modeView.frame = CGRectMake(5, kPoint_Y, kWidth, kHeight);
    highlightedTextColor = [UIColor colorWithRed:19 / 255.0 green:105 / 255.0 blue:240 / 255.0 alpha:1.0];
    modeView.highlightedTextColor = highlightedTextColor;
    modeView.topPading = 3;
    UIImageView *tagImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"mc_line@2x.png"]];
    tagImage.frame = CGRectMake(60, 600, 1, 57);
    [self.view addSubview:modeView];
    [self.view addSubview:tagImage];
    [self initImageView];
    [self initScrolleView];
}

- (void)initImageView
{
    self.imageView = [[UIImageView alloc] initWithImage:self.image];
    self.imageView.frame = CGRectMake(0, 64, 375, 667 - 44 - 77 - 20);
    [self.imageView sizeToFit];
    [self.view addSubview:self.imageView];
}

- (void)initScrolleView
{
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(61, kPoint_Y, 375, 67)];
    self.scrollView.contentSize = CGSizeMake(800, 67);
    self.scrollView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:self.scrollView];

    NSArray *normalImageViewImageArr = [NSArray arrayWithObjects:
                                        @"icon_function_edit_a@2x.png", @"icon_function_color_a@2x.png", @"icon_function_stylize_a@2x.png",
                                        @"icon_function_border_a@2x.png", @"icon_function_mohuanbi_a@2x.png", @"icon_function_mosaic_a@2x.png",
                                        @"icon_function_text_a@2x.png", @"icon_function_bokeh_a@2x.png",
                                        nil];
    NSArray *hightlightedImageViewImageArr = [NSArray arrayWithObjects:
                                              @"icon_function_edit_b@2x.png", @"icon_function_color_b@2x.png", @"icon_function_stylize_b@2x.png",
                                              @"icon_function_border_b@2x.png", @"icon_function_mohuanbi_b@2x.png", @"icon_function_mosaic_b@2x.png",
                                              @"icon_function_text_b@2x.png", @"icon_function_bokeh_b@2x.png",
                                              nil];
    NSArray *textArr = [NSArray arrayWithObjects:@"编辑", @"增强", @"特效", @"边框", @"魔幻笔", @"马赛克", @"文字", @"背景虚化", nil];

    //ox 4 pad 15
    FWButton *btFunction = nil;
    int viewSpace = 15;
    int begainX = 4;
    for (int i = 0; i < 8; i++) {
        btFunction = [FWButton buttonWithType:UIButtonTypeCustom];
        
        [btFunction setTitle:[textArr objectAtIndex:i] forState:UIControlStateNormal];
        [btFunction setImage:[UIImage imageNamed:[normalImageViewImageArr objectAtIndex:i]] forState:UIControlStateNormal];
        [btFunction setImage:[UIImage imageNamed:[hightlightedImageViewImageArr objectAtIndex:i]] forState:UIControlStateHighlighted];
        [btFunction setBackgroundColor:[UIColor clearColor]];
        [btFunction.titleLabel setFont:[UIFont systemFontOfSize:10]];
        btFunction.frame = CGRectMake(begainX + (kWidth + viewSpace) * i, 0, kWidth, kHeight);
        highlightedTextColor = [UIColor colorWithRed:19 / 255.0 green:105 / 255.0 blue:240 / 255.0 alpha:1.0];
        btFunction.highlightedTextColor = highlightedTextColor;
        btFunction.topPading = 3;

        [self.scrollView addSubview:btFunction];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
