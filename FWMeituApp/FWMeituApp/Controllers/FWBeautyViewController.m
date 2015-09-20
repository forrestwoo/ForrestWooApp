//
//  FWBeautyViewController.m
//  FWMeituApp
//
//  Created by ForrestWoo on 15-9-19.
//  Copyright (c) 2015年 ForrestWoo co,.ltd. All rights reserved.
//

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
    
    modeView = [[FWProcessImageMainMode alloc] initWithImage:[UIImage imageNamed:@"icon_function_autoBeauty_a@2x.png"] TouchedImage:[UIImage imageNamed:@"icon_function_autoBeauty_b@2x.png"] text:@"智能优化"];

//    modeView = [[FWProcessImageMainMode alloc] initWithImage:[UIImage imageNamed:@"icon_function_autoBeauty_a@2x.png"] text:@"智能优化"];
    UIImageView *tagImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"mc_line@2x.png"]];
    tagImage.frame = CGRectMake(80, 600, 1, 57);
    modeView.frame = CGRectMake(10, 600, 60, 57);
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
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(81, 600, 375, 57)];
    self.scrollView.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.scrollView];
    
    NSArray *imageViewImageArr = [NSArray arrayWithObjects:
                                  @"icon_home_beauty@2x.png", @"icon_home_cosmesis@2x.png", @"icon_home_puzzle@2x.png",
                                  @"icon_home_camera@2x.png", @"icon_home_material@2x.png", @"icon_home_meiyan@2x.png",
                                  @"icon_home_meipai@2x.png", @"icon_home_moreapp@2x.png",
                                  nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
