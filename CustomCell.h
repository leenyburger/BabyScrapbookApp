//
//  CustomCell.h
//  babyMilestones
//
//  Created by silveroak on 2/12/14.
//  Copyright (c) 2014 Schnettler Family. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *thumbImage;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;

@end
