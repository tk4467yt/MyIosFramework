//
//  MyUtility.m
//  xbb
//
//  Created by  qin on 2017/3/3.
//  Copyright © 2017年  qin. All rights reserved.
//

#import "MyUtility.h"

@implementation MyUtility

+(UIImage *)makeMaskImageFroFrame:(UIImage *)img2use
{
    return [img2use resizableImageWithCapInsets:UIEdgeInsetsMake(30, 30, 30, 30) resizingMode:UIImageResizingModeStretch];
}

+(BOOL)isStringNilOrZeroLength:(NSString *)str2check
{
    return nil == str2check || str2check == NULL || [str2check isKindOfClass:[NSNull class]] || str2check.length == 0;
}

+(void)pushViewControllerFromNav:(UINavigationController *)navVC withTargetVC:(UIViewController *)targetVC animated:(BOOL)anim
{
    targetVC.hidesBottomBarWhenPushed=true;
    [navVC pushViewController:targetVC animated:anim];
}

+(CGFloat)screenWidth
{
    return [UIScreen mainScreen].bounds.size.width;
}
+(CGFloat)screenHeight
{
    return [UIScreen mainScreen].bounds.size.height;
}
+(CGFloat)heightOfStatusBar
{
    CGRect rectStatus = [[UIApplication sharedApplication] statusBarFrame];
    
    return rectStatus.size.height;
}

+(CGFloat)layoutMarginForLeftAndRightForView:(UIView *)view2check
{
    return view2check.layoutMargins.left+view2check.layoutMargins.right;
}

+(void)applyMaskImageToImageView:(UIImageView *)iv2mask withImage:(UIImage *)img2mask
{
    CALayer* maskLayer = [CALayer layer];
    maskLayer.frame = CGRectMake(0, 0, iv2mask.frame.size.width, iv2mask.frame.size.height);
    maskLayer.contents = (id)[img2mask CGImage];
    [iv2mask.layer setMask:maskLayer];
    iv2mask.layer.masksToBounds=true;
}

+ (CGFloat)getLabelHeightByWidth:(CGFloat)width title:(NSString *)title font:(UIFont*)font
{
    static UILabel *label = nil;
    if (nil == label) {
        label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    }
    label.frame=CGRectMake(0, 0, width, 0);
    label.text = title;
    label.font = font;
    label.numberOfLines = 0;
    [label sizeToFit];
    
    CGFloat height = label.frame.size.height;
    return height;
}

@end