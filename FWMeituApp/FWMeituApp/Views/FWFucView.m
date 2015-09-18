//
//  FWFucView.m
//  FWMeituApp
//
//  Created by ForrestWoo on 15-9-17.
//  Copyright (c) 2015年 ForrestWoo co,.ltd. All rights reserved.
//

#import "FWFucView.h"

@implementation FWFucView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        //103*105 60*60
        self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(21.5, 7, 60, 60)];
        self.imageView.clipsToBounds = YES;
        self.textView = [[UILabel alloc] initWithFrame:CGRectMake(1.5, 64, 100, 24)];
        self.textView.backgroundColor  = [UIColor clearColor];
        self.textView.textColor = [UIColor whiteColor];
//        [self.textView setFont:[UIFont fontWithName:@"helveica-boldoblique" size:1]];
        self.textView.textAlignment = UITextAlignmentCenter;
        [self addSubview:self.imageView];
        [self addSubview:self.textView];
    }
    
    return self;
}

- (void)initView:(NSArray *)arr
{
    self.clipsToBounds = YES;
    self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:(NSString *)[arr objectAtIndex:0]]];
    self.imageView.image = [UIImage imageNamed:(NSString *)[arr objectAtIndex:1]];
    self.textView.text = [arr objectAtIndex:2];
}

@end
