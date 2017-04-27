//
//  AppendixCustomButton.m
//  CRWB
//
//  Created by CR-IOS on 16/4/22.
//  Copyright © 2016年 CR-IOS. All rights reserved.
//

#import "AppendixCustomButton.h"

@implementation AppendixCustomButton


-(CGRect)titleRectForContentRect:(CGRect)contentRect
{
    return CGRectMake(50, self.frame.size.height/2 - 15/2, contentRect.size.width, 15);
}

-(CGRect)imageRectForContentRect:(CGRect)contentRect
{
    return CGRectMake(15, self.frame.size.height/2 - 23/2, 30, 23);
}


@end
