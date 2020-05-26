//
//  UIImage+YHWebImage.h
//  Pods
//
//  Created by eybond on 2020/5/26.
//



#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (YHWebImage)


#pragma mark - SVG图片使用 -
/// 加载一张SVG图片
/// @param name 图片资源名
/// @param size 需要的图片大小
/// @param tintColor 需要的图片颜色
+ (UIImage *)svgImageNamed:(NSString *)name
                      size:(CGSize)size
                 tintColor:(UIColor *)tintColor;

/// 加载一张正方形SVG图片
/// @param name 图片资源名
/// @param size 需要的图片大小（宽高）
/// @param tintColor 需要的图片颜色
+ (UIImage *)svgImageNamed:(NSString *)name
                    sizewh:(CGFloat)size
                 tintColor:(UIColor *)tintColor;
#pragma mark --------------




@end

NS_ASSUME_NONNULL_END
