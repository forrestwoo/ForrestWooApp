//
//  FWCropView.m
//  FWMeituApp
//
//  Created by ForrestWoo on 15-10-5.
//  Copyright (c) 2015年 ForrestWoo co,.ltd. All rights reserved.
//

#import "FWCropView.h"
#import "FWCropRectView.h"

@interface FWCropView ()

<UIScrollViewDelegate, UIGestureRecognizerDelegate>

@property (nonatomic) UIImageView *imageView;

@property (nonatomic) FWCropRectView *cropRectView;
@property (nonatomic) UIView *topOverlayView;
@property (nonatomic) UIView *leftOverlayView;
@property (nonatomic) UIView *rightOverlayView;
@property (nonatomic) UIView *bottomOverlayView;

@property (nonatomic) CGRect insetRect;
@property (nonatomic) CGRect editingRect;

@property (nonatomic, getter = isResizing) BOOL resizing;
@property (nonatomic) UIInterfaceOrientation interfaceOrientation;

@end

@implementation FWCropView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        
//        self.cropRectView = [[FWCropRectView alloc] initWithFrame:[self bounds]];
//        self.cropRectView.delegate = self;
//        self.cropRectView.showsGridMinor = YES;
//        [self addSubview:self.cropRectView];
    }
    
    return self;
}

#pragma mark -

//- (void)layoutSubviews
//{
//    [super layoutSubviews];
//
//    if (!self.image) {
//        return;
//    }
//
//    UIInterfaceOrientation interfaceOrientation = [[UIApplication sharedApplication] statusBarOrientation];
//    if (UIInterfaceOrientationIsPortrait(interfaceOrientation)) {
//        self.editingRect = CGRectInset(self.bounds, MarginLeft, MarginTop);
//    } else {
//        self.editingRect = CGRectInset(self.bounds, MarginLeft, MarginLeft);
//    }
//
//    if (!self.imageView) {
//        if (UIInterfaceOrientationIsPortrait(interfaceOrientation)) {
//            self.insetRect = CGRectInset(self.bounds, MarginLeft, MarginTop);
//        } else {
//            self.insetRect = CGRectInset(self.bounds, MarginLeft, MarginLeft);
//        }
//        NSLog(@"lay rect is %@", NSStringFromCGRect(self.insetRect));
//
//        [self setupImageView];
//    }
//
//    if (!self.isResizing) {
//        [self layoutCropRectViewWithCropRect:self.scrollView.frame];
//
//        if (self.interfaceOrientation != interfaceOrientation) {
//            [self zoomToCropRect:self.scrollView.frame];
//        }
//    }
//
//    self.interfaceOrientation = interfaceOrientation;
//}

- (void)layoutCropRectViewWithCropRect:(CGRect)cropRect
{
    self.cropRectView.frame = cropRect;
    [self layoutOverlayViewsWithCropRect:cropRect];
}

- (void)layoutOverlayViewsWithCropRect:(CGRect)cropRect
{
    self.topOverlayView.frame = CGRectMake(0.0f,
                                           0.0f,
                                           CGRectGetWidth(self.bounds),
                                           CGRectGetMinY(cropRect));
    self.leftOverlayView.frame = CGRectMake(0.0f,
                                            CGRectGetMinY(cropRect),
                                            CGRectGetMinX(cropRect),
                                            CGRectGetHeight(cropRect));
    self.rightOverlayView.frame = CGRectMake(CGRectGetMaxX(cropRect),
                                             CGRectGetMinY(cropRect),
                                             CGRectGetWidth(self.bounds) - CGRectGetMaxX(cropRect),
                                             CGRectGetHeight(cropRect));
    self.bottomOverlayView.frame = CGRectMake(0.0f,
                                              CGRectGetMaxY(cropRect),
                                              CGRectGetWidth(self.bounds),
                                              CGRectGetHeight(self.bounds) - CGRectGetMaxY(cropRect));
}

- (void)setupImageView
{
    CGRect cropRect = AVMakeRectWithAspectRatioInsideRect(self.image.size, self.insetRect);
//    NSLog(@"cropRect rect is %@", NSStringFromCGRect(cropRect));
//    NSLog(@"image size is %@,insetRect:%@", NSStringFromCGSize(self.image.size), NSStringFromCGRect(self.insetRect));
    
    self.imageView = [[UIImageView alloc] initWithFrame:[self bounds]];
    self.imageView.backgroundColor = [UIColor clearColor];
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
    self.imageView.image = self.image;
    NSLog(@"image size is %@,insetRect:%@", NSStringFromCGSize(self.image.size), NSStringFromCGRect(self.imageView.frame));

    [self addSubview:self.imageView];
}

#pragma mark -

//- (void)setAspectRatio:(CGFloat)aspectRatio
//{
//    CGRect cropRect = self.scrollView.frame;
//    CGFloat width = CGRectGetWidth(cropRect);
//    CGFloat height = CGRectGetHeight(cropRect);
//    if (width < height) {
//        width = height * aspectRatio;
//    } else {
//        height = width * aspectRatio;
//    }
//    cropRect.size = CGSizeMake(width, height);
//    [self zoomToCropRect:cropRect];
//}
//
//- (CGFloat)aspectRatio
//{
//    CGRect cropRect = self.scrollView.frame;
//    CGFloat width = CGRectGetWidth(cropRect);
//    CGFloat height = CGRectGetHeight(cropRect);
//    return width / height;
//}
//
//- (void)setCropRect:(CGRect)cropRect
//{
//    [self zoomToCropRect:cropRect];
//}
//
//- (CGRect)cropRect
//{
//    return self.scrollView.frame;
//}
//
//- (UIImage *)croppedImage
//{
//    CGRect cropRect = [self convertRect:self.scrollView.frame toView:self.zoomingView];
//    CGSize size = self.image.size;
//
//    CGFloat ratio = 1.0f;
//    UIInterfaceOrientation orientation = [[UIApplication sharedApplication] statusBarOrientation];
//    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad || UIInterfaceOrientationIsPortrait(orientation)) {
//        ratio = CGRectGetWidth(AVMakeRectWithAspectRatioInsideRect(self.image.size, self.insetRect)) / size.width;
//    } else {
//        ratio = CGRectGetHeight(AVMakeRectWithAspectRatioInsideRect(self.image.size, self.insetRect)) / size.height;
//    }
//
//    CGRect zoomedCropRect = CGRectMake(cropRect.origin.x / ratio,
//                                       cropRect.origin.y / ratio,
//                                       cropRect.size.width / ratio,
//                                       cropRect.size.height / ratio);
//
//    UIImage *rotatedImage = [self rotatedImageWithImage:self.image transform:self.imageView.transform];
//
//    CGImageRef croppedImage = CGImageCreateWithImageInRect(rotatedImage.CGImage, zoomedCropRect);
//    UIImage *image = [UIImage imageWithCGImage:croppedImage scale:1.0f orientation:rotatedImage.imageOrientation];
//    CGImageRelease(croppedImage);
//
//    return image;
//}

- (UIImage *)rotatedImageWithImage:(UIImage *)image transform:(CGAffineTransform)transform
{
    CGSize size = image.size;
    
    UIGraphicsBeginImageContext(size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextTranslateCTM(context, size.width / 2, size.height / 2);
    CGContextConcatCTM(context, transform);
    CGContextTranslateCTM(context, size.width / -2, size.height / -2);
    [image drawInRect:CGRectMake(0.0f, 0.0f, size.width, size.height)];
    
    UIImage *rotatedImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return rotatedImage;
}

//- (CGRect)cappedCropRectInImageRectWithCropRectView:(FWCropRectView *)cropRectView
//{
//    CGRect cropRect = cropRectView.frame;
//
//    CGRect rect = [self convertRect:cropRect toView:self.scrollView];
//    if (CGRectGetMinX(rect) < CGRectGetMinX(self.zoomingView.frame)) {
//        cropRect.origin.x = CGRectGetMinX([self.scrollView convertRect:self.zoomingView.frame toView:self]);
//        cropRect.size.width = CGRectGetMaxX(rect);
//    }
//    if (CGRectGetMinY(rect) < CGRectGetMinY(self.zoomingView.frame)) {
//        cropRect.origin.y = CGRectGetMinY([self.scrollView convertRect:self.zoomingView.frame toView:self]);
//        cropRect.size.height = CGRectGetMaxY(rect);
//    }
//    if (CGRectGetMaxX(rect) > CGRectGetMaxX(self.zoomingView.frame)) {
//        cropRect.size.width = CGRectGetMaxX([self.scrollView convertRect:self.zoomingView.frame toView:self]) - CGRectGetMinX(cropRect);
//    }
//    if (CGRectGetMaxY(rect) > CGRectGetMaxY(self.zoomingView.frame)) {
//        cropRect.size.height = CGRectGetMaxY([self.scrollView convertRect:self.zoomingView.frame toView:self]) - CGRectGetMinY(cropRect);
//    }
//
//    return cropRect;
//}

//- (void)automaticZoomIfEdgeTouched:(CGRect)cropRect
//{
//    if (CGRectGetMinX(cropRect) < CGRectGetMinX(self.editingRect) - 5.0f ||
//        CGRectGetMaxX(cropRect) > CGRectGetMaxX(self.editingRect) + 5.0f ||
//        CGRectGetMinY(cropRect) < CGRectGetMinY(self.editingRect) - 5.0f ||
//        CGRectGetMaxY(cropRect) > CGRectGetMaxY(self.editingRect) + 5.0f) {
//        [UIView animateWithDuration:1.0
//                              delay:0.0
//                            options:UIViewAnimationOptionBeginFromCurrentState
//                         animations:^{
//                             [self zoomToCropRect:self.cropRectView.frame];
//                         } completion:^(BOOL finished) {
//
//                         }];
//    }
//}

#pragma mark -
//
//- (void)cropRectViewDidBeginEditing:(FWCropRectView *)cropRectView
//{
//    self.resizing = YES;
//}
//
//- (void)cropRectViewEditingChanged:(FWCropRectView *)cropRectView
//{
//    CGRect cropRect = [self cappedCropRectInImageRectWithCropRectView:cropRectView];
//
//    [self layoutCropRectViewWithCropRect:cropRect];
//
//    [self automaticZoomIfEdgeTouched:cropRect];
//}
//
//- (void)cropRectViewDidEndEditing:(FWCropRectView *)cropRectView
//{
//    self.resizing = NO;
//    [self zoomToCropRect:self.cropRectView.frame];
//}
//
//- (void)zoomToCropRect:(CGRect)toRect
//{
//    if (CGRectEqualToRect(self.scrollView.frame, toRect)) {
//        return;
//    }
//
//    CGFloat width = CGRectGetWidth(toRect);
//    CGFloat height = CGRectGetHeight(toRect);
//
//    CGFloat scale = MIN(CGRectGetWidth(self.editingRect) / width, CGRectGetHeight(self.editingRect) / height);
//
//    CGFloat scaledWidth = width * scale;
//    CGFloat scaledHeight = height * scale;
//    CGRect cropRect = CGRectMake((CGRectGetWidth(self.bounds) - scaledWidth) / 2,
//                                 (CGRectGetHeight(self.bounds) - scaledHeight) / 2,
//                                 scaledWidth,
//                                 scaledHeight);
//
//    CGRect zoomRect = [self convertRect:toRect toView:self.zoomingView];
//    zoomRect.size.width = CGRectGetWidth(cropRect) / (self.scrollView.zoomScale * scale);
//    zoomRect.size.height = CGRectGetHeight(cropRect) / (self.scrollView.zoomScale * scale);
//
//    [UIView animateWithDuration:0.25
//                          delay:0.0
//                        options:UIViewAnimationOptionBeginFromCurrentState
//                     animations:^{
//                         self.scrollView.bounds = cropRect;
//                         [self.scrollView zoomToRect:zoomRect animated:NO];
//
//                         [self layoutCropRectViewWithCropRect:cropRect];
//                     } completion:^(BOOL finished) {
//
//                     }];
//}

@end
