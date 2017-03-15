//
//  AllChildViewController.m
//  babyMilestones
//
//  Created by silveroak on 7/22/15.
//  Copyright (c) 2015 Schnettler Family. All rights reserved.
//

#import "AllChildViewController.h"
#import "ChildCell.h"
#import "Child.h"
#import "babyMilestonesViewController.h"
#import "babyMilestone.h"
#import "DataModel.h"

@interface AllChildViewController ()

@end

@implementation AllChildViewController

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataModel.children.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"ChildCell";
    ChildCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    Child *child = [self.dataModel.children objectAtIndex:indexPath.item];
    cell.childName.text = child.name;
    //cell.childBirthday
    //cell.childPicture
    return cell;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSArray *indexPaths = [self.collectionView indexPathsForSelectedItems];
    NSIndexPath *indexPath = [indexPaths objectAtIndex:0];
    Child *childSelected = [self.dataModel.children objectAtIndex:indexPath.item];
    babyMilestonesViewController *controller = segue.destinationViewController;
    controller.childSelected = childSelected;
}
@end
