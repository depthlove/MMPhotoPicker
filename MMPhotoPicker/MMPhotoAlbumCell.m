//
//  MMPhotoAlbumCell.m
//  MMPhotoPickerDemo
//
//  Created by LEA on 2017/11/10.
//  Copyright © 2017年 LEA. All rights reserved.
//

#import "MMPhotoAlbumCell.h"
#import "MMPhotoPickerConst.h"

@implementation MMPhotoAlbumCell

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.imageView.contentMode = UIViewContentModeScaleAspectFill;
    self.imageView.contentScaleFactor = [UIScreen mainScreen].scale;
    self.imageView.clipsToBounds = YES;
    self.imageView.frame = CGRectMake(0, 0, kRowHeight, kRowHeight);
    self.textLabel.frame = CGRectMake(self.imageView.right+10, 0, self.width-kRowHeight-40, kRowHeight);
    self.separatorInset = UIEdgeInsetsZero;
}

@end
