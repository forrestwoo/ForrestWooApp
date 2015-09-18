//
//  ViewController.m
//  FWMeituApp
//
//  Created by ForrestWoo on 15-9-16.
//  Copyright (c) 2015年 ForrestWoo co,.ltd. All rights reserved.
//375*667

#import "ViewController.h"
#import "ConstantsConfig.h"
#import "FWTopView.h"
#import "FWImagePickerTableViewController.h"

@interface ViewController ()

@property (nonatomic, strong) FWTopView *topView;
@property (nonatomic, strong) FWImagePickerTableViewController *imagePicker;
@end

@implementation ViewController


- (void)loadView
{
    [super loadView];
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_home@2x.jpg"]];
    self.scrolleView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 137, 375, 393)];
    self.scrolleView.pagingEnabled = YES;
    self.scrolleView.contentSize = CGSizeMake(375 * 2, 393);
    self.scrolleView.showsHorizontalScrollIndicator = NO;
    self.scrolleView.showsVerticalScrollIndicator = NO;
    self.scrolleView.delegate = self;
    
    self.pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(162, 620, 50, 20)];
    self.pageControl.numberOfPages = 2;
    
    [self.view addSubview:self.scrolleView];
    [self.view addSubview:self.pageControl];
    
    [self setupScrollView];
    
    
    //    NSLog(@"%f,%f",size.width,size.height);
    
    UIImageView *image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg_topview_topback_a.png"]];
    image.frame = CGRectMake(20, 40, 453/2, 103/2);
    [self.view addSubview:image];
    
    UIButton *btnSetting = [UIButton buttonWithType:UIButtonTypeCustom];
    btnSetting.frame = CGRectMake(330, 620, 39, 39);
    [btnSetting setImage:[UIImage imageNamed:@"btn_home_setting_a@2x.png"] forState:UIControlStateNormal];
    [self.view addSubview:btnSetting];
    
    btnArrow = [UIButton buttonWithType:UIButtonTypeCustom];
    btnArrow.frame = CGRectMake(335, 320, 30, 50);
    [btnArrow setImage:[UIImage imageNamed:@"right_arrow@2x.png"] forState:UIControlStateNormal];
    [btnArrow setImage:[UIImage imageNamed:@"right_arrow_highlight@2x.png"] forState:UIControlStateHighlighted];
    [btnArrow addTarget:self action:@selector(btnArrowClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnArrow];
    
    [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(hanlderAction:) userInfo:nil repeats:YES];
    
    self.topView = [[FWTopView alloc] initWithFrame:CGRectMake(317,  0, TOPVIEW_WIDTH, TOPVIEW_HEIGHT)];
    [self.view addSubview:self.topView];
    [self.topView initView:@"20"];
    
    self.imagePicker = [[FWImagePickerTableViewController alloc] initWithStyle:UITableViewStylePlain];
    
}


//
- (void)hanlderAction:(NSTimer *)timer
{
    //    if (btnArrow.image.] == UIControlStateHighlighted)
    //    {
    //    }
}

- (void)btnArrowClicked:(id)sender
{
    if (self.pageControl.currentPage ) {
        self.pageControl.currentPage = 0;
        [self toLeftArrow];
    }else{
        self.pageControl.currentPage = 1;
        [self toRightArrow];

    }
    
    CGRect frame = self.scrolleView.frame;
    frame.origin.x = frame.size.width * self.pageControl.currentPage;
    [self.scrolleView scrollRectToVisible:frame animated:YES];
}

- (void)toRightArrow
{
    btnArrow.frame = CGRectMake(10, 320, 30, 50);
    [btnArrow setImage:[UIImage imageNamed:@"left_arrow@2x.png"] forState:UIControlStateNormal];
}

- (void)toLeftArrow
{
    btnArrow.frame = CGRectMake(335, 320, 30, 50);
    [btnArrow setImage:[UIImage imageNamed:@"right_arrow@2x.png"] forState:UIControlStateNormal];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    int index = fabs(self.scrolleView.contentOffset.x / self.scrolleView.frame.size.width) ;
    self.pageControl.currentPage = index;
    
    if (index)
    {
        [self toRightArrow];
    }
    else
    {
        [self toLeftArrow];
    }
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
}

- (void)setupScrollView
{
    NSArray *imageViewImageArr = [NSArray arrayWithObjects:
                                  @"icon_home_beauty@2x.png", @"icon_home_cosmesis@2x.png", @"icon_home_puzzle@2x.png",
                                  @"icon_home_camera@2x.png", @"icon_home_material@2x.png", @"icon_home_meiyan@2x.png",
                                  @"icon_home_meipai@2x.png", @"icon_home_moreapp@2x.png",
                                  nil];
    NSArray *imageViewBackImageArr = [NSArray arrayWithObjects:
                                      @"home_block_red_a@2x.png", @"home_block_pink_a@2x.png", @"home_block_green_a@2x.png",
                                      @"home_block_orange_a@2x.png", @"home_block_blue_a@2x.png", @"item_bg_purple_a@2x.png",
                                      @"home_block_pink_a@2x.png", @"home_block_red_a@2x.png",
                                      nil];
    UIImage *iii = [UIImage imageNamed:@"icon_colours_flag@2x.png"];
        NSLog(@"%f,%f",iii.size.width,iii.size.height);
    UIImage *ii = [UIImage imageNamed:@"icon_blur_heart@2x.png"];
        NSLog(@"%f,%f",ii.size.width,ii.size.height);
//    UIImage *i = [UIImage imageNamed:@"icon_home_beauty@2x.png"];
//    //    NSLog(@"%f,%f",i.size.width,i.size.height);
    NSArray *textArr = [NSArray arrayWithObjects:@"美化图片", @"人像美容", @"拼图", @"万能相机", @"素材中心", @"美颜相机", @"美拍", @"更多功能", nil];
    NSArray *widthArr = [NSArray arrayWithObjects:[NSNumber numberWithInt:65],[NSNumber numberWithInt:207], [NSNumber numberWithInt:65],[NSNumber numberWithInt:207],[NSNumber numberWithInt:65],[NSNumber numberWithInt:207],[NSNumber numberWithInt:440],[NSNumber numberWithInt:582],nil];
    NSArray *heightArr = [NSArray arrayWithObjects:[NSNumber numberWithInt:0],[NSNumber numberWithInt:0], [NSNumber numberWithInt:144],[NSNumber numberWithInt:144],[NSNumber numberWithInt:281],[NSNumber numberWithInt:281],[NSNumber numberWithInt:0],[NSNumber numberWithInt:0],nil];
    
    //144.144+206+50,,,x+144,x+144+206+50...210*3+2*50=...300+210+52+210+52
    FWFucView *fv = nil;
    for (int i = 0; i < 8; i++) {
        fv = [[FWFucView alloc] initWithFrame:CGRectMake([(NSString *)[widthArr objectAtIndex:i] floatValue], [(NSString *)[heightArr objectAtIndex:i] floatValue], 103, 105)];
        NSArray *arr = [NSArray arrayWithObjects: [imageViewBackImageArr objectAtIndex:i], [imageViewImageArr objectAtIndex:i], [textArr objectAtIndex:i], nil];
        [fv initView:arr];
        [self.scrolleView addSubview:fv];
        fv.delegate = self;
    }
}



- (void)functionView:(FWFucView *)fuctionView
{
    [self.navigationController pushViewController:self.imagePicker animated:YES];
    NSLog(@"%f",self.imagePicker.view.frame.size.width);
}


@end
