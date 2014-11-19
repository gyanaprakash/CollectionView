//
//  ViewController.h
//  CollectionView
//
//  Created by Bsetecip10 on 18/11/14.
//  Copyright (c) 2014 gyana. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CSCell.h"

@interface ViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@property (weak, nonatomic) IBOutlet UICollectionView *cv;
//@property (strong, nonatomic) IBOutlet UICollectionViewCell *cell;

@end

