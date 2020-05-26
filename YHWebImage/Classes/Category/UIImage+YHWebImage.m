//
//  UIImage+YHWebImage.m
//  Pods
//
//  Created by eybond on 2020/5/26.
//

#import "UIImage+YHWebImage.h"
#import "SVGKit.h"


@implementation UIImage (YHWebImage)

#pragma mark - SVG图片使用 -
/// 加载一张SVG图片
/// @param name 图片资源名
/// @param size 需要的图片大小
/// @param tintColor 需要的图片颜色
+ (UIImage *)svgImageNamed:(NSString *)name
                      size:(CGSize)size
                 tintColor:(UIColor *)tintColor {
    
    // 若文件不存在
    NSString *imgPath = [[NSBundle mainBundle] pathForResource:name ofType:@"svg"];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (name.length <= 0 || ![fileManager fileExistsAtPath:imgPath]) {
        return nil;
    }
    
    // 若文件存在就继续
    SVGKImage *svgImage = [SVGKImage imageNamed:name];
    svgImage.size = size;
    CGRect rect = CGRectMake(0, 0, svgImage.size.width, svgImage.size.height);
    CGImageAlphaInfo alphaInfo = CGImageGetAlphaInfo(svgImage.UIImage.CGImage);
    BOOL opaque = alphaInfo == kCGImageAlphaNoneSkipLast || alphaInfo == kCGImageAlphaNoneSkipFirst || alphaInfo == kCGImageAlphaNone;
    UIGraphicsBeginImageContextWithOptions(svgImage.size, opaque, svgImage.scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextTranslateCTM(context, 0, svgImage.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    CGContextSetBlendMode(context, kCGBlendModeNormal);
    CGContextClipToMask(context, rect, svgImage.UIImage.CGImage);
    CGContextSetFillColorWithColor(context, tintColor.CGColor);
    CGContextFillRect(context, rect);
    UIImage *imageOut = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return imageOut;
}

/// 加载一张正方形SVG图片
/// @param name 图片资源名
/// @param size 需要的图片大小（宽高）
/// @param tintColor 需要的图片颜色
+ (UIImage *)svgImageNamed:(NSString *)name
                    sizewh:(CGFloat)size
                 tintColor:(UIColor *)tintColor {
    return [self svgImageNamed:name size:CGSizeMake(size, size) tintColor:tintColor];
}
#pragma mark --------------

@end
