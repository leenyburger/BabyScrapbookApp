//
//  babyMilestonesViewController.m
//  babyMilestones
//
//  Created by Schnettler Family on 1/27/13.
//  Copyright (c) 2013 Schnettler Family. All rights reserved.
//

#import "babyMilestonesViewController.h"
#import "babyMilestone.h"
#import "CustomCell.h"
#import "UIImage+Resize.h"
#import "EditItemViewController.h"
#import "CMPopTipView.h"
#import "UIImage+ResizeMagick.h"
#import "Child.h"
#import "SWRevealViewController.h"
#import <OLKitePrintSDK.h>
#import "AddChildViewController.h"

@interface babyMilestonesViewController ()

@end

@implementation babyMilestonesViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [[UINavigationBar appearance] setTitleTextAttributes: [NSDictionary dictionaryWithObjectsAndKeys:[UIColor colorWithRed:255.0/255.0 green:255.0/255.0 blue:255.0/255.0 alpha:1.0], NSForegroundColorAttributeName,nil, NSShadowAttributeName,[UIFont fontWithName:@"Roboto-Medium" size:21.0], NSFontAttributeName, nil]];
    self.title = self.childSelected.name;
    SWRevealViewController *revealViewController = self.revealViewController;
    if ( revealViewController )
    {
        [self.sidebarButton setTarget: self.revealViewController];
        [self.sidebarButton setAction: @selector( revealToggle: )];
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    }
    
    [self createTappableNavBar];
}
-(void)createTappableNavBar {
//    UIImageView *titleView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 20, 200, 44)];
//    UITapGestureRecognizer *oneFingerOneTap =
//    [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(oneFingerOneTap)];
//    
//    // Set required taps and number of touches
//    [oneFingerOneTap setNumberOfTapsRequired:1];
//    [oneFingerOneTap setNumberOfTouchesRequired:1];
//    
//    [self.navigationController.navigationBar setUserInteractionEnabled:YES];
//    [titleView setUserInteractionEnabled:YES];
//    [titleView addGestureRecognizer:oneFingerOneTap];
//    
//    
//    self.navigationItem.titleView = titleView;
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.titleLabel.text = self.childSelected.name;
    button.backgroundColor = [UIColor greenColor];
    [button addTarget:self action:@selector(oneFingerOneTap) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.titleView = button;
}

-(void)oneFingerOneTap
{
    NSLog(@"Nav bar button was tapped");
    [self performSegueWithIdentifier:@"EditChildData" sender:self.childSelected];
}




    
//    NSDate *birthDay = [[NSUserDefaults standardUserDefaults]objectForKey:@"birthDay"];
//    //BOOL didrunBefore = 0;//[[NSUserDefaults standardUserDefaults]boolForKey:@"Check"];
//    
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 0.5f * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
//        if (!birthDay)
//        {
//            
//            NSLog(@"should see alert view");
//            [self launchDialog];
//        }
//        
//    });
    


-(void)createPopView
{
    CMPopTipView *navBarRightButton=[[CMPopTipView alloc] initWithMessage:@"Click here to add your own memories! (tap anywhere to dismiss)"];
    navBarRightButton.delegate = self;
    CGFloat red_b = 236.0;
    CGFloat green_b = 236.0;
    CGFloat blue_b = 236.0;
    CGFloat alpha_b = 255.0;
    UIColor *color_b = [UIColor colorWithRed:(red_b/255.0) green:(green_b/255.0) blue:(blue_b/255.0) alpha:(alpha_b/255.0)];
    navBarRightButton.backgroundColor=color_b;
    CGFloat red = 40.0;
    CGFloat green = 97.0;
    CGFloat blue = 101.0;
    CGFloat alpha = 255.0;
    UIColor *color = [UIColor colorWithRed:(red/255.0) green:(green/255.0) blue:(blue/255.0) alpha:(alpha/255.0)  ];
      navBarRightButton.dismissTapAnywhere = YES;
    navBarRightButton.hasGradientBackground = FALSE; 
    navBarRightButton.textColor = color;
    navBarRightButton.titleFont = [UIFont fontWithName:@"Cochin" size:13];
    navBarRightButton.borderColor = color_b;
    [navBarRightButton presentPointingAtBarButtonItem:self.navigationItem.rightBarButtonItem animated:YES];
  
    //[navBarRightButton autoDismissAnimated:YES atTimeInterval:3.0];


}

- (void)popTipViewWasDismissedByUser:(CMPopTipView *)popTipView
{
    [popTipView dismissAnimated:YES];
}

-(void)createBabyBook:(id)sender
{
    NSMutableArray *imageArray = [[NSMutableArray alloc] initWithCapacity:20];
    babyMilestone *tempItem;
    for (tempItem in self.childSelected.items)
    {
        if ([tempItem hasPhoto])
        {   //Build new placeholder array
            OLAsset *newAsset = [OLAsset assetWithImageAsJPEG:[tempItem photoImage]];
            
            //UIImage *imageToAdd = [tempItem photoImage];
            //Convert to OLA objects
            //[imageArray addObject:imageToAdd];
            [imageArray addObject:newAsset]; //Array of Assets
            NSLog(@"Adding item");
        }
    }
    
    
    NSArray *assetsForPrinting = [imageArray copy];    //Cannot pass in a mutable array, must conform to static.  This is an array of assets
    OLKiteViewController *vc = [[OLKiteViewController alloc] initWithAssets:assetsForPrinting];
    [self presentViewController:vc animated:YES completion:NULL];
}
   





- (UIView *)createDemoView
{
    UIView *demoView = [[UIView alloc] initWithFrame:CGRectMake(10, 10, 300, 260)];
    CGRect rect = CGRectMake(0, 0, 280, 60);
    UITextView *textView = [[UITextView alloc] initWithFrame:rect];
    textView.backgroundColor=[UIColor clearColor];
    textView.font = [UIFont fontWithName:@"Cochin" size:13];
    textView.text = @"Change Birthday";
    textView.textAlignment = NSTextAlignmentLeft;
    UIDatePicker *datePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(-18,50,162,162)]; //-10.0f, 40.0f, 130.0f, 200.0f)];
    datePicker.datePickerMode = UIDatePickerModeDate;
    [datePicker addTarget:self action:@selector(dateChanged:) forControlEvents:UIControlEventValueChanged];
    [demoView addSubview:textView];
    [demoView addSubview:datePicker];
    return demoView;
}


- (void)launchDialog
{
    // Here we need to pass a full frame
    CustomIOS7AlertView *alertView = [[CustomIOS7AlertView alloc] init];
    // Add some custom content to the alert view
    [alertView setContainerView:[self createDemoView]];
    
    
    // Modify the parameters
    [alertView setButtonTitles:[NSMutableArray arrayWithObjects:@"Save", nil]];
    [alertView setDelegate:self];
  
    [alertView show];
    
    
}

- (void)customIOS7dialogButtonTouchUpInside: (CustomIOS7AlertView *)alertView clickedButtonAtIndex: (NSInteger)buttonIndex
{
    NSLog(@"Delegate: Button at position %d is clicked on alertView %d.", (int)buttonIndex, (int)[alertView tag]);
    [alertView close];
    BOOL seenPopView =[[NSUserDefaults standardUserDefaults]boolForKey:@"seenPopView"]; //Defaults to no
    if(!seenPopView)
        [self createPopView];
    
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"seenPopView"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}


-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)babyCollectionView
{ return 1;
}

-(NSInteger)collectionView:(UICollectionView *)babyCollectionView numberOfItemsInSection:(NSInteger)section
{
    NSLog(@"The number of items associated with the child is %lu", (unsigned long)[self.childSelected.items count]);
    return [self.childSelected.items count];
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"MyCell";
    CustomCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    babyMilestone *babyItem = [self.childSelected.items objectAtIndex:indexPath.item];
    UIImage *thumbnail = nil;
    if ([babyItem hasPhoto]) {
        thumbnail = [babyItem photoImage];
        thumbnail = [thumbnail resizedImageByMagick:@"80x80#"];
        cell.thumbImage.contentMode = UIViewContentModeCenter;
        [cell.thumbImage.layer setCornerRadius:40.0f];
        //[cell.thumbImage.layer setBorderColor:[[UIColor whiteColor] CGColor]];
        //[cell.thumbImage.layer setBorderWidth:2.0];
        [cell.thumbImage.layer setMasksToBounds:YES];
        //MAKE IMAGE VIEW SMALLER
    }
    else if (babyItem.imageName!=NULL){
        thumbnail = [UIImage imageNamed:babyItem.imageName];
        }
    else {
        thumbnail = [UIImage imageNamed:@"camera_icon.png"];
        }
    [[cell thumbImage]setImage:(thumbnail)];
    [[cell titleLabel]setText:(babyItem.text)];
    
    //Date if it exists.  Blank otherwise
    if (babyItem.date!=nil)
        {
            NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
            [formatter setDateStyle:NSDateFormatterMediumStyle];
            cell.dateLabel.text= [formatter stringFromDate:babyItem.date];
        } else {
        cell.dateLabel.text = @" ";
        }
    return cell;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


//Close the EditItemViewController screen.  Delegate methods for the Edit Item View Controller

-(void)editItemViewController:(EditItemViewController *)controller didCancel:(babyMilestone *)babyItem 
{
    if (babyItem.newItem == NO) //If the newItem property is still yes, the entry was never saved so only need to dismiss the view controller.
    {
        if (babyItem.nativeItem == NO)
        {
            [self.childSelected.items removeObjectIdenticalTo:babyItem];
        }
        else if (babyItem.nativeItem ==YES)
        {
        babyItem.date = nil;
        babyItem.textDescription = nil;
        babyItem.photoID = [NSNumber numberWithInt:-1];
        }
        [self sortArray];
        [self.babyCollectionView reloadData];
    }
        [self.navigationController popViewControllerAnimated:YES];
 }

-(void) sortArray
{
    NSMutableArray *tempArray = [[NSMutableArray alloc] initWithCapacity:20];
    babyMilestone *tempItem;
    for (tempItem in self.childSelected.items)
    {
        if (tempItem.date ==nil)
        {   //Build new placeholder array
             [tempArray addObject:tempItem];
        }
    }
     //Remove from items array
    [self.childSelected.items removeObjectsInArray:tempArray];
    
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"date" ascending:YES];
    [self.childSelected.items sortUsingDescriptors:[NSMutableArray arrayWithObject:sortDescriptor]];
    [self.childSelected.items addObjectsFromArray:tempArray];
    
}

-(void)editItemViewController:(EditItemViewController *)controller didFinishEditingItem:(babyMilestone *)babyItem
{
    // If the newitem property = yes, this item was added via the add item view controller
    if (babyItem.newItem == YES)
    //It's no longer new, so change the property to no
        {       babyItem.newItem =NO;
                [self.childSelected.items addObject:babyItem];
        }

    [self sortArray];
    [self.babyCollectionView reloadData];
    //[self dismissViewControllerAnimated:YES completion:nil];
    [self.navigationController popViewControllerAnimated:YES];
    
}

////Delegate Method for Add Child View Controller
//-(void)addChildViewController:(AddChildViewController *)controller didFinishEditingItem:(Child *)childToUpdate {
//    self.childSelected.name = childToUpdate.name;
//    self.childSelected.birthday = childToUpdate.birthday;
//    self.childSelected.childPhotoId = childToUpdate.childPhotoId;
//    [self.navigationController popViewControllerAnimated:YES];
//}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"EditItem"])
    {
        NSArray *indexPaths = [self.babyCollectionView indexPathsForSelectedItems];
        NSIndexPath *indexPath = [indexPaths objectAtIndex:0];
        babyMilestone *babyItem = [self.childSelected.items objectAtIndex:indexPath.item];
        //selectedIndex = indexPath;
        //'UINavigationController *navigationController = segue.destinationViewController;
        //        AddItemViewController *controller = (AddItemViewController *)navigationController.topViewController;
        EditItemViewController *controller = segue.destinationViewController;
        controller.delegate = self;
        controller.itemToEdit = babyItem;
    }
    else if([segue.identifier isEqualToString:@"NewItem"])
    {
        EditItemViewController *controller = segue.destinationViewController;
        controller.delegate = self;
        controller.itemToEdit = nil; 

    }
    else if ([segue.identifier isEqualToString:@"EditChildData"])
        {
            UINavigationController *navigationController = segue.destinationViewController;
            AddChildViewController *controller = (AddChildViewController *) navigationController.topViewController;
            controller.childToEdit = sender;
            controller.dataModel = self.dataModel; 
        }

              
}
- (void)viewDidUnload {
    [super viewDidUnload];
}
- (IBAction)launchDialog:(id)sender {
    [self launchDialog];
}


@end
