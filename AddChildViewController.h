//
//  AddChildViewController.h
//  babyMilestones
//
//  Created by silveroak on 8/3/15.
//  Copyright (c) 2015 Schnettler Family. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataModel.h"
#import "ActionSheetDatePicker.h"
#import "Child.h"

@class AddChildViewController;

@protocol AddChildViewControllerDelegate <NSObject>

-(void) addChildViewController: (AddChildViewController *)controller didFinishEditingItem:(Child *)childToUpdate;

@end

@interface AddChildViewController : UIViewController <UITextFieldDelegate, UIActionSheetDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate >
@property (weak, nonatomic) IBOutlet UITextField *childName;
@property(nonatomic,strong) DataModel *dataModel;
//@property(nonatomic, weak)id<AddChildViewControllerDelegate> delegate;

- (IBAction)save:(id)sender;

@property (nonatomic, strong)ActionSheetDatePicker *actionSheetPicker;
@property (weak, nonatomic) IBOutlet UILabel *birthDate;
@property (weak, nonatomic) IBOutlet UIImageView *childPhoto;
@property(nonatomic,strong) Child *childToEdit;
- (IBAction)changePhoto:(id)sender;





@end
