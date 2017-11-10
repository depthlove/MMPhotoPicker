//
//  MMPhotoAssetCell.h
//  MMPhotoPicker
//
//  Created by LEA on 2017/11/10.
//  Copyright © 2017年 LEA. All rights reserved.
//
//  图片Cell

#import <UIKit/UIKit.h>
#import <Photos/Photos.h>
#import "MMPhotoPickerConst.h"

@interface MMPhotoAssetCell : UICollectionViewCell

@property (nonatomic,strong) PHAsset *asset;

@end
