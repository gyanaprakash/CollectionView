//
//  ViewController.m
//  CollectionView
//
//  Created by Bsetecip10 on 18/11/14.
//  Copyright (c) 2014 gyana. All rights reserved.
//

#import "ViewController.h"
#import "CSCell.h"

// *********************************************************************************************************

@interface ViewController ()
{
    ALAssetsLibrary *library;
     NSArray *assets;
    NSArray *imgArray;
}
@end

@implementation ViewController

// *********************************************************************************************************

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.cv registerNib:[UINib nibWithNibName:@"CSCell" bundle:nil] forCellWithReuseIdentifier:@"cell"];

   // imgArray = @[@"download (1).jpeg",@"download (2).jpeg",@"download (3).jpeg",@"download (4).jpeg",@"download (5).jpeg",@"download (6).jpeg",@"download (7).jpeg",@"download.jpeg",@"images (1).jpeg",@"images (3).jpeg",@"images (16).jpeg",@"images (13).jpeg",@"download (1).jpeg",@"download (2).jpeg",@"download (3).jpeg",@"download (4).jpeg",@"download (5).jpeg",@"download (6).jpeg",@"download (7).jpeg",@"download.jpeg",@"images (1).jpeg",@"images (3).jpeg",@"images (16).jpeg",@"images (13).jpeg"];
    
}

// *********************************************************************************************************

-(void)photos
{
    NSMutableArray *tmpAssets = [@[] mutableCopy];
    library = [[ALAssetsLibrary alloc] init];
    [library enumerateGroupsWithTypes:ALAssetsGroupAll usingBlock:^(ALAssetsGroup *group, BOOL *stop) {
        if (group) {
            [group setAssetsFilter:[ALAssetsFilter allAssets]];
            [group enumerateAssetsUsingBlock:^(ALAsset *asset, NSUInteger index, BOOL *stop){
                if (asset)
                {
                    [tmpAssets addObject:asset];
                    assets = [tmpAssets mutableCopy];
                    [_cv reloadData];
                }
                NSLog(@"%lu",(unsigned long)[assets count]);

            }];
        }
    } failureBlock:^(NSError *error) {
        NSLog(@"error enumerating AssetLibrary groups %@\n", error);
    }];
}

//*********************************************************************************************************

- (NSInteger)collectionView:(UICollectionView *)view numberOfItemsInSection:(NSInteger)section
{
    NSLog(@"%lu",(unsigned long)[assets count]);

    return assets.count;
}

// *********************************************************************************************************

- (NSInteger)numberOfSectionsInCollectionView: (UICollectionView *)collectionView
{
    return 1;
}

// *********************************************************************************************************

- (UICollectionViewCell *)collectionView:(UICollectionView *)cv cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CSCell *cell = [_cv dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    [cell.imageView setImage:[UIImage imageWithCGImage:[[assets objectAtIndex:indexPath.row] thumbnail]]];
    return cell;
}

// *********************************************************************************************************

- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%@",[assets objectAtIndex:indexPath.row]);
    [self.imagevw setFrame:[[UIScreen mainScreen] bounds]];
    [self.view addSubview:self.imagevw];
    [self.imageVwimg setImage:[UIImage imageWithCGImage:[[assets objectAtIndex:indexPath.row] thumbnail]]];
    return indexPath.row;
}

// *********************************************************************************************************




// *********************************************************************************************************

- (IBAction)okClick:(UIButton *)sender {
    [self.imagevw removeFromSuperview];
}

// *********************************************************************************************************

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
