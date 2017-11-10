//
//  MMPhotoPickerController.h
//  MMPhotoPicker
//
//  Created by LEA on 2017/11/10.
//  Copyright © 2017年 LEA. All rights reserved.
//
//  图库列表

#import <UIKit/UIKit.h>
#import <Photos/Photos.h>
#import "MMPhotoPickerConst.h"

@protocol MMPhotoPickerDelegate;
@interface MMPhotoPickerController : UIViewController

// 主色调[默认蓝色]
@property (nonatomic, strong) UIColor *mainColor;
// 是否回传原图 [可用于控制图片压系数]
@property (nonatomic, assign) BOOL isOrigin;
// 是否显示原图选项 [默认NO]
@property (nonatomic, assign) BOOL showOriginImageOption;
// 是否显示空相册 [默认NO]
@property (nonatomic, assign) BOOL showEmptyAlbum;
// 是否只选取一张 [默认NO]
@property (nonatomic, assign) BOOL singleImageOption;
// 是否选取一张且需要裁剪 [默认NO]
@property (nonatomic, assign) BOOL cropImageOption;
// 裁剪的大小[默认方形、屏幕宽度]
@property (nonatomic, assign) CGSize imageCropSize;
// 最大选择数目[默认9张]
@property (nonatomic, assign) NSInteger maximumNumberOfImage;
// 代理
@property (nonatomic, assign) id<MMPhotoPickerDelegate> delegate;

@end

@protocol MMPhotoPickerDelegate <NSObject>

@optional
- (void)mmPhotoPickerController:(MMPhotoPickerController *)picker didFinishPickingMediaWithInfo:(NSArray *)info;
- (void)mmPhotoPickerControllerDidCancel:(MMPhotoPickerController *)picker;

@end


@interface MMPhotoAlbum : NSObject

// 相册名称
@property (nonatomic,copy) NSString *name;
// 内含图片数量
@property (nonatomic,assign) NSInteger assetCount;
// 封面
@property (nonatomic,strong) PHAsset *coverAsset;
// 相册
@property (nonatomic,strong) PHAssetCollection *collection;


@end
