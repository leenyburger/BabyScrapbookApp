////
////  MilestoneViewController.h
////  babyMilestones
////
////  Created by silveroak on 3/22/13.
////  Copyright (c) 2013 Schnettler Family. All rights reserved.
////
//
//#import <UIKit/UIKit.h>
//
//
//@class MilestoneViewController;
//@class babyMilestone;
//
////Protocol methods that are implemented in BabyMilestoneViewController
//@protocol MilestoneViewControllerDelegate <NSObject>
//-(void) milestoneViewControllerDidCancel:(MilestoneViewController *)controller;
//-(void) milestoneViewController:(MilestoneViewController *)controller didFinishEditingItem:(babyMilestone *)item;
//@end
//
//@interface MilestoneViewController : UIViewController//<UITextFieldDelegate,
//<UITextViewDelegate,
//UIImagePickerControllerDelegate,
//UINavigationControllerDelegate,
//UIActionSheetDelegate,
//UIScrollViewDelegate>
//
//
//@property (strong, nonatomic) IBOutlet UIImageView *facebookShare;
//@property (nonatomic, strong)IBOutlet UIScrollView *scrollView;
//@property (strong, nonatomic) IBOutlet UITextField *textField;
//@property (strong, nonatomic) IBOutlet UIImageView *imageView1;
//@property (strong, nonatomic) IBOutlet UIImageView *imageView2;
//@property (strong, nonatomic) IBOutlet UIImageView *imageView3;
//@property (strong, nonatomic) IBOutlet UILabel *dateLabel;
//@property (strong, nonatomic) IBOutlet UITextView *notes;
//
////This property is added so we can send it messages from within the view controller in order to enable or disable it (Checklist Part 1 114)
//@property (strong, nonatomic) IBOutlet UIBarButtonItem *saveBarButton;
//
////The view controller must have a property that it can use to refer to the delegate
//@property (nonatomic, weak) id<MilestoneViewControllerDelegate> delegate;
//@property (nonatomic, strong) babyMilestone *itemToEdit;
//
//
//-(IBAction) cancel;
//-(IBAction) save;
////-(IBAction) changeDate;
//-(int)nextPhotoId1;
//-(int)nextPhotoId2;
//-(int)nextPhotoId3;
//-(void)deletePhoto; 
//- (IBAction)handleTap:(UITapGestureRecognizer *)recognizer;
//@end
//
//
