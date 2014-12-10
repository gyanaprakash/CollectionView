//
//  ViewController.h
//  CollectionView
//
//  Created by Bsetecip10 on 18/11/14.
//  Copyright (c) 2014 gyana. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import "CSCell.h"

@interface ViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate>

// *********************************************************************************************************

@property (weak, nonatomic) IBOutlet UICollectionView *cv;
@property (strong, nonatomic) IBOutlet UIView *imagevw;
@property (weak, nonatomic) IBOutlet UIImageView *imageVwimg;

@property (weak, nonatomic) IBOutlet UILabel *imagename;

// *********************************************************************************************************

- (IBAction)okClick:(UIButton *)sender;

@end

