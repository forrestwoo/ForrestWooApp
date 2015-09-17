//
//  ViewController.m
//  FWMeituApp
//
//  Created by ForrestWoo on 15-9-16.
//  Copyright (c) 2015年 ForrestWoo co,.ltd. All rights reserved.
//

#import "ViewController.h"
#import "ConstantsConfig.h"

@interface ViewController ()

@property (nonatomic, strong) IndexView *indexView;
@property (nonatomic, strong) WFImageViewController *imagepick;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.indexView = [[IndexView alloc] initWithFrame:CGRectMake(0, HEIGHT / 5, WIDTH, 3 * HEIGHT / 5)];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_home@2x.jpg"]];

    UIButton *btnMeihua = [[UIButton alloc] initWithFrame:CGRectMake(40, 200, 120, 120)];
    [btnMeihua setBackgroundImage:[UIImage imageNamed:@"icon_share_beautity@3x.png"] forState:UIControlStateNormal];
    [btnMeihua addTarget:self action:@selector(meihuaClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnMeihua];
    
    UIButton *btnMeirong = [[UIButton alloc] initWithFrame:CGRectMake(240, 200, 120, 120)];
    [btnMeirong setBackgroundImage:[UIImage imageNamed:@"icon_share_camera@3x.png"] forState:UIControlStateNormal];
    [btnMeirong addTarget:self action:@selector(meirongClicked:) forControlEvents:UIControlEventTouchUpInside];

    
    [self.view addSubview:btnMeirong];
    
    UIButton *btnPintu = [[UIButton alloc] initWithFrame:CGRectMake(40, 350, 120, 120)];
    [btnPintu setBackgroundImage:[UIImage imageNamed:@"icon_share_cosmesis@3x.png"] forState:UIControlStateNormal];
    [btnPintu addTarget:self action:@selector(pintuClicked:) forControlEvents:UIControlEventTouchUpInside];

    
    [self.view addSubview:btnPintu];
    
    self.imagepick = [[WFImageViewController alloc] init];
}

- (void)meihuaClicked:(id)sender
{
    [self.navigationController pushViewController:self.imagepick animated:YES];
}

- (void)meirongClicked:(id)sender
{
    
}

- (void)pintuClicked:(id)sender
{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
