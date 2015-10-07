//
//  FWCommonTools.m
//  FWMeituApp
//
//  Created by ForrestWoo on 15-10-6.
//  Copyright (c) 2015年 ForrestWoo co,.ltd. All rights reserved.
//

#import "FWCommonTools.h"

@implementation FWCommonTools

+ (NSDictionary *)getPlistDictionaryForButton
{
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"effectViewInfo" ofType:@"plist"];

    return [[NSDictionary alloc] initWithContentsOfFile:plistPath];;
}

@end
