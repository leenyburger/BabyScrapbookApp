//
//  ChildCell.h
//  babyMilestones
//
//  Created by silveroak on 7/22/15.
//  Copyright (c) 2015 Schnettler Family. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChildCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *childPicture;
@property (weak, nonatomic) IBOutlet UILabel *childName;
@property (weak, nonatomic) IBOutlet UILabel *childBirthday;

@end
