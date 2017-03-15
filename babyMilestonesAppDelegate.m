//
//  babyMilestonesAppDelegate.m
//  babyMilestones
//
//  Created by Schnettler Family on 1/27/13.
//  Copyright (c) 2013 Schnettler Family. All rights reserved.
//

#import "babyMilestonesAppDelegate.h"
#import "Appirater.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import "AllChildViewController.h"
#import "DataModel.h"
#import "AllChildViewController.h"
#import "AddChildViewController.h"
#import "SWRevealViewController.h"
#import "babyMilestonesViewController.h"
#import "ChildNavigation.h"
#import <OLKitePrintSDK.h>


@implementation babyMilestonesAppDelegate
{
    DataModel *_dataModel;
}
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

-(void)saveData
{
    [_dataModel saveBabyMilestoneItems];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    _dataModel = [[DataModel alloc]init];   //Initialize and load the children array
    [OLKitePrintSDK setAPIKey:@"066ec13a500523f07896b8ad49cdedfe2b43f678" withEnvironment:kOLKitePrintSDKEnvironmentSandbox];
    [[UINavigationBar appearance]setBarTintColor:UIColorFromRGB(0xF6546B)];
    [[UINavigationBar appearance] setTitleTextAttributes: [NSDictionary dictionaryWithObjectsAndKeys:[UIColor colorWithRed:255.0/255.0 green:255.0/255.0 blue:255.0/255.0 alpha:1.0], NSForegroundColorAttributeName,nil, NSShadowAttributeName,[UIFont fontWithName:@"Roboto-Medium" size:21.0], NSFontAttributeName, nil]];
    
    if (_dataModel.children.count ==0) {
        NSLog(@"Trying to change the root screen");
        //Open the Add Child View Controller and send it dataModel
        UINavigationController *navigationController = [self.window.rootViewController.storyboard instantiateViewControllerWithIdentifier:@"AddChildNavigationController"];
        AddChildViewController *addChildViewController = (AddChildViewController *)navigationController.topViewController;
        self.window.rootViewController = navigationController;
        
//        self.window.rootViewController = [self.window.rootViewController.storyboard instantiateViewControllerWithIdentifier:@"AddChildViewController"];
//        AddChildViewController *addChildViewController = (AddChildViewController *)self.window.rootViewController;
          addChildViewController.dataModel = _dataModel;
        
    }
    else {
        //SWReveal is the root view controller.  babyMilestones is the main screen loaded with data model information, ChildNavigation is the menu
        SWRevealViewController *swviewcontroller = (SWRevealViewController *)self.window.rootViewController;
        [swviewcontroller loadView]; 
        UINavigationController *navController = (UINavigationController *)swviewcontroller.frontViewController;
        
        babyMilestonesViewController *controller = navController.viewControllers[0];
        //controller.dataModel = _dataModel;
        //UPDATE this with NSUser defaults to remember last child the user was working on
        controller.childSelected = _dataModel.children[0];  //Initially load the first child in the array
        controller.dataModel = _dataModel; 
       
        ChildNavigation *menu = (ChildNavigation *)swviewcontroller.rearViewController;
        menu.dataModel = _dataModel;
    }
    
    
//    NSShadow *shadow = [[NSShadow alloc] init];
//    shadow.shadowColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.0];
//    shadow.shadowOffset = CGSizeMake(0, 1);
//    NSDictionary *attributes = [NSDictionary dictionaryWithObjectsAndKeys:
//                                [UIColor colorWithRed:40.0/255.0 green:97.0/255.0 blue:101.0/255.0 alpha:1.0],NSForegroundColorAttributeName,shadow, NSShadowAttributeName,[UIFont fontWithName:@"AmericanTypewriter" size:21.0],NSFontAttributeName, nil];
//    
//    [[UINavigationBar appearance] setTitleTextAttributes: [NSDictionary dictionaryWithObjectsAndKeys:[UIColor colorWithRed:40.0/255.0 green:97.0/255.0 blue:101.0/255.0 alpha:1.0], NSForegroundColorAttributeName,shadow, NSShadowAttributeName,[UIFont fontWithName:@"Cochin" size:21.0], NSFontAttributeName, nil]];
//    
//    [[UIBarButtonItem appearance] setTitleTextAttributes:attributes
//                                                forState:UIControlStateNormal];
   
        if ([UIApplication instancesRespondToSelector:@selector(registerUserNotificationSettings:)]){
            [application registerUserNotificationSettings:[UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeAlert|UIUserNotificationTypeBadge|UIUserNotificationTypeSound categories:nil]];
        }
        // Override point for customization after application launch.
    [Appirater appLaunched:YES];
    [Appirater setAppId:@"716970768"];    // Change for your "Your APP ID"
    [Appirater setDaysUntilPrompt:0];     // Days from first entered the app until prompt
    [Appirater setUsesUntilPrompt:5];     // Number of uses until prompt
    [Appirater setTimeBeforeReminding:2];
    return YES;
    return [[FBSDKApplicationDelegate sharedInstance] application:application
                                    didFinishLaunchingWithOptions:launchOptions];
}
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    return [[FBSDKApplicationDelegate sharedInstance] application:application openURL:url sourceApplication:sourceApplication annotation:annotation];
}

//Appirater Entered Foreground
-(void)applicationWillEnterForeground:(UIApplication *)application{
    [Appirater appEnteredForeground:YES];
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    [self saveData];
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}



- (void)applicationDidBecomeActive:(UIApplication *)application
{
    //[FBSDKSettings setDefaultAppID:484842354996392];
    [FBSDKAppEvents activateApp];
  
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    [self saveData];
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
