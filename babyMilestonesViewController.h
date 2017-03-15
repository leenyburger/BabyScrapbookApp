//
//  babyMilestonesViewController.h
//  babyMilestones
//
//  Created by Schnettler Family on 1/27/13.
//  Copyright (c) 2013 Schnettler Family. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MilestoneViewController.h"
#import "EditItemViewController.h"
#import "CustomIOS7AlertView.h"
#import "CMPopTipView.h"
#import "DataModel.h"
#import "AddChildViewController.h"

@class Child;
@interface babyMilestonesViewController:UIViewController
<UICollectionViewDataSource, UICollectionViewDelegate, EditItemViewControllerDelegate, CustomIOS7AlertViewDelegate, CMPopTipViewDelegate>
@property(nonatomic,strong) Child *childSelected;
//@property(nonatomic,strong) DataModel *dataModel; //Needs to be sent from AppDelegate
@property (weak, nonatomic) IBOutlet UICollectionView *babyCollectionView;
- (IBAction)launchDialog:(id)sender;
- (IBAction)createBabyBook:(id)sender;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *sidebarButton;
@property(nonatomic,strong) DataModel *dataModel;


@end
