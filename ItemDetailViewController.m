//
//  AddItemViewController.m
////  babyMilestones
////
////  Created by Schnettler Family on 2/2/13.
////  Copyright (c) 2013 Schnettler Family. All rights reserved.
////
//
//#import "ItemDetailViewController.h"
//#import "babyMilestone.h"
//
//@implementation ItemDetailViewController {
//    NSDate *dueDate;
//    UIImage *image;
//}
//
//-(void)updateDueDateLabel
//{
//    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
//    [formatter setDateStyle:NSDateFormatterMediumStyle];
//    //[formatter setTimeStyle:NSDateFormatterShortStyle];
//    self.dateLabel.text = [formatter stringFromDate:dueDate];
//}
//
////Add the image the User either selected or took to the View Controller.  MyLocations Part 2 page 123
//-(void)showImage:(UIImage *)theImage
//{
//    self.imageView.image = theImage;
//    self.imageView.hidden= NO;
//    self.imageView.frame = CGRectMake (10,10,260,260);
//    self.photoLabel.hidden=YES;
//}
//
//- (void)viewDidLoad
//{ /******Updated 3/20 to show accomplishment in title bar and hide title label*********/
//    [super viewDidLoad];
//    //If the user is editing an existing entry
//    if (self.itemToEdit !=nil){
//        self.title = self.itemToEdit.text;
//        //self.textFieldName.text = self.itemToEdit.text;
//        self.textFieldName.hidden = YES;
//        self.descriptionTextView.text = self.itemToEdit.textDescription;
//        self.saveBarButton.enabled= YES;
//        
//        //Load the picture, if it has been taken previously - My Locations Part 2
//        if([self.itemToEdit hasPhoto] && image ==nil) {
//            UIImage *existingImage = [self.itemToEdit photoImage];
//            if (existingImage !=nil) {
//                [self showImage:existingImage];
//            }
//        }
//        
//        if (self.itemToEdit.date!=nil){
//            dueDate = self.itemToEdit.date;
//        }
//        else{
//            dueDate = [NSDate date];
//        }
//    } else{
//        dueDate=[NSDate date];
//    }
//    if (image!=nil) {
//        [self showImage:image];
//        NSLog(@"Image is not nil");
//    }
//    [self updateDueDateLabel];
//    
//    UITapGestureRecognizer *gestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideKeyboard:)];
//    gestureRecognizer.cancelsTouchesInView=NO;
//    [self.tableView addGestureRecognizer:gestureRecognizer];
//}
//
//- (void)didReceiveMemoryWarning
//{
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//    if([self isViewLoaded]&&self.view.window==nil)  {
//        self.view=nil;
//    }
//    if (![self isViewLoaded]) {
//        self.dateLabel = nil;
//        self.descriptionTextView = nil;
//        self.imageView = nil;
//        self.photoLabel = nil;
//        self.textFieldName = nil;
//    }
//}
//- (void)viewDidUnload {
//    [self setTextFieldName:nil];
//    [self setSaveBarButton:nil];
//    [self setDateLabel:nil];
//    [self setPhotoLabel:nil];
//    [super viewDidUnload];
//}
//#pragma mark - Table view data source
//-(IBAction)cancel
//{
//    [self.delegate itemDetailViewControllerDidCancel:self];
//}
//
//-(int)nextPhotoId
//{
//    int photoId = [[NSUserDefaults standardUserDefaults] integerForKey:@"PhotoID"];
//    [[NSUserDefaults standardUserDefaults] setInteger:photoId+1 forKey:@"PhotoID"];
//    [[NSUserDefaults standardUserDefaults] synchronize];
//    return photoId;
//}
//
//-(IBAction)save
//{
//    if (self.itemToEdit==nil){
//    babyMilestone *item = [[babyMilestone alloc ]init];
//        //textField = label, imageView1, imageView2, imageView .  dateLabel is date, and notes is textview
//    item.text = self.textFieldName.text;
//    item.textDescription= self.descriptionTextView.text;
//    item.date=dueDate;
//    item.photoID = [NSNumber numberWithInt:-1];
//        NSLog(@"Item photo ID %@", item.photoID);
//        
//        //the user picked an image or taken an image with the camera.  image = image user has taken (method below)
//    if (image !=nil) {
//        if(![item hasPhoto]){ //If the itemToEdit does not already have a photo
//            item.photoID = [NSNumber numberWithInt:[self nextPhotoId]];
//            }
//        NSData *data = UIImagePNGRepresentation(image);
//        NSError *error;
//        
//        if(![data writeToFile:[item photoPath] options :NSDataWritingAtomic error:&error]) {
//            NSLog(@"Error writing file: %@", error);
//            }
//        }
//    [self.delegate itemDetailViewController:self didFinishAddingItem:item];
//        }
//    else{
//        self.itemToEdit.text=self.textFieldName.text;
//        self.itemToEdit.textDescription=self.descriptionTextView.text;
//        self.itemToEdit.date=dueDate;
//        //Save date and pictures to object HERE
//        if (image !=nil) { //(the user picked an image or took an image with the camera
//            if(![self.itemToEdit hasPhoto]){ //If the itemToEdit does not already have a photo
//                self.itemToEdit.photoID = [NSNumber numberWithInt:[self nextPhotoId]];
//                NSLog(@"Photo ID, %@", self.itemToEdit.photoID);
//            }
//            NSData *data = UIImagePNGRepresentation(image);
//            NSError *error;
//            if(![data writeToFile:[self.itemToEdit photoPath] options :NSDataWritingAtomic error:&error]) {
//                NSLog(@"Error writing file: %@", error);
//            }
//        }
//        [self.delegate itemDetailViewController:self didFinishEditingItem:self.itemToEdit];
//        }
//
//}
//                                                                                           
////Change the cell height if there is a picture.  My Locations Part 2 Page 125
//-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    if (indexPath.section ==1 && indexPath.row == 0) {
//        if(self.imageView.hidden){
//            return 44;
//        } else {
//            return 280;
//        }
//    } return 44;
//}
//
////Disable selection feature for the row
//-(NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    if (indexPath.section==1){
//        return indexPath;
//    }else{
//    return nil;
//    }
//}
//
//- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    if (indexPath.section ==1 && indexPath.row ==0){
//        [tableView deselectRowAtIndexPath:indexPath animated:YES];
//        [self showPhotoMenu];
//    }
//}
//
//-(void)showPhotoMenu
//{
//    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]){
//        UIActionSheet *actionSheet = [[UIActionSheet alloc]
//                                      initWithTitle:nil
//                                      delegate:self
//                                      cancelButtonTitle:@"Cancel"
//                                      destructiveButtonTitle:nil
//                                      otherButtonTitles:@"Take Photo", @"Choose From Library", nil];
//        [actionSheet showInView:self.view];
//    } else {
//        [self choosePhotoFromLibrary];
//    }
//}
////Take Photo
//-(void)takePhoto
//{
//    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
//    imagePicker.sourceType= UIImagePickerControllerSourceTypeCamera;
//    imagePicker.delegate=self;
//    imagePicker.allowsEditing=YES;
//    [self.navigationController presentViewController:imagePicker animated:YES completion:nil];
//}
//-(void)choosePhotoFromLibrary
//{
//    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
//    imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
//    imagePicker.delegate = self;
//    imagePicker.allowsEditing = YES;
//    [self.navigationController presentViewController:imagePicker animated:YES completion:nil];
//}
//
////Enable Save Bar Button when user change text in text field.
//-(BOOL) textField:(UITextField *)theTextField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
//{
//    NSString *newText = [theTextField.text stringByReplacingCharactersInRange:range withString:string];
//    self.saveBarButton.enabled = ([newText length] >0);
//    return YES;
//}
//
////Enable Save Bar Button when user changes text in text view
//- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)string
//{
//    NSString *newText = [textView.text stringByReplacingCharactersInRange:range withString:string];
//    self.saveBarButton.enabled = ([newText length]>0);
//    return YES;
//}
//
//
////Hide keyboard when user taps outside of text view
//-(void)hideKeyboard:(UIGestureRecognizer *)gestureRecognizer
//{
//    CGPoint point = [gestureRecognizer locationInView:self.tableView];
//    NSIndexPath *indexPath = [self.tableView indexPathForRowAtPoint:point];
//    
//    if(indexPath !=nil&&indexPath.section ==0 &&indexPath.row==0){
//        return;
//    }
//[self.descriptionTextView resignFirstResponder];
//}
//
//-(BOOL) textFieldShouldReturn:(UITextField *)textField{
//    [textField resignFirstResponder];
//    return YES;
//}
//
////Segue to pick the date
//-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
//{
//    if([segue.identifier isEqualToString:@"PickDate"]) {
//        DatePickerViewController *controller = segue.destinationViewController;
//        controller.delegate = self;
//        controller.date = dueDate;
//    }
//}
//-(void)datePickerDidCancel:(DatePickerViewController *)picker
//{
//    [self dismissViewControllerAnimated:YES completion:nil];
//}
//
//-(void)datePicker:(DatePickerViewController *)picker didPickDate:(NSDate *) date
//{
//    dueDate = date;
//    [self updateDueDateLabel];
//    
//    [self dismissViewControllerAnimated:YES completion:nil];
//}
//
////Methods required for image picker to work correctly (My Locations Part 2 Page 110)
//#pragma mark - UIImagePickerControllerDelegate
//
//-(void)imagePickerController: (UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
//{
//    image = [info objectForKey:UIImagePickerControllerEditedImage];
//    if ([self isViewLoaded]) {
//        [self showImage:image];
//        [self.tableView reloadData];
//    }
//    
//    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
//   
//    
//}
//
//-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
//{
//    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
//   
//}
//#pragma mark - UIActionSheetDelegate
//
//-(void)actionSheet:(UIActionSheet *)theActionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex
//{
//    if (buttonIndex ==0 ) {
//        [self takePhoto];
//    }else if (buttonIndex ==1) {
//        [self choosePhotoFromLibrary];
//    }
//    
//}
//    
//@end
