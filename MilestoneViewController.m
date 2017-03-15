////
////  MilestoneViewController.m
////  babyMilestones
////
////  Created by silveroak on 3/22/13.
////  Copyright (c) 2013 Schnettler Family. All rights reserved.
////
//
//#import "MilestoneViewController.h"
//#import "babyMilestone.h"
//#import <QuartzCore/QuartzCore.h>
//#import <Social/Social.h>
//#import "UIImage+Resize.h"
//
//
//@interface MilestoneViewController ()
////Class continuation category for the scroll view
////pageImages always has a length of 3, because this is the maximum number of images allowed in the scroll view
//@property (nonatomic, strong) NSMutableArray *pageImages;
//@property (nonatomic, strong) NSMutableArray *pageViews;
////sizedPageImages is the non null values of pageImages
//@property (nonatomic, strong) NSMutableArray *sizedPageImages;
//
//-(void)loadVisiblePages;
//-(void)loadPage:(NSInteger)page;
//-(void)purgePage:(NSInteger)page;
//-(void)resizeArray :(NSMutableArray*) array;
//
//@end
//
//@implementation MilestoneViewController {
//    NSDate  *dueDate;
//    UIImage *image1;
//    UIImage *image2;
//    UIImage *image3;
//    NSInteger imageNumber;
//    
//    //Added as ivars because I cannot send these as objects when using segmented control and selector
//    UIActionSheet *actionSheetDate;
//    UIDatePicker *pickerView;
//   
//    
//}
//- (id)init
//{
//    if ((self = [super init]))
//    {
//        
//    }
//    return self;
//}
//
//-(void)updateDueDateLabel
//{
//    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
//    [formatter setDateStyle:NSDateFormatterMediumStyle];
//    self.dateLabel.text = [formatter stringFromDate:dueDate];
//}
//
//- (void)loadPage:(NSInteger)page {
//    if (page < 0 || page >= self.sizedPageImages.count) {
//        // If it's outside the range of what you have to display, then do nothing
//        return;
//        
//    }
//    UIView *pageView = [self.pageViews objectAtIndex:page];
//    //If the page does not exist (is NSNull), create it
//    if ((NSNull*)pageView == [NSNull null]) {
//        CGRect frame = self.scrollView.bounds;
//        frame.origin.x = frame.size.width * page;
//        frame.origin.y = 0.0f;
//        
//        // Create the new imageView for the scrollView
//        UIImageView *newPageView = [[UIImageView alloc] initWithImage:[self.sizedPageImages objectAtIndex:page]];
//        newPageView.contentMode = UIViewContentModeScaleAspectFit;
//        newPageView.frame = frame;
//        [self.scrollView addSubview:newPageView];
//        // Replace NSNull in the pageViews array with the view just created. 
//        [self.pageViews replaceObjectAtIndex:page withObject:newPageView];
//    }
//}
//
//- (void)purgePage:(NSInteger)page {
//    if (page < 0 || page >= self.sizedPageImages.count) {
//        // If it's outside the range of what you have to display, then do nothing
//        return;
//    }
//    
//    // Remove a page from the scroll view and reset the container array
//    UIView *pageView = [self.pageViews objectAtIndex:page];
//    if ((NSNull*)pageView != [NSNull null]) {
//        [pageView removeFromSuperview];
//        [self.pageViews replaceObjectAtIndex:page withObject:[NSNull null]];
//    }
//}
//
//- (void)loadVisiblePages {
//    // First, determine which page is currently visible
//    CGFloat pageWidth = self.scrollView.frame.size.width;
//    NSInteger page = (NSInteger)floor((self.scrollView.contentOffset.x * 2.0f + pageWidth) / (pageWidth * 2.0f));
//    // Work out which pages you want to load
//    NSInteger firstPage = page - 1;
//    NSInteger lastPage = page + 1;
//    
//    // Purge anything before the first page
//    for (NSInteger i=0; i<firstPage; i++) {
//        [self purgePage:i];
//    }
//    
//	// Load pages in our range
//    for (NSInteger i=firstPage; i<=lastPage; i++) {
//        [self loadPage:i];
//    }
//    
//	// Purge anything after the last page
//    for (NSInteger i=lastPage+1; i<self.pageImages.count; i++) {
//        [self purgePage:i];
//    }
//}
//
//-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
//    [self loadVisiblePages];
//}
//
//- (void)viewDidLoad
//{
//    [super viewDidLoad];
//    //Initialized the pageImages array to NSnull if the array was not previous created (if it was previously created the view was unloaded)
//    if (self.pageImages == nil)
//    {
//        self.pageImages = [[NSMutableArray alloc] init];
//        for (NSInteger i = 0; i<3; i++) {
//            [self.pageImages addObject:[NSNull null]];
//        }
//    }
//    //self.edgesForExtendedLayout=UIRectEdgeNone;
//    
//    //Set the border style of the text view
//    CALayer *imageLayer = self.notes.layer;
//    //[imageLayer setCornerRadius:10];
//    //[imageLayer setBorderWidth:1];
//    imageLayer.borderColor = [[UIColor clearColor]CGColor];
//
//    //The user is editing an existing entry
//    //if (self.itemToEdit !=nil){
//        self.title = self.itemToEdit.text;
//        //self.textField.text = self.itemToEdit.text;
//        //self.textField.hidden = YES;
//        self.notes.text = self.itemToEdit.textDescription;
//        self.saveBarButton.enabled= YES;
//        
//        //Load the pictures, if they exist - My Locations Part 2.
//        //If the item has a photo and the photo has not been replaced with a new image
//        if([self.itemToEdit hasPhoto1] && image1 ==nil) {
//            UIImage *existingImage = [self.itemToEdit photoImage1];
//            if (existingImage !=nil) {
//                //Put the picture in the thumbnail
//                self.imageView1.image = existingImage;
//                //Put the picture in teh pageImages array
//                [self.pageImages replaceObjectAtIndex:0 withObject:existingImage];
//            }
//        }
//        
//        if([self.itemToEdit hasPhoto2] && image2 ==nil) {
//            UIImage *existingImage = [self.itemToEdit photoImage2];
//            if (existingImage !=nil) {
//                self.imageView2.image = existingImage;
//                [self.pageImages replaceObjectAtIndex:1 withObject:existingImage];
//            }
//        }
//        
//        if([self.itemToEdit hasPhoto3] && image3 ==nil) {
//            UIImage *existingImage = [self.itemToEdit photoImage3];
//            if (existingImage !=nil) {
//                self.imageView3.image = existingImage;
//                [self.pageImages replaceObjectAtIndex:2 withObject:existingImage];
//            }
//        }
//        
//        if (self.itemToEdit.date != nil){
//            dueDate = self.itemToEdit.date;
//        }
//        else{
//            dueDate = [NSDate date];
//        }
//        //}
//    //If the user is adding a new entry
//    //else {
//       // dueDate=[NSDate date];
//      //  }
//    
//    //For all cases 
//    [self updateDueDateLabel];
//    if (image1!=nil){
//        self.imageView1.image = image1;
//    }
//    if (image2!=nil) {
//        self.imageView2.image = image2;
//    }
//    if (image3!=nil) {
//        self.imageView3.image = image3;
//    }
//    //Use gesture recognizer to hide keyboard when user taps outside of text field
//    UITapGestureRecognizer *gestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideKeyboard:)];
//    gestureRecognizer.cancelsTouchesInView=NO;
//    [self.view addGestureRecognizer:gestureRecognizer];
//}
//
////This method "resets" the pageView array, and creates a properly sized sizedPageImages array based on non null values of the pageImages array.
//-(void) resizeArray:(NSMutableArray*)array
//{
//    //Initialize the sizedPageImages array
//    if (self.sizedPageImages == nil)
//    { self.sizedPageImages = [[NSMutableArray alloc] init];
//    }
//    //If it exists destroy it because it can only be as long as the number of valid images
//    else {
//        [self.sizedPageImages removeAllObjects];
//    }
//    NSString *str;
//    //Create sizedPageImages array which contains non null values of pageImages array.  This enabled the user to add photos in any order (but they are displayed in proper order)
//    
//    for(int i=0;i<[self.pageImages count];i++)
//    {
//        str = [self.pageImages objectAtIndex:i];
//        //If str is not null, add to sizedPageImages array
//        if(![str isKindOfClass:[NSNull class]]) 
//        {
//            NSLog(@"The index of the non null values is %i", i); 
//            [self.sizedPageImages addObject:str];
//        }
//    }
//    
//    //Now sizedPageImages is an array in the proper order of all the images of the proper length.  This is our base array for creating the pageviews
//    //pageCount of actual number of images 
//    NSInteger pageCount = self.sizedPageImages.count;
//    NSLog(@"Page count is, %i", self.sizedPageImages.count); 
//    
//    //Intialize the pageViews array
//    //If the pageViews array has not been previous created, create it here.
//    //If the pageView array exists, remove the subviews from the scroll view and destroy the array
//    if (self.pageViews != nil){
//        for (int z=0; z< self.pageViews.count; z++) {
//            [self purgePage:z];
//            }
//        [self.pageViews removeAllObjects];
//    
//    }
//    
//    else {
//    self.pageViews = [[NSMutableArray alloc] init];
//    }
//    //Create the pageViews array.  Fill with NSNull b/c we'll be doing lazy loading to save memory
//    for (NSInteger i = 0; i<pageCount; i++) {
//            [self.pageViews addObject:[NSNull null]];
//        }
//}
//
//-(void)viewWillAppear:(BOOL)animated {
//    [super viewWillAppear:animated];
//      //For horizontal paging scroll view, width is equal to the number of pages multiplied by the width of the scroll view.  The height is the same as the height of the scroll view.
//    CGSize pagesScrollViewSize = self.scrollView.frame.size;
//    [self resizeArray:self.pageImages];
//    [self loadVisiblePages];
//    //contentSize is the scrollable area, so it has to be dynamic (changes with number of pictures)
//    self.scrollView.contentSize = CGSizeMake(pagesScrollViewSize.width * self.pageViews.count, pagesScrollViewSize.height);
//    
//    
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
//        self.notes = nil;
//        self.imageView1 = nil;
//        self.imageView2 = nil;
//        self.imageView3 = nil;
//        //self.textField = nil;
//    }
//
//}
//
//-(IBAction) cancel
//{ 
//    if (self.delegate == nil)
//    {NSLog(@"No delegate set");
//    } 
//    [self.delegate milestoneViewControllerDidCancel:self];
//    
//}
//
//-(int)nextPhotoId1
//{
//    int photoId = [[NSUserDefaults standardUserDefaults] integerForKey:@"PhotoID1"];
//    [[NSUserDefaults standardUserDefaults] setInteger:photoId+1 forKey:@"PhotoID1"];
//    [[NSUserDefaults standardUserDefaults] synchronize];
//    return photoId;
//}
//
//
//-(int)nextPhotoId2
//{
//    int photoId = [[NSUserDefaults standardUserDefaults] integerForKey:@"PhotoID2"];
//    [[NSUserDefaults standardUserDefaults] setInteger:photoId+1 forKey:@"PhotoID2"];
//    [[NSUserDefaults standardUserDefaults] synchronize];
//    return photoId;
//}
//
//
//-(int)nextPhotoId3
//{
//    int photoId = [[NSUserDefaults standardUserDefaults] integerForKey:@"PhotoID3"];
//    [[NSUserDefaults standardUserDefaults] setInteger:photoId+1 forKey:@"PhotoID3"];
//    [[NSUserDefaults standardUserDefaults] synchronize];
//    return photoId;
//}
//
//
//-(IBAction) save
//{
//    //If the user is adding a new item
//    //NOTE : This can all be deleted with the new view controller!! 
//        //If the user is editing an existing item
//    
//        self.itemToEdit.textDescription=self.notes.text;
//        self.itemToEdit.date=dueDate;
//        if (image1 !=nil) { //(the user picked an image or took an image with the camera
//            if(![self.itemToEdit hasPhoto1]){ //If the itemToEdit does not already have a photo
//                self.itemToEdit.photoID1 = [NSNumber numberWithInt:[self nextPhotoId1]];
//                NSLog(@"Photo ID, %@", self.itemToEdit.photoID1);
//            }
//            NSData *data = UIImagePNGRepresentation(image1);
//            NSError *error;
//            if(![data writeToFile:[self.itemToEdit photoPath1] options :NSDataWritingAtomic error:&error]) {
//                NSLog(@"Error writing file: %@", error);
//            }
//        }
//        
//        if (image2 !=nil) {
//            if(![self.itemToEdit hasPhoto2]){ //If the itemToEdit does not already have a photo.  Investigate.  It shouldn't b/c it's brand new.  Defensive programming?
//                self.itemToEdit.photoID2 = [NSNumber numberWithInt:[self nextPhotoId2]];
//            }
//            NSData *data = UIImagePNGRepresentation(image2);
//            NSError *error;
//            
//            if(![data writeToFile:[self.itemToEdit photoPath2] options :NSDataWritingAtomic error:&error]) {
//                NSLog(@"Error writing file: %@", error);
//            }
//        }
//        
//        if (image3 !=nil) {
//            if(![self.itemToEdit hasPhoto3]){ //If the itemToEdit does not already have a photo.  Investigate.  It shouldn't b/c it's brand new.  Defensive programming?
//                self.itemToEdit.photoID3 = [NSNumber numberWithInt:[self nextPhotoId3]];
//            }
//            NSData *data = UIImagePNGRepresentation(image3);
//            NSError *error;
//            
//            if(![data writeToFile:[self.itemToEdit photoPath3] options :NSDataWritingAtomic error:&error]) {
//                NSLog(@"Error writing file: %@", error);
//            }
//        }
//        [self.delegate milestoneViewController:self didFinishEditingItem:self.itemToEdit];
//     
//    }
//    
//
//
////Show Photo Menu
//-(void)showPhotoMenu
//{
//    //If a photo exists, add a delete button to the action sheet.  Not sure if I can concatenate the image number directly after "hasPhoto", so adding a BOOL.
//    BOOL photo = NO; //Default is no photo.  Image Number is an ivar set during the tap sequence.
//    if (imageNumber == 1 && [self.itemToEdit hasPhoto1]){
//        photo = YES;
//    } else if (imageNumber ==2 && [self.itemToEdit hasPhoto2]) {
//        photo = YES;
//    } else if (imageNumber ==3 && [self.itemToEdit hasPhoto3]){
//        photo = YES;
//    }
//    //Note : There are multiple action sheet to account for the current state of the photo (exists/doesn't exist) and whether or not the user has a camera.
//    //Option 1:
//    //The action sheet if a photo already exists and the user has a camera.  Initialized a bit differently to force the buttons in the order I desire.
//    
//    if ((photo == YES) && [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
//    { NSLog(@"Testing Option 1"); 
//        UIActionSheet *actionSheet_withPhoto = [[UIActionSheet alloc] init];
//                                             actionSheet_withPhoto.title = nil;
//                                             actionSheet_withPhoto.delegate=self;
//                                             [actionSheet_withPhoto addButtonWithTitle:@"Choose From Library"];
//                                             [actionSheet_withPhoto addButtonWithTitle:@"Take Photo"];
//                                             actionSheet_withPhoto.destructiveButtonIndex = [actionSheet_withPhoto addButtonWithTitle:@"Delete Photo"];
//                                             actionSheet_withPhoto.cancelButtonIndex = [actionSheet_withPhoto addButtonWithTitle:@"Cancel"];
//    
//    [actionSheet_withPhoto showInView:self.view];
//    }
//    //Option 2 : There is an existing photo, but the user does not have a camera on her device.
//    
//    else if ((photo ==YES) && ![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
//    {NSLog(@"Testing Option 2");
//        UIActionSheet *actionSheet_withPhoto = [[UIActionSheet alloc] init];
//                                                actionSheet_withPhoto.title = nil;
//                                                actionSheet_withPhoto.delegate=self;
//                                                [actionSheet_withPhoto addButtonWithTitle:@"Choose From Library"];
//                                                actionSheet_withPhoto.destructiveButtonIndex = [actionSheet_withPhoto addButtonWithTitle:@"Delete Photo"];
//        
//                                                actionSheet_withPhoto.cancelButtonIndex = [actionSheet_withPhoto addButtonWithTitle:@"Cancel"];
//        [actionSheet_withPhoto showInView:self.view]; 
//    }
//    
//    //Option 3 : The action sheet if the camera exists but there is not an existing photo
//    else if ((photo == NO)&& [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
//    { NSLog(@"Testing Option 3"); 
//        UIActionSheet *actionSheet = [[UIActionSheet alloc]
//                                      initWithTitle:nil
//                                      delegate:self
//                                      cancelButtonTitle:@"Cancel"
//                                      destructiveButtonTitle:nil
//                                      otherButtonTitles: @"Choose From Library", @"Take Photo", nil];
//        [actionSheet showInView:self.view];
//    }
//    //Option 4 : No camera, no photo. 
//    else {
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
//    NSLog(@"In the take photo void");
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
//
////Delete photo in Documents directory, and remove from small view and scroll view.
//-(void) deletePhoto
//{   NSString *path;
//    
//    if (imageNumber ==1)
//    {   path = [self.itemToEdit photoPath1];
//        //Reset the photoID to -1, this means no photo. 
//        self.itemToEdit.photoID1 =[NSNumber numberWithInt:-1];
//        self.imageView1.image = [UIImage imageNamed:@"button_taptoadd.png"];
//        //Remove the photo from the pageImages array (for the scroll view)
//       [self.pageImages replaceObjectAtIndex:0 withObject:[NSNull null]];
//        [self purgePage:0];
//    }
//    else if (imageNumber ==2)
//    {   path = [self.itemToEdit photoPath2];
//        self.itemToEdit.photoID2 =[NSNumber numberWithInt:-1];
//        self.imageView2.image = [UIImage imageNamed:@"button_taptoadd.png"];
//        [self.pageImages replaceObjectAtIndex:1 withObject:[NSNull null]];
//        [self purgePage:1];
//    }
//    else if (imageNumber ==3)
//    {   path = [self.itemToEdit photoPath3];
//        self.itemToEdit.photoID3 =[NSNumber numberWithInt:-1];
//        self.imageView3.image = [UIImage imageNamed:@"button_taptoadd.png"];
//        [self.pageImages replaceObjectAtIndex:2 withObject:[NSNull null]];
//        [self purgePage:2];
//    }
//    
//    NSFileManager *fileManager = [NSFileManager defaultManager];
//    if ([fileManager fileExistsAtPath:path])
//    {
//    NSError *error;
//    if (![fileManager removeItemAtPath:path error:&error])
//    {
//        NSLog(@"Error removing file: %@", error);
//    }
//    }
//    CGSize pagesScrollViewSize = self.scrollView.frame.size;
//    [self resizeArray:self.pageImages];
//    [self loadVisiblePages];
//    self.scrollView.contentSize = CGSizeMake(pagesScrollViewSize.width * self.pageViews.count, pagesScrollViewSize.height);
//   
//}
//
////Methods required for image picker to work correctly (My Locations Part 2 Page 110)
//#pragma mark - UIImagePickerControllerDelegate
//
//-(void)imagePickerController: (UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
//{
//    
//    //if ([self isViewLoaded])
//    //{
//        if (imageNumber ==1)
//        {
//            image1 = [info objectForKey: UIImagePickerControllerEditedImage];
//            self.imageView1.image = [image1 resizedImageWithBounds:CGSizeMake(60,60)];
//            [self.pageImages replaceObjectAtIndex:0 withObject:image1];
//        }
//        
//        else if (imageNumber ==2)
//        {
//            image2 = [info objectForKey: UIImagePickerControllerEditedImage];
//            self.imageView2.image = image2;
//            [self.pageImages replaceObjectAtIndex:1 withObject:image2];
//            //Need a way to test to see if that index is null.  If it is, then addObject.  If it is not, then replaceObject.  Also, need a way to reload the scroll view. 
//        }
//        
//        else if (imageNumber ==3)
//        {
//            image3 = [info objectForKey: UIImagePickerControllerEditedImage];
//            self.imageView3.image = image3;
//            [self.pageImages replaceObjectAtIndex:2 withObject:image3];
//        }
//         
//    //}
//    [self resizeArray:self.pageImages];
//    [self loadVisiblePages];
//    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
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
//    if (buttonIndex ==0) {
//        [self choosePhotoFromLibrary];
//    }
//    else if ((buttonIndex ==1) && (theActionSheet.destructiveButtonIndex != 1)) {
//        [self takePhoto];
//    }
//    else if (buttonIndex ==theActionSheet.destructiveButtonIndex)
//    {
//        [self deletePhoto];
//    }
//    
//}
//
//
//
//
////Enable Save Bar Button when user changes text in text view
//- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)string
//{
//    NSString *newText = [textView.text stringByReplacingCharactersInRange:range withString:string];
//    self.saveBarButton.enabled = ([newText length]>0);
//    return YES;
//}
//
////Hide keyboard when user taps outside of text view
//-(void)hideKeyboard:(UIGestureRecognizer *)gestureRecognizer
//{
//    //[self.textField resignFirstResponder];
//    [self.notes resignFirstResponder];
//    
//}
//
//-(BOOL) textFieldShouldReturn:(UITextField *)textField{
//    [textField resignFirstResponder];
//    return YES;
//}
//
//
////UIText Field Delegate Method.  It is invoked every time the user changes text, whether by tapping on the keyboard or by cut/paste
////- (BOOL)textField:(UITextField *)theTextField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
////{
////    NSString *newText = [theTextField.text stringByReplacingCharactersInRange:
////                         range withString:string];
////    self.saveBarButton.enabled = ([newText length] >0);
////    return YES; }
//
//-(IBAction) handleTap:(UITapGestureRecognizer *)recognizer
//{  
//        if ( (![recognizer.view viewWithTag:4] && ![recognizer.view viewWithTag:5]) )
//        {
//            for (int i = 1; i<4;i++) {
//                if ([recognizer.view viewWithTag:i]) {
//                    imageNumber = i;
//                }
//            }
//            [self showPhotoMenu];
//        }
//        else  if ([recognizer.view viewWithTag:4])//User tapped the facebook button
//        {
//            NSLog(@"Looking at facebook"); 
//            [self postToFacebook];
//        }
//        else if ([recognizer.view viewWithTag:5])
//        {
//            [self createPicker];
//           
//        }
//
//    }
//
//-(void) createPicker
//{
//  actionSheetDate = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:nil destructiveButtonTitle:nil otherButtonTitles:nil, nil];
//   [actionSheetDate setActionSheetStyle:UIActionSheetStyleBlackTranslucent];
//    CGRect pickerFrame = CGRectMake(0, 40, 0, 0);
//    pickerView = [[UIDatePicker alloc] initWithFrame:pickerFrame];
//    pickerView.datePickerMode = UIDatePickerModeDate;
//    [actionSheetDate addSubview:pickerView];
//    
//    UISegmentedControl *closeButton = [[UISegmentedControl alloc] initWithItems:[NSArray arrayWithObject:@"Done"]];
//    closeButton.momentary = YES;
//    closeButton.frame = CGRectMake(260, 7.0f, 50.0f, 30.0f);
//    closeButton.segmentedControlStyle = UISegmentedControlStyleBar;
//    closeButton.tintColor = [UIColor blackColor];
//    [closeButton addTarget:self action:@selector(doneActionSheet:) forControlEvents:UIControlEventValueChanged];
//                                  
//    UISegmentedControl *cancelButton = [[UISegmentedControl alloc] initWithItems:[NSArray arrayWithObject:@"Cancel"]];
//    cancelButton.momentary = YES;
//    cancelButton.frame = CGRectMake(10, 7.0f, 50.0f, 30.0f);
//    cancelButton.segmentedControlStyle = UISegmentedControlStyleBar;
//    cancelButton.tintColor = [UIColor blackColor];
//    [cancelButton addTarget:self action:@selector(dismissActionSheet:) forControlEvents:UIControlEventValueChanged];
//    [actionSheetDate addSubview:closeButton];
//    [actionSheetDate addSubview:cancelButton];
//    [actionSheetDate showInView:[[UIApplication sharedApplication] keyWindow]];
//    [actionSheetDate setBounds:CGRectMake(0, 0, 320, 485)];
//}
//
//-(void) dismissActionSheet:(id)sender 
//{   //Button Index 0, 1 are used for photo picker action sheet.
//    [actionSheetDate dismissWithClickedButtonIndex:3 animated:YES];
//   
//}
//
//-(void) doneActionSheet:(id)sender
//{
//    dueDate = pickerView.date;
//    [actionSheetDate dismissWithClickedButtonIndex:3 animated:YES];
//    [self updateDueDateLabel];
//}
////-(void) launchPicker
////{
////    UIDatePicker *picker = [[UIDatePicker alloc] initWithFrame:CGRectMake(5, 200, 300, 200)];
////    [picker addTarget:self action:@selector(updateLabel:) forControlEvents:UIControlEventValueChanged];
////    [self.view addSubview:picker];
////  
////}
////
////-(IBAction)updateLabel:(UIDatePicker *)sender {
////    self.dateLabel.text = [NSString stringWithFormat:@"%@",sender.date ];
////    [sender removeFromSuperview];
////}
//
//
////-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
////{
////    if([segue.identifier isEqualToString:@"PickDate"]) {
////        UIImage *screenshotImage = [self screenshot];
////        DatePickerViewController *controller = segue.destinationViewController;
////        controller.delegate = self;
////        controller.backgroundImage = screenshotImage;
////        controller.date = dueDate;
////    }
////}
////
////- (void)datePickerDidCancel:(DatePickerViewController *)picker
////{
////    [self dismissViewControllerAnimated:YES completion:nil];
////}
////
////- (void)datePicker:(DatePickerViewController *)picker didPickDate:(NSDate *)date
////{
////    [self dismissViewControllerAnimated:YES completion:nil];
////}
//
//- (UIImage*)screenshot
//{
//    // Create a graphics context with the target size
//    // On iOS 4 and later, use UIGraphicsBeginImageContextWithOptions to take the scale into consideration
//    // On iOS prior to 4, fall back to use UIGraphicsBeginImageContext
//    CGSize imageSize = [[UIScreen mainScreen] bounds].size;
//    if (NULL != UIGraphicsBeginImageContextWithOptions)
//        UIGraphicsBeginImageContextWithOptions(imageSize, NO, 0);
//    else
//        UIGraphicsBeginImageContext(imageSize);
//    
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    
//    // Iterate over every window from back to front
//    for (UIWindow *window in [[UIApplication sharedApplication] windows])
//    {
//        if (![window respondsToSelector:@selector(screen)] || [window screen] == [UIScreen mainScreen])
//        {
//            // -renderInContext: renders in the coordinate space of the layer,
//            // so we must first apply the layer's geometry to the graphics context
//            CGContextSaveGState(context);
//            // Center the context around the window's anchor point
//            CGContextTranslateCTM(context, [window center].x, [window center].y);
//            // Apply the window's transform about the anchor point
//            CGContextConcatCTM(context, [window transform]);
//            // Offset by the portion of the bounds left of and above the anchor point
//            CGContextTranslateCTM(context,
//                                  -[window bounds].size.width * [[window layer] anchorPoint].x,
//                                  -[window bounds].size.height * [[window layer] anchorPoint].y);
//            
//            // Render the layer hierarchy to the current context
//            [[window layer] renderInContext:context];
//            
//            // Restore the context
//            CGContextRestoreGState(context);
//        }
//    }
//    
//    // Retrieve the screenshot image
//    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
//    
//    UIGraphicsEndImageContext();
//    
//    return image;
//}
//
//
//-(void) postToFacebook
//{
//    if([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook]) {
//        SLComposeViewController*fvc = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
//        
//        if(self.notes.text.length >0)
//        {
//            [fvc setInitialText:self.notes.text];
//        }
//        else {
//            [fvc setInitialText:self.itemToEdit.text];
//        }
//       
//        //If an image exists, upload to facebook the image shown in the scroll view
//        
//        if ((self.imageView1.image != [UIImage imageNamed:@"button_taptoadd.png"])|| (self.imageView2.image != [UIImage imageNamed:@"button_taptoadd.png"]) || (self.imageView3.image != [UIImage imageNamed:@"button_taptoadd.png"]))
//        {   //Determine current visible page
//            CGFloat pageWidth = self.scrollView.frame.size.width;
//            NSInteger page = (NSInteger)floor((self.scrollView.contentOffset.x * 2.0f + pageWidth) / (pageWidth * 2.0f));
//            //Upload the displayed image to facebook.  sizedPageImages is the array of non null values of the images in the correct order
//            [fvc addImage:[self.sizedPageImages objectAtIndex:page]];
//            NSLog(@"At least one image exists");
//        }
//        [self presentViewController:fvc animated:YES completion:nil];
//    }
//}
//
///***Code to move the text view (notes) up so it is not covered by the keyboard***/
//Text field
//- (void)textViewDidBeginEditing:(UITextView *)textView
//{
//    [self animateTextView: textView up: YES];
//    if([textView.text isEqualToString:@"So there we were..."]) {
//        textView.text = @"";
//        textView.textColor = [UIColor blackColor];
//    }
//}
//
//
//- (void)textViewDidEndEditing:(UITextView *)textView
//{
//    [self animateTextView: textView up: NO];
//    if([textView.text isEqualToString:@""]) {
//        textView.text = @"So there we were...";
//        textView.textColor = [UIColor lightTextColor];
//    }
//}
//
//- (void) animateTextView: (UITextView*) textView up: (BOOL) up
//{
//    const int movementDistance = 250; // tweak as needed
//    const float movementDuration = 0.3f; // tweak as needed
//    
//    int movement = (up ? -movementDistance : movementDistance);
//    
//    [UIView beginAnimations: @"anim" context: nil];
//    [UIView setAnimationBeginsFromCurrentState: YES];
//    [UIView setAnimationDuration: movementDuration];
//    self.view.frame = CGRectOffset(self.view.frame, 0, movement);
//    [UIView commitAnimations];
//}
//
//- (void)viewDidUnload {
//    [self setFacebookShare:nil];
//    [super viewDidUnload];
//    //[self setTextField:nil];
//    [self setImageView1:nil];
//    [self setImageView2:nil];
//    [self setImageView3:nil];
//    [self setDateLabel:nil];
//    [self setNotes:(UITextView *)nil];
//    [self setSaveBarButton:nil];
//    
//}
//
//@end
