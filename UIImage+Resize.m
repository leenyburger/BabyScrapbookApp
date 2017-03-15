//
//  UIImage+Resize.m
//  babyMilestones
//
//  Created by Schnettler Family on 2/22/13.
//  Copyright (c) 2013 Schnettler Family. All rights reserved.
//

#import "UIImage+Resize.h"
#import <Social/Social.h>

@implementation UIImage (Resize)

-(UIImage *)resizedImageWithBounds:(CGSize)bounds { //Maintains aspect ratio
    CGFloat horizontalRatio = bounds.width / self.size.width;
    CGFloat verticalRatio = bounds.height / self.size.height;
    CGFloat ratio = MIN(horizontalRatio, verticalRatio);
    CGSize newSize = CGSizeMake(self.size.width * ratio, self.size.height * ratio
                                );
    
    UIGraphicsBeginImageContextWithOptions(newSize, YES, 0);
    [self drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
    
    //Now need to add cropping
}

- (UIImage*) croppedImageWithRect: (CGRect) rect {  //crops 
    
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGRect drawRect = CGRectMake(-rect.origin.x, -rect.origin.y, self.size.width, self.size.height);
    CGContextClipToRect(context, CGRectMake(0, 0, rect.size.width, rect.size.height));
    [self drawInRect:drawRect];
    UIImage* subImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return subImage;
}


-(UIImage *)resizedImageNoScaling:(CGSize)bounds {
    CGSize newSize = CGSizeMake(bounds.width, bounds.height);
    UIGraphicsBeginImageContextWithOptions(newSize, YES, 0);
    [self drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}
@end

