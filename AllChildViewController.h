//
//  AllChildViewController.h
//  babyMilestones
//
//  Created by silveroak on 7/22/15.
//  Copyright (c) 2015 Schnettler Family. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DataModel;
@interface AllChildViewController : UICollectionViewController
@property(nonatomic,strong) DataModel *dataModel;
@end
