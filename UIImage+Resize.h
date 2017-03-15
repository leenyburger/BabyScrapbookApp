//
//  UIImage+Resize.h
//  babyMilestones
//
//  Created by Schnettler Family on 2/22/13.
//  Copyright (c) 2013 Schnettler Family. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Resize)
-(UIImage *)resizedImageWithBounds:(CGSize)bounds;
-(UIImage *)resizedImageNoScaling:(CGSize)bounds;
-(UIImage *)croppedImageWithRect:(CGRect)rect; 
@end
