////
////  BookViewController.m
////  babyMilestones
////
////  Created by Schnettler Family on 3/7/13.
////  Copyright (c) 2013 Schnettler Family. All rights reserved.
////
//
//#import "BookViewController.h"
//
//@implementation BookViewController
//
//
//- (void)viewDidLoad
//{
//    [super viewDidLoad];
////    [self.view setBackgroundColor:[UIColor whiteColor]];
////    /******Set up the Background Image******/
////    self.backgroundView=[[UIImageView alloc] initWithImage:[UIImage imageNamed:self.model.backgroundImageName]];
////    [self.view addSubview:self.backgroundView];
////    /******Set up the Baby Image ******/
////    CGRect insetFrame = CGRectMake(79,200,163,157);
////    self.imageView = [[UIImageView alloc] initWithFrame:insetFrame];
////    self.imageView.backgroundColor = [UIColor clearColor];
////    [self.imageView setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight];
////    
////    if ([self.model hasPhoto1]) {
////        UIImage *photo = [self.model photoImage1];
////        NSLog(@"Height %f", photo.size.height);
////        NSLog (@"Width %f", photo.size.width);
////        self.imageView.image = photo;
////       
//////        [self createPostcard:photo];
////    }
////    [self.view addSubview:self.imageView];
////    
////    
////    /******Set up the Label*******/
////    if (self.model.indexNumber ==1)
////    {
////        self.imageLabel = [[UILabel alloc] initWithFrame:CGRectMake(79,300,150,21)];
////        self.imageLabel.textColor = [UIColor blackColor];
////        [self.imageLabel setFont:[UIFont boldSystemFontOfSize:20]];
////        [self.imageLabel setAutoresizingMask:UIViewAutoresizingFlexibleWidth];
////        [self.imageLabel setTextAlignment:NSTextAlignmentCenter];
////        self.imageLabel.text = self.model.text;
////        [self.view addSubview:self.imageLabel];
////    }
////     else if (self.model.indexNumber == 2)
////{
////    self.imageLabel = [[UILabel alloc] initWithFrame:CGRectMake(200,400,150,21)];
////    self.imageLabel.textColor = [UIColor greenColor];
////    [self.imageLabel setFont:[UIFont boldSystemFontOfSize:20]];
////    [self.imageLabel setAutoresizingMask:UIViewAutoresizingFlexibleWidth];
////    [self.imageLabel setTextAlignment:NSTextAlignmentCenter];
////    self.imageLabel.text = self.model.text;
////    [self.view addSubview:self.imageLabel];
////}
////    [self createPostcard];
////
////}
//////
////-(void)createPostcard :(UIImage *)backgroundImage
////{
////    UIImage *backgroundImage = [UIImage imageNamed:@"wolf_high_resolution_wallpaper_animal_2.jpg"];
////    CGRect frameRect = CGRectMake(0,0,backgroundImage.size.width, backgroundImage.size.height);
////    UIGraphicsBeginImageContext(backgroundImage.size);
////    [backgroundImage drawInRect:frameRect];
////    NSString *text = @"Testing";
////    [[UIColor whiteColor] set];
////    [text drawInRect:frameRect withFont:[UIFont boldSystemFontOfSize:35.0] lineBreakMode:UILineBreakModeWordWrap];
////    UIImage *postcardImage = UIGraphicsGetImageFromCurrentImageContext();
////    UIGraphicsEndImageContext();
////    //I have an image called postcardImage
////    NSData *imageData = [NSData dataWithData:UIImageJPEGRepresentation(postcardImage,1.0f)];
////    NSString *documentsDirectory = [self.model documentsDirectory];
////    NSString *imagePath = [NSString stringWithFormat:@"%@/test.jpeg",documentsDirectory];
////
////    [imageData writeToFile:imagePath atomically:YES];
////}
////
////- (void)viewDidUnload {
////    [self setDate:nil];
////    [self setImage1:nil];
////    [self setImage2:nil];
////    [self setImage3:nil];
////    [super viewDidUnload];
//
//    
//    
//    if ([self.model.highResImage isEqualToString: @"BabyAp_Firstbath_2.jpg"])
//    {
//        self.model.highResImage = @"BabyAp_FirstBath_2.jpg";
//    }
//    
//    
//    self.backgroundVIEW.image =[UIImage imageNamed:self.model.backgroundImageName];
//    self.description.hidden = YES;
//    
//    if (([self.model.backgroundImageName isEqualToString: @"genericpage.png"]))
//    {   self.description.hidden = NO;
//        self.description.text = self.model.text;
//              
//    }
// 
//    //If the user is using a 4 inch screen
//    CGRect screenBounds = [[UIScreen mainScreen] bounds];
//    if (screenBounds.size.height == 568)
//    {   self.description.frame = CGRectMake(20,10,135,145);
//        self.eventDate.frame = CGRectMake(128,188,184,43);
//        self.pictureFrameLarge.frame = CGRectMake(137,239,175,175);
//        self.image1.frame = CGRectMake(147,249,155,155);
//        self.pictureFrameSmall2.frame = CGRectMake(20, 218,100,100);
//        self.image2.frame = CGRectMake(26,224,89,89);
//        self.pictureFrameSmall3.frame = CGRectMake(20, 337, 100, 100);
//        self.image3.frame = CGRectMake(26, 343, 89,89);
//            
//    } 
//    
//    //If the background image is welcome home and the user has a 3.5 in screen, move the pictures
////    if (([self.model.backgroundImageName isEqualToString:@"wecomehome.png"])&& (screenBounds.size.height!=568))
////    {    self.Date.frame = CGRectMake(123,187, 189, 58);
////        self.pictureFrameLarge.frame = CGRectMake(157, 224, 155, 155);
////        self.image1.frame = CGRectMake(176, 242, 118, 118);
////
////    }
//    
//    self.pictureFrameLarge.hidden = YES;
//    self.pictureFrameSmall2.hidden = YES;
//    self.pictureFrameSmall3.hidden = YES;
//    
//    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
//    [formatter setDateStyle:NSDateFormatterLongStyle];
//    self.eventDate.text = [formatter stringFromDate:self.model.date];
//    
//    //If the background image is white, the frame needs to be teal
//    if (([self.model.backgroundImageName isEqualToString: @"genericpage.png"])|| [self.model.backgroundImageName isEqualToString:@"firstsolidfood_2.png"])
//    {   self.pictureFrameLarge.image = [UIImage imageNamed:@"pictureframe_tealLarge"];
//        self.pictureFrameSmall2.image = [UIImage imageNamed:@"pictureframe_tealSmall"];
//        self.pictureFrameSmall3.image = [UIImage imageNamed:@"pictureframe_tealSmall"];
//    }
//    
//    if ([self.model hasPhoto1]) {
//        UIImage *photo = [self.model photoImage1];
//        self.image1.image = photo;
//        self.pictureFrameLarge.hidden = NO;
//        //image = [UIImage imageNamed:@"pictureframe_lg2.png"];
//        }
//    if ([self.model hasPhoto2]) {
//        UIImage *photo = [self.model photoImage2];
//        self.image2.image = photo;
//        self.pictureFrameSmall2.hidden = NO; 
//        //image = [UIImage imageNamed:@"pictureframe_sm2.png"];
//    }
//    if ([self.model hasPhoto3]) {
//        UIImage *photo = [self.model photoImage3];
//        self.image3.image = photo;
//        self.pictureFrameSmall3.hidden = NO; 
//        //image = [UIImage imageNamed:@"pictureframe_sm2.png"];
//    }
//
//}
//
//
//- (void)viewDidUnload {
//    [self setBackgroundVIEW:nil];
//    [super viewDidUnload];
//}
//@end
