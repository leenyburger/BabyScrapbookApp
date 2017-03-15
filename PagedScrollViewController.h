//
//  PagedScrollViewController.h
//  babyMilestones
//
//  Created by Schnettler Family on 2/22/13.
//  Copyright (c) 2013 Schnettler Family. All rights reserved.
//

#import <UIKit/UIKit.h>
@class babyMilestone;

@interface PagedScrollViewController : UIViewController <UIScrollViewDelegate>

@property (nonatomic, strong) IBOutlet UIScrollView *scrollView;
@property (nonatomic, strong) IBOutlet UIPageControl *pageControl;
//@property (nonatomic, strong) NSMutableArray *itemsToDisplay;


@end
