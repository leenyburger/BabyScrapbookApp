////
////  RootBookViewController.m
////  babyMilestones
////
////  Created by Schnettler Family on 3/7/13.
////  Copyright (c) 2013 Schnettler Family. All rights reserved.
////
//
//#import "RootBookViewController.h"
//#import "BookViewController.h"
//#import "babyMilestone.h"
//#import <ShipLib/ShipLib.h>
//
//@implementation RootBookViewController
////Prevent the user from scrolling too fast and crashing the program. 
//{BOOL pageIsAnimating;
//    UIImage *pictureframeLarge; 
//    UIImage *pictureframeSmall; 
//}
//
//- (void)viewDidLoad
//{
//    [super viewDidLoad];
//    pageIsAnimating = NO; 
//    
//    self.pageViewController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStylePageCurl navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
//    self.pageViewController.delegate = self;
//    self.pageViewController.dataSource = self;
//    
//    //Create a new content view controller.
//    BookViewController * bookViewController = (BookViewController *)[self.storyboard instantiateViewControllerWithIdentifier:@"BookViewController"];
//    //Setting the model property to the first item in the list of babyMilestones
//    bookViewController.model = [self.modelArray objectAtIndex:0];
//    
//    //set that array as the viewControllers property for our pageController
//    NSArray *viewControllers = [NSArray arrayWithObject:bookViewController];
//    [self.pageViewController setViewControllers:viewControllers
//                                      direction:UIPageViewControllerNavigationDirectionForward
//                                       animated:NO
//                                     completion:nil];
//    //The root view controller is the parent of the page view controller, and the bookviewcontroller is the VIEW of the page view controller
//    //Add page view controller as our child viewController
//    [self addChildViewController:self.pageViewController];
//    //Add pageViewControllersView to our own view.
//    [self.view addSubview:self.pageViewController.view];
//    
//    [self.pageViewController didMoveToParentViewController:self];
//    
//    //Tell the pageViewRect to fill up the visible window
//    CGRect pageViewRect = self.view.bounds;
//    //pageViewRect = CGRectInset(pageViewRect, 10.0, 10.0f);
//    self.pageViewController.view.frame = pageViewRect;
//          
//}
//
////Page is currently animating
//- (void)pageViewController:(UIPageViewController *)pageViewController willTransitionToViewControllers:(NSArray *)pendingViewControllers {
//    pageIsAnimating = YES;
//}
//
////Complete
//- (void)pageViewController:(UIPageViewController *)pageViewController
//        didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray *)previousViewControllers
//       transitionCompleted:(BOOL)completed {
//    if (completed || finished)   // Turn is either finished or aborted
//        pageIsAnimating = NO;
//}
//
//
//-(IBAction) createPostcard//:(UIImage *)backgroundImage
//{
//    //Create a new instance on BVC so I can use it to create the postcard (note : this needs to be the same as the BVC currently displaying)
//    BookViewController *contentVc = [[BookViewController alloc] init];
//    //Set contentVc to be equal to the current visibile VC. 
//    contentVc = self.pageViewController.viewControllers[0];
//    
//    UIImage *backgroundImage = [UIImage imageNamed:contentVc.model.highResImage];
//  
//    CGRect frameRect = CGRectMake(0,0,backgroundImage.size.width, backgroundImage.size.height);
//    //Defensive Programming to ensure background image exists 
//    if (backgroundImage ==NULL)
//    {
//        NSLog(@"Error, there is no background image associated with this event");
//        return;
//        
//    }
//    UIGraphicsBeginImageContext(backgroundImage.size);
//    [backgroundImage drawInRect:frameRect];
//    //Date Placement
//    UILabel *label =  [[UILabel alloc] init];
//    CGRect labelFrame = CGRectMake(498,623,716,167);
//    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
//    [formatter setDateStyle:NSDateFormatterLongStyle];
//    label.text = [formatter stringFromDate:contentVc.model.date];
//    [label.text drawInRect:labelFrame withFont:[UIFont fontWithName: @"AmericanTypewriter" size :70]];
//    
//    //If the user is using a generic page, it needs the text
//     if ([contentVc.model.backgroundImageName isEqualToString: @"genericpage.png"])
//     {
//         UILabel *descriptionLabel =  [[UILabel alloc] init];
//         CGRect descriptionLabelFrame = CGRectMake(77,140,510,564);
//         descriptionLabel.text = contentVc.model.text;
//         [descriptionLabel.text drawInRect:descriptionLabelFrame withFont:[UIFont fontWithName:@"AmericanTypewriter" size:90]];
//     }
//    
//    
//    //If the background image is white, the frame needs to be teal
//    if (([contentVc.model.backgroundImageName isEqualToString: @"genericpage.png"])|| [contentVc.model.backgroundImageName isEqualToString:@"firstsolidfood_2.png"])
//        
//    {  pictureframeLarge = [UIImage imageNamed:@"pictureframe_tealLarge"];
//        pictureframeSmall = [UIImage imageNamed:@"pictureframe_tealSmall"];
//    }
//    else
//    {
//        pictureframeLarge = [UIImage imageNamed:@"pictureframe_2large.png"];
//        pictureframeSmall = [UIImage imageNamed:@"pictureframe_2small.png"];
//    }
//    
//    if([contentVc.model hasPhoto1]) {
//        UIImage *image1 = [contentVc.model photoImage1];
//        if (image1 !=nil) {
//        //Note : Image should already be square
//            CGRect newRect = CGRectMake(533,782,681,681);
//            [pictureframeLarge drawInRect:newRect];
//            CGRect image1Rect = CGRectMake(572,821,603,603);
//            [image1 drawInRect:image1Rect];
//        }
//    }
//    
//    if([contentVc.model hasPhoto2]) {
//        UIImage *image2 = [contentVc.model photoImage2];
//        if (image2 !=nil) {
//            CGRect newRect = CGRectMake(77,654,389,389);
//            [pictureframeSmall drawInRect:newRect];
//            CGRect image2Rect = CGRectMake(101,677,346,346);
//            [image2 drawInRect:image2Rect];
//            
//        }
//    }
//    
//    if([contentVc.model hasPhoto3]) {
//        UIImage *image3 = [contentVc.model photoImage3];
//        if (image3 !=nil) {
//            
////            CGSize imageSize = image3.size;
////            CGSize viewSize = CGSizeMake(502, 335); // size in which you want to draw
////            
////            float hfactor = imageSize.width / viewSize.width;
////            float vfactor = imageSize.height / viewSize.height;
////            
////            float factor = fmax(hfactor, vfactor);
////            
////            // Divide the size by the greater of the vertical or horizontal shrinkage factor
////            float newWidth = imageSize.width / factor;
////            float newHeight = imageSize.height / factor;
////            
////            float leftOffset = (viewSize.width - newWidth)/2;
////            float topOffset = (viewSize.height - newHeight)/2;
////            
////            CGRect newRect = CGRectMake(728+leftOffset, 1158+topOffset-30, newWidth, newHeight);
////            [image3 drawInRect:newRect];
//            CGRect newRect = CGRectMake(77,1074,389,389);
//            [pictureframeSmall drawInRect:newRect];
//            CGRect image3Rect = CGRectMake(97,1094,346,346);
//            [image3 drawInRect:image3Rect];
//            
//            
//        }
//    }
//
//    
//    UIImage *postcardImage = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
//    NSLog(@"Created the high res image");
//    //I have an image called postcardImage
//    NSData *imageData = [NSData dataWithData:UIImageJPEGRepresentation(postcardImage,1.0f)];
//    //Create an instance of babyMilestone so I can find the documents Directory
//    babyMilestone *item = [[babyMilestone alloc] init];
//    NSString *documentsDirectory = [item documentsDirectory];
//    NSString *imagePath = [NSString stringWithFormat:@"%@/test.jpeg",documentsDirectory];
//    
//    [imageData writeToFile:imagePath atomically:YES];
//    //Open the sincerely controller
//    SYSincerelyController *controller = [[SYSincerelyController alloc] initWithImages:[NSArray arrayWithObject:[UIImage  imageWithContentsOfFile: imagePath]]
//                                                                              product:SYProductTypePostcard
//                                                                       applicationKey:@"B8FIRVVV0T512JGLH0N6C550TXQJHIYJV5KJ46U4"
//                                                                             delegate:self];
//    
//    if (controller) {
//        [self presentViewController:controller animated:YES completion:NULL];
//    }
//    
//}
//
//- (void)sincerelyControllerDidFinish:(SYSincerelyController *)controller {
//    /*
//     * Here I know that the user made a purchase and I can do something with it
//     */
//    
//    [self dismissViewControllerAnimated:YES completion:NULL];
//}
//
//- (void)sincerelyControllerDidCancel:(SYSincerelyController *)controller {
//    /*
//     * Here I know that the user hit the cancel button and they want to leave the Sincerely controller
//     */
//    
//    [self dismissViewControllerAnimated:YES completion:NULL];
//}
//
//- (void)sincerelyControllerDidFailInitiationWithError:(NSError *)error {
//    /*
//     * Here I know that incorrect inputs were given to initWithImages:product:applicationKey:delegate;
//     */
//    
//    NSLog(@"Error: %@", error);
//}
//
////-(void)deletePostcard
//
//
//
//
//
///******NEW STUFF TO TRY********/
//-(void) viewWillAppear:(BOOL)animated
//{
//    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleBlackTranslucent animated:YES];
//    self.navigationController.navigationBar.barStyle = UIBarStyleBlackTranslucent;
//}
//
//-(void) viewDidAppear:(BOOL)animated {
//    [self fadeBarController];
//     
//}
//
//-(void) viewDidDisappear:(BOOL)animated {
//    [self.fadeTimer invalidate];
//}
//
//-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
//    [super touchesEnded:touches withEvent:event];
//    if (self.navigationController.navigationBar.alpha ==1)
//    {
//
//        [self fadeBarAway:self.fadeTimer];
//        
//    }
//    else if (self.navigationController.navigationBar.alpha ==0)
//    {
//        [self fadeBarController];
//    }
//}
//-(void) fadeBarController {
//    
//
//    if (self.navigationController.navigationBar.alpha ==0)
//    {
//        [self fadeBarIn];
//    }
//  
//  
//    if (self.fadeTimer!=nil)
//    {
//        [self.fadeTimer invalidate];
//    }
//    self.fadeTimer = [NSTimer scheduledTimerWithTimeInterval: 5.5 target:self selector:@selector(fadeBarAway:) userInfo:nil repeats:NO];
//}
//
//-(void) fadeBarAway:(NSTimer *)timer
//{
//    [UIView beginAnimations:nil context:NULL];
//    [UIView setAnimationDuration:.35];
//    self.navigationController.navigationBar.alpha = 0.0;
//    [[UIApplication sharedApplication] setStatusBarHidden:YES];
//    [UIView commitAnimations];
//}
//
//-(void) fadeBarIn {
//    [UIView beginAnimations:nil context:NULL];
//    [UIView setAnimationDuration:.35];
//    self.navigationController.navigationBar.alpha = 1.0;
//    [[UIApplication sharedApplication] setStatusBarHidden:NO];
//    [UIView commitAnimations];
//}
//
//- (IBAction)back
//{
//    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
//}
//
//
//
//#pragma mark -
//#pragma mark - UIPageViewControllerDelegate Method
//
//- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
//{
//    if (pageIsAnimating)
//    { return nil;
//    }
//    
//    BookViewController *contentVc = (BookViewController *)viewController;
//    NSUInteger currentIndex = [self.modelArray indexOfObject:[contentVc model]];
//    _vcIndex = currentIndex;
//    
//    if (currentIndex == 0)
//    {
//        return nil;
//    }
//    
//    BookViewController * bookViewController = (BookViewController *)[self.storyboard instantiateViewControllerWithIdentifier:@"BookViewController"];
//    bookViewController.model = [self.modelArray objectAtIndex:currentIndex - 1];
//    return bookViewController;
//}
//
//- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
//{
//    if (pageIsAnimating)
//    {return nil;}
//    //BookViewController * contentVc = (BookViewController *)[self.storyboard instantiateViewControllerWithIdentifier:@"BookViewController"];
//    BookViewController *contentVc = (BookViewController *)viewController;
//    
//     NSUInteger currentIndex = [self.modelArray indexOfObject:[contentVc model]];
//    _vcIndex = currentIndex;
//    
//  
//    //babyMilestone *model = [self.modelArray objectAtIndex:_vcIndex];
//    //[contentVc.imageLabel setText:[NSString stringWithFormat:@"%@ - Colleen is awesome:", model.text]];
//    
//    if (currentIndex == _modelArray.count - 1)
//    {
//        return nil;
//    }
//    
//    BookViewController * bookViewController = (BookViewController *)[self.storyboard instantiateViewControllerWithIdentifier:@"BookViewController"];
//    bookViewController.model = [self.modelArray objectAtIndex:currentIndex + 1];
//    return bookViewController;
//}
//
//#pragma mark -
//#pragma mark - UIPageViewControllerDataSource Method
//
//- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController
//{
//    return self.modelArray.count;
//}
//
//- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController
//{
//    return 0;
//}
//
//@end
