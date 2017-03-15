//
//  DetailViewController.m
//  
//
//  Created by silveroak on 3/22/13.
//
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction) cancel
{
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];

}

-(IBAction) save
{
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

@end
