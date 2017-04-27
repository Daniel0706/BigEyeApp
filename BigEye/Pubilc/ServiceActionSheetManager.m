//
//  ServiceActionSheetManager.m
//  deji
//
//  Created by 马杰 on 15/10/14.
//  Copyright © 2015年 angww. All rights reserved.
//

#import "ServiceActionSheetManager.h"
#import "AppDelegate.h"
@implementation ServiceActionSheetManager

-(instancetype)init
{
    if (self=[super init]) {
        _allowEdit=YES;
    }
    return self;
}

-(void)didClickOnButtonIndex:(NSInteger *)buttonIndex
{
    if (0 == buttonIndex) {
        if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
        {
            [self performSelector:@selector(showCamera) withObject:nil afterDelay:0.3];
        }
    }
    else  if ((int)buttonIndex==1)
    {
        if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary])
        {
            UIImagePickerController * picker = [[UIImagePickerController alloc] init];
            picker.delegate = self;
            picker.allowsEditing = _allowEdit;
            picker.navigationController.navigationBar.hidden=YES;
            picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            [_currentViewControll presentViewController:picker animated:YES completion:nil];
        }
    }
    
}

-(void)dealloc
{


}


-(void)showCamera
{
    UIImagePickerController * picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = _allowEdit;
    picker.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    picker.modalPresentationStyle = UIModalPresentationCurrentContext;
    picker.sourceType =  UIImagePickerControllerSourceTypeCamera;
    picker.showsCameraControls=YES;
//    AppDelegate *delegate=(AppDelegate *)[[UIApplication sharedApplication]delegate];
//    [delegate.tabBarViewMember setHidden:YES];
    [_currentViewControll presentViewController:picker animated:YES completion:nil];

}




-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    UIImage *image;
    if (_allowEdit==NO) {
        image=[info objectForKey:UIImagePickerControllerOriginalImage];
    }
    else
    {
        image=[info objectForKey:UIImagePickerControllerEditedImage];
    }
    
    
    CGSize imagesize = image.size;
    //NSLog(@"image.size.height=%f, image.size.width=%f", image.size.height, image.size.width);
    
    float zoom = ScreenWidth / image.size.width;
    //NSLog(@"zoom=%f", zoom);
    imagesize.height = image.size.height * zoom;
    imagesize.width = image.size.width * zoom;
    //对图片大小进行压缩--
    image = [self imageWithImage:image scaledToSize:imagesize];
    
    NSData *pictureData;
    
    if (UIImagePNGRepresentation(image) == nil) {
        pictureData = UIImageJPEGRepresentation(image, 0.0000001);
    } else {
        pictureData = UIImagePNGRepresentation(image);
    }
    self.sendImageBlock(image,pictureData);
    [picker dismissViewControllerAnimated:YES completion:nil];
//    AppDelegate *delegate=(AppDelegate *)[[UIApplication sharedApplication]delegate];
//    [delegate.tabBarViewMember setHidden:NO];



}



-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:nil];
//    AppDelegate *delegate=(AppDelegate *)[[UIApplication sharedApplication]delegate];
//    [delegate.tabBarViewMember setHidden:NO];


}

-(UIImage*)imageWithImage:(UIImage*)image scaledToSize:(CGSize)newSize
{
    // Create a graphics image context
    UIGraphicsBeginImageContext(newSize);
    
    // Tell the old image to draw in this new context, with the desired
    // new size
    [image drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    
    // Get the new image from the context
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // End the context
    UIGraphicsEndImageContext();
    
    // Return the new image.
    return newImage;
}



@end
