//
//  FWProcessImageMainMode.m
//  FWMeituApp
//
//  Created by ForrestWoo on 15-9-20.
//  Copyright (c) 2015年 ForrestWoo co,.ltd. All rights reserved.
//

#import "FWProcessImageMainMode.h"

@implementation FWProcessImageMainMode

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (id)initWithImage:(UIImage *)image text:(NSString *)text
{
    if (self = [super init])
    {
        self.frame = CGRectMake(0, 0, 60, 57);
        self.imageView = [[UIImageView alloc] initWithImage:image];
        self.imageView.frame = CGRectMake(15, 0, 30, 30);
        self.textLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 40, 60, 17)];
        self.textLabel.text = text;
        self.textLabel.textColor = [UIColor whiteColor];
        [self.textLabel setFont:[UIFont systemFontOfSize:10]];
        self.textLabel.textAlignment = UITextAlignmentCenter;
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [self addSubview:self.imageView];
        [self addSubview:self.textLabel];
    }
    
    return self;
}

- (id)initWithImage:(UIImage *)image TouchedImage:(UIImage *)touchImage text:(NSString *)text
{
    if ([self initWithImage:image text:text])
    {
        touchedImage = touchImage;
        begainImage = image;
    }
    
    return self;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    self.imageView.image = touchedImage;
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    self.imageView.image = begainImage;

}

@end
