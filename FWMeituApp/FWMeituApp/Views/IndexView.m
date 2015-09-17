//
//  IndexView.m
//  FWMeituApp
//
//  Created by ForrestWoo on 15-9-16.
//  Copyright (c) 2015年 ForrestWoo co,.ltd. All rights reserved.
//

#import "IndexView.h"

@implementation IndexView

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

- (void)setupView
{
}

-(id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        self.scrollView = [[UIScrollView alloc] initWithFrame:frame];
        self.scrollView.contentSize = CGSizeMake(frame.size.width * 2, 3 * frame.size.height / 5);
        self.scrollView.pagingEnabled = YES;
        self.scrollView.showsHorizontalScrollIndicator = NO;
        self.scrollView.showsVerticalScrollIndicator = NO;
        self.scrollView.backgroundColor = [UIColor clearColor];
        self.scrollView.delegate = self;
        [self addSubview:self.scrollView];
        
        self.arrowView = [[UIImageView alloc] initWithFrame:CGRectMake(frame.size.width - 40, frame.size.height / 2 - 35, 40, 70)];
        self.arrowView.image = [UIImage imageNamed:@"right_arrow@2x.png"];
        self.arrowView.backgroundColor = [UIColor clearColor];
//        [self addSubview:self.arrowView];
        self.backgroundColor = [UIColor clearColor];
    }
    
    return self;
}

- (void)setupScrollView
{
    for (int i = 0; i < 2; i++) {
        
    }
}

//- (void)

@end
