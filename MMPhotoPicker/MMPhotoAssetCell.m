//
//  MMPhotoAssetCell.m
//  MMPhotoPicker
//
//  Created by LEA on 2017/11/10.
//  Copyright © 2017年 LEA. All rights reserved.
//

#import "MMPhotoAssetCell.h"

@interface MMPhotoAssetCell ()

@property (nonatomic,strong) UIImageView *imageView;
@property (nonatomic,strong) UIImageView *overLay;

@end

@implementation MMPhotoAssetCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor greenColor];
        [self addSubview:self.imageView];
        [self addSubview:self.overLay];
        self.overLay.hidden = YES;
    }
    return self;
}

#pragma mark - getter
- (UIImageView *)imageView
{
    if (!_imageView) {
        _imageView = [[UIImageView alloc] initWithFrame:self.bounds];
        _imageView.layer.masksToBounds = YES;
        _imageView.clipsToBounds = YES;
        _imageView.contentMode = UIViewContentModeScaleAspectFill;
        _imageView.contentScaleFactor = [[UIScreen mainScreen] scale];
    }
    return _imageView;
}

- (UIImageView *)overLay
{
    if (!_overLay) {
        _overLay = [[UIImageView alloc] initWithFrame:self.bounds];
        _overLay.image = [UIImage imageNamed:MMPhotoPickerSrcName(@"mmphoto_overlay")];
    }
    return _overLay;
}

#pragma mark - setter
- (void)setSelected:(BOOL)selected
{
    self.overLay.hidden = !selected;
}

- (void)setAsset:(PHAsset *)asset
{
    [MMPhotoUtil getImageWithAsset:asset size:self.imageView.size completion:^(UIImage *image) {
        self.imageView.image = image;
    }];
}


@end
