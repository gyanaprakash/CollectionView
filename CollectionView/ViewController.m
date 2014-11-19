//
//  ViewController.m
//  CollectionView
//
//  Created by Bsetecip10 on 18/11/14.
//  Copyright (c) 2014 gyana. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    NSArray *collectionTitle;
}
@end

@implementation ViewController

- (void)viewDidLoad
{

    [_cv registerClass:[CSCell class] forCellWithReuseIdentifier:@"CSCell"];
    

    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

//*********************************************************************************************************

- (NSInteger)collectionView:(UICollectionView *)view numberOfItemsInSection:(NSInteger)section {
    return 100;
}

- (NSInteger)numberOfSectionsInCollectionView: (UICollectionView *)collectionView {
    return 1;
}
// 3
- (UICollectionViewCell *)collectionView:(UICollectionView *)cv cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = (CSCell*)[_cv dequeueReusableCellWithReuseIdentifier:@"CSCell" forIndexPath:indexPath];
    [cell setBackgroundColor:[UIColor greenColor]];
    cell.backgroundView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@""]];
    
    return cell;
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(60, 60);
}
// *********************************************************************************************************

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
