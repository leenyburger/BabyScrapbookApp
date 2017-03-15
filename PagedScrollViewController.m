////
////  PagedScrollViewController.m
////  babyMilestones
////
////  Created by Schnettler Family on 2/22/13.
////  Copyright (c) 2013 Schnettler Family. All rights reserved.
//
//
//#import "PagedScrollViewController.h"
//#import "babyMilestone.h"
//#import <UIKit/UIKit.h>
//
//
//@interface PagedScrollViewController ()
//@property (nonatomic, strong) NSArray *pageImages;
//@property (nonatomic, strong)NSMutableArray *pageViews;
//
//-(void)loadVisiblePages;
//-(void)loadPage:(NSInteger)page;
//-(void)purgePage:(NSInteger)page;
//
//@end
//
//@implementation PagedScrollViewController
//
//- (void)loadPage:(NSInteger)page {
//    if (page < 0 || page >= self.pageImages.count) {
//        // If it's outside the range of what you have to display, then do nothing
//        return;
//    }
//    
//    // Check to see if you've already loaded the view.  If you haven't, then the object in the pageViews array will be an NSNull.
//    UIView *pageView = [self.pageViews objectAtIndex:page];
//    if ((NSNull*)pageView == [NSNull null]) {
//        // If you haven't loaded the view, you need to create a page.  Same size as scroll view, positioned at zeroy y offset, and then offset by the width of a page multiplied by the page number in the x direction.  
//        CGRect frame = self.scrollView.bounds;
//        frame.origin.x = frame.size.width * page;
//        frame.origin.y = 0.0f;
//        
//        // Creates a new UIImageView, sets it up and adds it to the scroll view.  This is the background for the scrapbook page
//        UIImageView *newPageView = [[UIImageView alloc] initWithImage:[self.pageImages objectAtIndex:page]];
//        newPageView.contentMode = UIViewContentModeScaleAspectFit;
//        newPageView.frame = frame;
//        
//        /*Set up the frame and placement of the picture of the kid from babyMilestones. */
//        CGRect babyFrame;
//        babyFrame.origin.x = (frame.size.width/2)-150;
//        babyFrame. origin.y= (frame.size.height /2)-150;
//        babyFrame.size.width = 200;
//        babyFrame.size.height = 100;
//        
//        /*Create a new image subview for the picture of the kid.  This will sit on top of the background view.*/
//        /*First confirm the item has a photo, then show photo*/
//        /*If the number of images does not equal the number of pages this will not work*/
//        UIImageView *babyPicture = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Elephant.png"]];
//       
//        if ([[self.itemsToDisplay objectAtIndex:page] hasPhoto]) {
//            UIImage *photo = [[self.itemsToDisplay objectAtIndex:page] photoImage];
//            babyPicture.image = photo;
//            }
//        
//        babyPicture.frame = babyFrame;
//    
//       // UIImageView *babyPicture = [[UIImageView alloc] initWithImage:[self.itemsToDisplay.image objectAtIndex:page];
//        //babyPicture.backgroundColor = [UIColor redColor];
//        
//        /*Create label with the name of the MilestoneItem*/
//        CGRect labelFrame;
//        labelFrame.origin.x = (frame.size.width/2)-50;
//        labelFrame. origin.y= (frame.size.height /2)-10;
//        labelFrame.size.width = 200;
//        labelFrame.size.height = 50;
//        
//        UILabel *subviewLabel= [[UILabel alloc]init];
//        subviewLabel.frame= labelFrame;
//        subviewLabel.textColor=[UIColor blueColor];
//        subviewLabel.text = @"Hopefully you can see this!";
//        
//        /*Daisy Chain Views by adding subviews as appropriate*/
//        [newPageView addSubview:babyPicture];
//        [newPageView addSubview:subviewLabel];
//        [self.scrollView addSubview:newPageView];
//        
//        // Replace the NSNull in the pageViews array with the view you've just created.  
//        [self.pageViews replaceObjectAtIndex:page withObject:newPageView];
//    }
//}
//- (void)purgePage:(NSInteger)page {
//    if (page < 0 || page >= self.pageImages.count) {
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
//    
//    // Update the page control
//    self.pageControl.currentPage = page;
//    
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
//- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
//    // Load the pages that are now on screen
//    [self loadVisiblePages];
//}
//- (void)viewDidLoad
//{
//    [super viewDidLoad];
//    NSLog(@"In ViewDid Load of Scroll Controller");
//    //Note, this array will have to be dynamic depending on how many entries are in my table. 
//	self.pageImages =   [NSArray arrayWithObjects:
//                        [UIImage imageNamed:@"Elephant.png"],
//                        [UIImage imageNamed:@"eleanor4.png"],
//                        [UIImage imageNamed:@"icons_winter_02.png"],
//                        [UIImage imageNamed:@"icons_winter_03.png"],
//                        nil];
//    
//    NSInteger pageCount = self.pageImages.count;
//  //  NSInteger milestoneCount = self.itemsToDisplay.count;
//    
//    // Tell the page control how many pages there are, and that it should start on page 0.  
//    self.pageControl.currentPage = 0;
//    self.pageControl.numberOfPages = pageCount;
//    
//    // Set up the array that holds the UIImageView instances.   [NSNull null] is a lightweight singleton object that can be added to an array to signify a placeholder. We are doing "lazy loading" so we only load three pages (visible and +/- at a time).
//    self.pageViews = [[NSMutableArray alloc] init];
//    for (NSInteger i = 0; i < pageCount; ++i) {
//        [self.pageViews addObject:[NSNull null]];
//    }
//}
//
//- (void)viewWillAppear:(BOOL)animated {
//    [super viewWillAppear:animated];
//    
//    // Scroll view needs to know its content size.  The width is the # of pages time the width of the scroll view.  
//    CGSize pagesScrollViewSize = self.scrollView.frame.size;
//    self.scrollView.contentSize = CGSizeMake(pagesScrollViewSize.width * self.pageImages.count, pagesScrollViewSize.height);
//    
//    // Initial pages
//    [self loadVisiblePages];
//}
//
//- (void)didReceiveMemoryWarning
//{
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}
//
//@end
