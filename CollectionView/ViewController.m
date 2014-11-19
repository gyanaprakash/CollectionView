//
//  ViewController.m
//  CollectionView
//
//  Created by Bsetecip10 on 18/11/14.
//  Copyright (c) 2014 gyana. All rights reserved.
//

#import "ViewController.h"
#import "CSCell.h"

@interface ViewController ()
{
    NSArray *collectionTitle;
    NSArray *imgArray;
     UIImagePickerController *image;
     NSArray *assets;
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    ALAssetsLibrary* library = [[ALAssetsLibrary alloc] init];
    
    [library enumerateGroupsWithTypes:ALAssetsGroupAll usingBlock:^(ALAssetsGroup *group, BOOL *stop) {
        if (group) {

            [group setAssetsFilter:[ALAssetsFilter allPhotos]];
            [group enumerateAssetsUsingBlock:^(ALAsset *asset, NSUInteger index, BOOL *stop){
                if (asset){
                    NSLog(@"%@",asset);
                    assets= [NSArray arrayWithObject:asset];

                   // NSDictionary *meta = [[asset defaultRepresentation] metadata];
                   // assets=[meta di];
                   // NSLog(@"%@",asset);
                }
            }];
        }
    } failureBlock:^(NSError *error) {
        NSLog(@"error enumerating AssetLibrary groups %@\n", error);
    }];
    
    
    imgArray = @[@"download (1).jpeg",@"download (2).jpeg",@"download (3).jpeg",@"download (4).jpeg",@"download (5).jpeg",@"download (6).jpeg",@"download (7).jpeg",@"download.jpeg",@"images (1).jpeg",@"images (3).jpeg",@"images (16).jpeg",@"images (13).jpeg",@"download (1).jpeg",@"download (2).jpeg",@"download (3).jpeg",@"download (4).jpeg",@"download (5).jpeg",@"download (6).jpeg",@"download (7).jpeg",@"download.jpeg",@"images (1).jpeg",@"images (3).jpeg",@"images (16).jpeg",@"images (13).jpeg",@"download (1).jpeg",@"download (2).jpeg",@"download (3).jpeg",@"download (4).jpeg",@"download (5).jpeg",@"download (6).jpeg",@"download (7).jpeg",@"download.jpeg",@"images (1).jpeg",@"images (3).jpeg",@"images (16).jpeg",@"images (13).jpeg",@"download (1).jpeg",@"images (9).jpeg",@"download (3).jpeg",@"download (4).jpeg",@"download (5).jpeg",@"download (6).jpeg",@"download (7).jpeg",@"download.jpeg",@"images (1).jpeg",@"images (14).jpeg",@"images (16).jpeg",@"images (13).jpeg",@"download (1).jpeg",@"download (2).jpeg",@"download (3).jpeg",@"download (4).jpeg",@"download (5).jpeg",@"download (6).jpeg",@"download (7).jpeg",@"download.jpeg",@"images (1).jpeg",@"images (3).jpeg",@"images (8).jpeg",@"images (13).jpeg",@"download (1).jpeg",@"download (2).jpeg",@"download (3).jpeg",@"download (4).jpeg",@"download (5).jpeg",@"download (6).jpeg",@"download (7).jpeg",@"download.jpeg",@"images (1).jpeg",@"images (3).jpeg",@"images (16).jpeg",@"images (13).jpeg"];
    [self.cv registerNib:[UINib nibWithNibName:@"CSCell" bundle:nil] forCellWithReuseIdentifier:@"cell"];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

//*********************************************************************************************************

+ (ALAssetsLibrary *)defaultAssetsLibrary
{
    static dispatch_once_t pred = 0;
    static ALAssetsLibrary *library = nil;
    dispatch_once(&pred, ^{
        library = [[ALAssetsLibrary alloc] init];
    });
    return library;
}

//*********************************************************************************************************

- (NSInteger)collectionView:(UICollectionView *)view numberOfItemsInSection:(NSInteger)section
{
    return imgArray.count;
}

- (NSInteger)numberOfSectionsInCollectionView: (UICollectionView *)collectionView
{
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)cv cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CSCell *cell = [_cv dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
 
    [cell.imageView setImage:[UIImage imageNamed:[imgArray objectAtIndex:indexPath.row]]];
    [cell.xyz setText:[imgArray objectAtIndex:indexPath.row]];
    return cell;
}

// *********************************************************************************************************

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
