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

@interface FWFunctionViewController ()

@property (nonatomic, assign) NSInteger itemCount;
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UIImage *currentImage;
@end

@implementation FWFunctionViewController

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
    
    self.imageView = [[UIImageView alloc] initWithImage:self.image];
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
    
    self.imageView.frame = CGRectMake(xPoiont, yPoint, 375, 520);
    [self.imageView sizeToFit];
    [self.view addSubview:self.imageView];
    
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
    self.effectBar.delegate = self;
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
    GPUImageBrightnessFilter *passthroughFilter = [[GPUImageBrightnessFilter alloc]init];
    GPUImageExposureFilter *g2 = [[GPUImageExposureFilter alloc] init];
    GPUImageContrastFilter *g3 = [[GPUImageContrastFilter alloc] init];
    GPUImageSaturationFilter *g4 = [[GPUImageSaturationFilter alloc] init];
    GPUImageGammaFilter *g5 = [[GPUImageGammaFilter alloc] init];
    GPUImageHueFilter *g6 = [[GPUImageHueFilter alloc] init];
    
    CGSize size = self.image.size;
    GPUImagePicture *pic ;
    switch (index) {
        case 0:
            self.currentImage = self.image;
            self.imageView.image = self.image;
            break;
            
        case 1:
            passthroughFilter.brightness = 0.05;
            [passthroughFilter forceProcessingAtSize:size];
            pic = [[GPUImagePicture alloc] initWithImage:self.image];
            [pic addTarget:passthroughFilter];
            [pic processImage];
            [passthroughFilter useNextFrameForImageCapture];
            self.imageView.image =[passthroughFilter imageFromCurrentFramebuffer];
            break;
            
        case 2:
            g2.exposure = 0.2;
            [g2 forceProcessingAtSize:size];
            pic = [[GPUImagePicture alloc] initWithImage:self.image];
            [pic addTarget:g2];
            [pic processImage];
            [g2 useNextFrameForImageCapture];
            self.imageView.image =[g2 imageFromCurrentFramebuffer];
            break;
        case 3:
            g3.contrast = 0.8;
            [g3 forceProcessingAtSize:size];
            pic = [[GPUImagePicture alloc] initWithImage:self.image];
            [pic addTarget:g3];
            [pic processImage];
            [g3 useNextFrameForImageCapture];
            self.imageView.image =[g3 imageFromCurrentFramebuffer];
            break;
        case 4:
            g4.saturation = 0.5;
            [g4 forceProcessingAtSize:size];
            pic = [[GPUImagePicture alloc] initWithImage:self.image];
            [pic addTarget:g4];
            [pic processImage];
            [g4 useNextFrameForImageCapture];
            self.imageView.image =[g4 imageFromCurrentFramebuffer];
            break;
        case 5:
            g5.gamma = 0.5;
            [g5 forceProcessingAtSize:size];
            pic = [[GPUImagePicture alloc] initWithImage:self.image];
            [pic addTarget:g5];
            [pic processImage];
            [g5 useNextFrameForImageCapture];
            self.imageView.image =[g5 imageFromCurrentFramebuffer];
            break;
        case 6:
            g6.hue = 5;
            [g6 forceProcessingAtSize:size];
            pic = [[GPUImagePicture alloc] initWithImage:self.image];
            [pic addTarget:g6];
            [pic processImage];
            [g6 useNextFrameForImageCapture];
            self.imageView.image =[g6 imageFromCurrentFramebuffer];
            break;
        default:
            break;
    }
}

- (void)effectFunc
{
    
}

@end
