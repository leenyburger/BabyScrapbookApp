//
//  ItemDetailViewController.h
////  babyMilestones
////
////  Created by Schnettler Family on 2/2/13.
////  Copyright (c) 2013 Schnettler Family. All rights reserved.
////
//
//#import <UIKit/UIKit.h>
//#import "DatePickerViewController.h"
//@class ItemDetailViewController;
//@class babyMilestone;
//
//@protocol ItemDetailViewControllerDelegate <NSObject>
//-(void) itemDetailViewControllerDidCancel: (ItemDetailViewController *)controller;
//-(void) itemDetailViewController:(ItemDetailViewController *)controller
//          didFinishAddingItem:(babyMilestone *)item;
//-(void) itemDetailViewController: (ItemDetailViewController *)controller didFinishEditingItem:(babyMilestone *)item;
//@end
//
//@interface ItemDetailViewController : UITableViewController <UITextFieldDelegate, UITextViewDelegate,
//    DatePickerViewControllerDelegate,
//    UIImagePickerControllerDelegate,
//    UINavigationControllerDelegate,
//    UIActionSheetDelegate>
//@property (strong, nonatomic) IBOutlet UITextField *textFieldName;
//@property (strong, nonatomic) IBOutlet UILabel *dateLabel;
//@property (strong, nonatomic) IBOutlet UILabel *photoLabel;
//@property (strong, nonatomic) IBOutlet UIBarButtonItem *saveBarButton;
//@property (strong, nonatomic) IBOutlet UITextView *descriptionTextView;
//@property (nonatomic, weak) id<ItemDetailViewControllerDelegate>delegate;
//@property (nonatomic, strong) babyMilestone *itemToEdit;
//@property (nonatomic, strong) IBOutlet UIImageView *imageView;
//-(IBAction)save;
//-(IBAction)cancel;
//
//@end
