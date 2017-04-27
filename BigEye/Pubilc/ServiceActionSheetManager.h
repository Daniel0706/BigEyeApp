//
//  ServiceActionSheetManager.h
//  deji
//
//  Created by 马杰 on 15/10/14.
//  Copyright © 2015年 angww. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LXActionSheet.h"

@interface ServiceActionSheetManager : NSObject<LXActionSheetDelegate,UINavigationControllerDelegate,UIImagePickerControllerDelegate>
@property(nonatomic,copy)void(^sendImageBlock)(UIImage *image,NSData *imgData);
@property(nonatomic ,weak )UIViewController *currentViewControll;
@property(nonatomic,assign)BOOL allowEdit;
@property (nonatomic, assign) long imageType;
@end
