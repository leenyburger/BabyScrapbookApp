////
////  DatePickerViewController.m
////  babyMilestones
////
////  Created by Schnettler Family on 2/8/13.
////  Copyright (c) 2013 Schnettler Family. All rights reserved.
////
//
//#import "DatePickerViewController.h"
//
//@interface DatePickerViewController ()
//
//@end
//
//@implementation DatePickerViewController
//
//- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
//{
//    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
//    if (self) {
//        // Custom initialization/
//    }
//    return self;
//}
//
//- (void)viewDidLoad
//{
//    [super viewDidLoad];
//	// Do any additional setup after loading the view.
//}
//
//-(void)viewWillAppear:(BOOL)animated
//{
//    [super viewWillAppear:animated];
//    CGRect statusBarRect = [[UIApplication sharedApplication] statusBarFrame];
//    UIImageView *imageView = [[UIImageView alloc] initWithImage:self.backgroundImage];
//    imageView.tag = 6;
//    imageView.center = CGPointMake(imageView.center.x, imageView.center.y - statusBarRect.size.height);
//    [self.view insertSubview:imageView atIndex:0];
//    
//    [self.datePicker setDate:self.date animated:YES];
//    
//
//}
//
//    
//
//-(IBAction)dateChanged
//{
//    self.date = [self.datePicker date];
//}
//
//- (void)didReceiveMemoryWarning
//{
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}
//
//-(IBAction)cancel
//{
//    [self.delegate datePickerDidCancel:self];
//}
//
//-(IBAction) done
//{
//    [self.delegate datePicker:self didPickDate:self.date];
//
//}
//- (void)viewDidUnload {
//    [super viewDidUnload];
//}
//
//- (void)viewWillDisappear:(BOOL)animated {
//    [[self.view viewWithTag:6] removeFromSuperview];
//}
//@end
