//
//  ChildNavigation.m
//  babyMilestones
//
//  Created by silveroak on 7/28/15.
//  Copyright (c) 2015 Schnettler Family. All rights reserved.
//

#import "ChildNavigation.h"
#import "SWRevealViewController.h"
#import "ChildCell.h"
#import "Child.h"
#import "babyMilestonesViewController.h"
#import "babyMilestone.h"
#import "DataModel.h"
#import "AddChildViewController.h"
#import "UIImage+Resize.h"
#import "UIImage+ResizeMagick.h"

@implementation ChildNavigation


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataModel.children.count+1;//Fill the table view with the number of children then a row to add a child
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"CellForNavigation";
    NSLog(@"Index Path is %ld", (long)indexPath.row);
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]
                initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    if (indexPath.row == self.dataModel.children.count) {//If it's the last row (remember indexPath starts at 0)
        cell.textLabel.text = @"Add Child";
    }
    else {
        Child *child = [self.dataModel.children objectAtIndex:indexPath.row];
        cell.textLabel.text = child.name;
        [self placeChildPhoto:child inCircle:cell];
        //cell.textLabel.text = [NSString stringWithFormat:@"%d: %@", child.itemId, child.name];
    }
    
    return cell;
    }

-(void)placeChildPhoto:(Child *)child inCircle:(UITableViewCell *)cell {
    if([child hasPhoto]){
        UIImage *childImage = [child photoImage];
        UIImage *thumbnail = [childImage resizedImageByMagick:@"36x36#"];
        [cell.imageView.layer setBorderColor:[[UIColor whiteColor] CGColor]];
        [cell.imageView.layer  setBorderWidth:1.0];
        [cell.imageView.layer  setCornerRadius:18];
        [cell.imageView.layer  setMasksToBounds:YES];
         cell.imageView.image = thumbnail;
        

    }

}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"Add Child"]) {
        UINavigationController *navigationController = segue.destinationViewController;
        AddChildViewController *controller = (AddChildViewController *)navigationController.topViewController;
       // AddChildViewController *controller = segue.destinationViewController;
        controller.dataModel = self.dataModel;
    }
    else if ([segue.identifier isEqualToString:@"SelectChild"]) {
        UINavigationController *navigationController = segue.destinationViewController;
        babyMilestonesViewController *controller = (babyMilestonesViewController *)navigationController.topViewController;
        controller.childSelected = sender;
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //Open add child screen with information pre-filled in.
    if (indexPath.row == self.dataModel.children.count){//Add Child was selected
        [self performSegueWithIdentifier:@"Add Child" sender:nil];
    }
    else {
        Child *childSelected = [self.dataModel.children objectAtIndex:indexPath.row];
        [self performSegueWithIdentifier:@"SelectChild" sender:childSelected];
    }
    
    
}
//-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
//    static NSString *CellIdentifier = @"ChildCell";
//    ChildCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
//    Child *child = [self.dataModel.children objectAtIndex:indexPath.item];
//    cell.childName.text = child.name;
//    //cell.childBirthday
//    //cell.childPicture
//    return cell;
//}

//-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
//{
//    NSArray *indexPaths = [self.collectionView indexPathsForSelectedItems];
//    NSIndexPath *indexPath = [indexPaths objectAtIndex:0];
//    Child *childSelected = [self.dataModel.children objectAtIndex:indexPath.item];
//    babyMilestonesViewController *controller = segue.destinationViewController;
//    controller.childSelected = childSelected;
//}


@end
