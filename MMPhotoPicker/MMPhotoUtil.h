//
//  MMPhotoUtil.h
//  MMPhotoPickerDemo
//
//  Created by LEA on 2017/11/10.
//  Copyright © 2017年 LEA. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Photos/Photos.h>
#import <UIKit/UIKit.h>

@interface MMPhotoUtil : NSObject

// 是否开启了相册权限
+ (BOOL)isPhotoAlbumPermit;

// 保存图片到自定义相册
+ (void)writeImageToPhotoAlbum:(UIImage *)image;

// 保存视频到自定义相册
+ (void)writeVideoToPhotoAlbum:(NSURL *)videoURL;

// 获取指定相册中照片
+ (NSArray<PHAsset *> *)getAllAssetWithAssetCollection:(PHAssetCollection *)assetCollection
                                             ascending:(BOOL)ascending;

// 获取asset对应的图片
+ (void)getImageWithAsset:(PHAsset *)asset
                     size:(CGSize)size
               completion:(void (^)(UIImage *image))completion;

// 获取asset对应图片
+ (void)getImageWithAsset:(PHAsset *)asset
               completion:(void (^)(UIImage *image))completion;

@end
