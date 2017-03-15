//
//  AddChildViewController.m
//  babyMilestones
//
//  Created by silveroak on 8/3/15.
//  Copyright (c) 2015 Schnettler Family. All rights reserved.
//

#import "AddChildViewController.h"
#import "Child.h"
#import "BabyMilestone.h"
#import "SWRevealViewController.h"
#import "babyMilestonesViewController.h"
#import "AllChildViewController.h"
#import <UIKit/UIKit.h>
#import "ChildNavigation.h"
#import <QuartzCore/QuartzCore.h>
#import <UIImage+Resize.h>
#import "UIImage+ResizeMagick.h"


@implementation AddChildViewController{
    NSDate *dueDate;
      UIImage *image; //Image the user has selected
}

- (IBAction)changeBirthDate:(id)sender {
    [self createPicker];
}

-(void)viewDidLoad{
    [super viewDidLoad];
    if (self.childToEdit !=nil){    //If the user is editing an existing child, update accordingly
        self.title = self.childToEdit.name;
        if ([self.childToEdit hasPhoto]){
            self.childPhoto.image = [self.childToEdit photoImage];
        }
        dueDate = self.childToEdit.birthday;
        [self updateDueDateLabel];
        self.childName.text = self.childToEdit.name;
    }
    else {
    self.title = @"BABY'S SCRAPBOOK";
    }
}

- (IBAction)save:(id)sender {
    if (self.childToEdit == nil) { //This is a new entry
        NSLog(@"New Child"); 
        Child *child;
        child.childPhotoId = @-1; //Created a new child, no photo ID
        child = [[Child alloc] init];
        child.name = self.childName.text;
        child.birthday = dueDate;
        [child scheduleNotification];
        if (image !=nil) { //(the user picked an image or took an image with the camera
            if(![child hasPhoto]){ //If the itemToEdit does not already have a photo
                child.childPhotoId = @([Child nextPhotoId]);
                NSLog(@"Child Photo ID is %@", child.childPhotoId);
            }
            NSData *data = UIImageJPEGRepresentation(image,.5);
            NSError *error;
            if(![data writeToFile:[child photoPath] options :NSDataWritingAtomic error:&error]) {
                NSLog(@"Error writing file: %@", error);
            }
        }
        babyMilestone *babyItem;
        babyItem = [[babyMilestone alloc] init];
        babyItem.text = @"Arrives Home";
        babyItem.imageName = @"welcomeHomeIcon";
        babyItem.textDescription = nil;
        babyItem.newItem = NO;
        babyItem.date = nil;
        babyItem.nativeItem = YES;
        babyItem.photoID = @-1;
        [child.items addObject:babyItem];
        
        babyItem = [[babyMilestone alloc] init];
        babyItem.text = @"First Bath";
        babyItem.imageName = @"firstBathIcon";
        babyItem.textDescription = nil;
        babyItem.newItem = NO;
        babyItem.date = nil;
        babyItem.nativeItem = YES;
        babyItem.photoID = @-1;
        [child.items addObject:babyItem];
        
        babyItem = [[babyMilestone alloc] init];
        babyItem.text = @"Rolls Over";
        babyItem.imageName = @"rollsOverIcon";
        babyItem.textDescription = nil;
        babyItem.newItem = NO;
        babyItem.date = nil;
        babyItem.nativeItem = YES;
        babyItem.photoID = @-1;
        [child.items addObject:babyItem];
        
        babyItem = [[babyMilestone alloc] init];
        babyItem.text = @"Crawls";
        babyItem.imageName = @"crawlsIcon";
        babyItem.textDescription = nil;
        babyItem.newItem = NO;
        babyItem.date = nil;
        babyItem.nativeItem = YES;
        babyItem.photoID = @-1;
        [child.items addObject:babyItem];
        
        babyItem = [[babyMilestone alloc] init];
        babyItem.text = @"First Steps";
        babyItem.imageName = @"firstStepsIcon";
        babyItem.textDescription = nil;
        babyItem.newItem = NO;
        babyItem.date = nil;
        babyItem.nativeItem = YES;
        babyItem.photoID = @-1;
        [child.items addObject:babyItem];
        
        babyItem = [[babyMilestone alloc] init];
        babyItem.text = @"First Food";
        babyItem.imageName = @"firstFoodIcon";
        babyItem.textDescription = nil;
        babyItem.newItem = NO;
        babyItem.date = nil;
        babyItem.nativeItem = YES;
        babyItem.photoID = @-1;
        [child.items addObject:babyItem];
        
        [self.dataModel.children addObject:child];
      [self performSegueWithIdentifier:@"AddChild" sender:nil];
    }
    else {
        self.childToEdit.name = self.childName.text;  //To send back to BMVC
        self.childToEdit.birthday = dueDate;
        [self.childToEdit scheduleNotification];
            if (image !=nil) { //(the user picked an image or took an image with the camera
                if(![self.childToEdit hasPhoto]){ //If the itemToEdit does not already have a photo
                    self.childToEdit.childPhotoId = @([Child nextPhotoId]);
                    NSLog(@"Child Photo ID is %@", self.childToEdit.childPhotoId);
                }
                NSData *data = UIImageJPEGRepresentation(image,.5);
                NSError *error;
                if(![data writeToFile:[self.childToEdit photoPath] options :NSDataWritingAtomic error:&error]) {
                    NSLog(@"Error writing file: %@", error);
                }

            }
        //[self.delegate addChildViewController:self didFinishEditingItem:self.childToEdit];
        [self performSegueWithIdentifier:@"EditChild" sender:nil];
    }
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender    //Send dataModel to both front and rear view controllers 
{
    SWRevealViewController *swviewcontroller =segue.destinationViewController;
    [swviewcontroller loadView];    //Force the view to load to assign the frontViewController property
    UINavigationController *navController = (UINavigationController *)swviewcontroller.frontViewController;
  
    if ([segue.identifier isEqualToString:@"AddChild"]) {
        babyMilestonesViewController *controller = navController.viewControllers[0];
        controller.childSelected = [self.dataModel.children objectAtIndex:(self.dataModel.children.count -1)];  //Send the last added child
        controller.dataModel = self.dataModel;
    }
    else if ([segue.identifier isEqualToString:@"EditChild"]){
        babyMilestonesViewController *controller = navController.viewControllers[0];
        controller.childSelected = self.childToEdit;  //Send the last added child
        controller.dataModel = self.dataModel;
    }
    ChildNavigation *navMenu = (ChildNavigation *)swviewcontroller.rearViewController;
    navMenu.dataModel = self.dataModel;
  
    
}

-(void) createPicker
{
    _actionSheetPicker = [[ActionSheetDatePicker alloc] initWithTitle:@"Birthday (or due date)" datePickerMode:UIDatePickerModeDate selectedDate:[NSDate date]target:self action:@selector(dateWasSelected:element:) origin:self.view];
    
    [self.actionSheetPicker showActionSheetPicker];
}
- (void)dateWasSelected:(NSDate *)selectedDate element:(id)element;
{   dueDate = selectedDate;
    [self updateDueDateLabel];
}

-(void)updateDueDateLabel
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterLongStyle];
    [formatter setTimeStyle:NSDateFormatterNoStyle];
    self.birthDate.text = [formatter stringFromDate:dueDate];
}




- (IBAction)changePhoto:(id)sender {
    [self showPhotoMenu];
    NSLog(@"Trying to change the photo"); 
}

//Show Photo Menu

-(void)showPhotoMenu
{
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        UIActionSheet *actionSheet = [[UIActionSheet alloc]
                                      initWithTitle:nil
                                      delegate:self
                                      cancelButtonTitle:@"Cancel"
                                      destructiveButtonTitle:nil
                                      otherButtonTitles: @"Choose From Library", @"Take Photo", nil];
        [actionSheet showInView:self.view];
    }
    else {
        [self choosePhotoFromLibrary];
    }
}
//Take Photo
-(void)takePhoto
{
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    imagePicker.sourceType= UIImagePickerControllerSourceTypeCamera;
    imagePicker.delegate=self;
    imagePicker.allowsEditing=NO;
    [self presentViewController:imagePicker animated:YES completion:nil];
    
}

-(void)choosePhotoFromLibrary
{
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    imagePicker.delegate = self;
    imagePicker.allowsEditing = NO;
    [self presentViewController:imagePicker animated:YES completion:nil];
}

////Methods required for image picker to work correctly (My Locations Part 2 Page 110)
#pragma mark - UIImagePickerControllerDelegate

-(void)imagePickerController: (UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    if ([self isViewLoaded]) {
        image = [info objectForKey: UIImagePickerControllerOriginalImage];
        self.childPhoto.contentMode = UIViewContentModeCenter;
            //Set layers to create round photo
        //image = [image resizedImageWithBounds:CGSizeMake(200, 200)];
        //image = [image croppedImageWithRect:CGRectMake(0, 0, 150, 150)];
        image = [image resizedImageByMagick:@"150x150#"];
        [self createRoundPhoto:image];
        self.childPhoto.image = image;
        }
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)createRoundPhoto:(UIImage *)imageToView
{
    self.childPhoto.layer.cornerRadius = imageToView.size.width/2;
    [self.childPhoto.layer setBorderColor:[[UIColor whiteColor] CGColor]];
    [self.childPhoto.layer setBorderWidth:2.0];
    [self.childPhoto.layer setMasksToBounds:YES]; 
    
}
-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self dismissViewControllerAnimated:YES completion:nil];
    
}



@end
