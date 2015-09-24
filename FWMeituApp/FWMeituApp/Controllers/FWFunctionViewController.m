//
//  FWFunctionViewController.m
//  FWMeituApp
//
//  Created by ForrestWoo on 15-9-23.
//  Copyright (c) 2015年 ForrestWoo co,.ltd. All rights reserved.
//

#define kTitleWidth 60
#define kTitleHeight 20

#import "FWFunctionViewController.h"
#import "ConstantsConfig.h"
#import "UIImage+ImageScale.h"

@interface FWFunctionViewController ()

@property (nonatomic, assign) NSInteger itemCount;

@end

@implementation FWFunctionViewController

- (id)initWithNormalImageArr:(NSArray *)normalImageArray highlightedImageArr:(NSArray *)highlightedImageArr textArr:(NSArray *)textArray type:(NSString *)type
{
    if (self = [super init])
    {
        self.normalImageArr = normalImageArray;
        self.hightlightedImageArr = highlightedImageArr;
        self.texts = textArray;
        self.itemCount = [normalImageArray count];
        self.FunctionType = type;
    }
    
    return self;
}

- (id)initWithImage:(UIImage *)image normalImageArr:(NSArray *)normalImageArray highlightedImageArr:(NSArray *)highlightedImageArr textArr:(NSArray *)textArray type:(NSString *)type
{
    if (self = [super init])
    {
        self.normalImageArr = normalImageArray;
        self.hightlightedImageArr = highlightedImageArr;
        self.texts = textArray;
        self.itemCount = [normalImageArray count];
        self.FunctionType = type;
        self.image = image;
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor blackColor];
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake((WIDTH - kTitleWidth) / 2, 10, kTitleWidth, kTitleHeight)];
    title.text = self.FunctionType;
    [title setFont:[UIFont systemFontOfSize:12]];
    title.textColor = [UIColor whiteColor];
    [self.view addSubview:title];
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:self.image];
    CGSize size = self.image.size;
    CGFloat imageWidth = size.width;
    CGFloat imageHeight = size.height;
    CGFloat xPoiont = 0;
    CGFloat yPoint = 64;
    if (imageWidth == 375) {
        yPoint = (460 - imageHeight) / 2.0 + 64;
    }
    if (imageHeight == 460) {
        xPoiont = (375 - imageWidth) / 2.0 ;
    }
    
    imageView.frame = CGRectMake(xPoiont, yPoint, 375, 520);
    [imageView sizeToFit];
    [self.view addSubview:imageView];
    
    UIImage *i1 = [UIImage imageNamed:@"btn_cancel_a@2x.png"];
    self.btnClose = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.btnClose setImage:i1 forState:UIControlStateNormal];
    self.btnClose.frame = CGRectMake(20, HEIGHT - i1.size.height - 10, i1.size.width, i1.size.height);
    [self.btnClose addTarget:self action:@selector(btnCancelOrSaveClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.btnClose];
    
    UIImage *i2 = [UIImage imageNamed:@"btn_ok_a@2x.png"];
    self.btnSave = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.btnSave setImage:i2 forState:UIControlStateNormal];
    self.btnSave.frame = CGRectMake(WIDTH - i2.size.width - 20, HEIGHT - i2.size.height - 10, i2.size.width, i2.size.height);
    [self.view addSubview:self.btnSave];
    
    self.effectBar = [[FWEffectBar alloc] initWithFrame:CGRectMake(0, HEIGHT - i1.size.height - 10 - 20 - 30, WIDTH, 53)];
    NSMutableArray *arr = [[NSMutableArray alloc] initWithCapacity:0];
    for (int i = 0; i < self.itemCount; i++) {
        FWEffectBarItem *item = [[FWEffectBarItem alloc] initWithFrame:CGRectZero];
        [item setFinishedSelectedImage:[UIImage imageNamed:[self.hightlightedImageArr objectAtIndex:i]] withFinishedUnselectedImage:[UIImage imageNamed:[self.normalImageArr objectAtIndex:i]] ];
        item.title = [self.texts objectAtIndex:i];
        [arr addObject:item];
    }
    self.effectBar.items = arr;
    [self.view addSubview:self.effectBar];
}

- (void)btnCancelOrSaveClicked:(id)sender
{
    if (sender == self.btnClose) {
        [self dismissViewControllerAnimated:YES completion:^{
            
        }];
    }else if(sender == self.btnSave){
        
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)effectBar:(FWEffectBar *)bar didSelectItemAtIndex:(NSInteger)index
{
    
}

- (void)setSelectedIndex:(NSUInteger)selectedIndex
{
    if (selectedIndex >= self.itemCount) {
        return;
    }
    
    
}

- (FWEffectBarItem *)selectedItem
{
    return nil;
}
@end
