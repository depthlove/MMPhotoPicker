//
//  ViewController.m
//  MMPhotoPickerDemo
//
//  Created by LEA on 2017/11/10.
//  Copyright © 2017年 LEA. All rights reserved.
//

#import "ViewController.h"
#import "MMPhotoPickerController.h"

@interface ViewController ()<MMPhotoPickerDelegate>
{
    UIView *contentView;
    NSMutableArray *imageArray;
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Demo";

    // 选择图片
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake((self.view.width-100)/2, 50, 100, 44)];
    btn.backgroundColor = [UIColor lightGrayColor];
    btn.centerX = btn.centerX - 70;
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn setTitle:@"选择图片" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(pickerClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    // 保存图片到自定义相册
    btn = [[UIButton alloc] initWithFrame:CGRectMake((self.view.width-100)/2, 50, 100, 44)];
    btn.backgroundColor = [UIColor lightGrayColor];
    btn.centerX = btn.centerX + 70;
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn setTitle:@"保存图片" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(saveClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    contentView = [[UIView alloc] initWithFrame:CGRectMake(10, btn.bottom+50, self.view.width-20, self.view.height-btn.bottom-50)];
    contentView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:contentView];
    
    imageArray = [[NSMutableArray alloc] init];
}

#pragma mark - click
- (void)pickerClicked
{
    MMPhotoPickerController *mmVC = [[MMPhotoPickerController alloc] init];
    mmVC.delegate = self;
    mmVC.showEmptyAlbum = YES;
    mmVC.maximumNumberOfImage = 9;
    UINavigationController *mmNav = [[UINavigationController alloc] initWithRootViewController:mmVC];
    [mmNav.navigationBar setBackgroundImage:[UIImage imageNamed:@"default_bar"] forBarMetrics:UIBarMetricsDefault];
    mmNav.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor whiteColor],NSFontAttributeName:[UIFont boldSystemFontOfSize:19.0]};
    mmNav.navigationBar.barStyle = UIBarStyleBlackOpaque;
    mmNav.navigationBar.tintColor = [UIColor whiteColor];
    [self.navigationController presentViewController:mmNav animated:YES completion:nil];
}

- (void)saveClicked
{
    UIImage *image = [UIImage imageNamed:@"IMG_4808.JPG"];
    [MMPhotoUtil writeImageToPhotoAlbum:image];
}

#pragma mark - 代理
- (void)mmPhotoPickerController:(MMPhotoPickerController *)picker didFinishPickingMediaWithInfo:(NSArray *)info
{
    [imageArray removeAllObjects];
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        for (int i = 0; i < [info count]; i ++)  {
            NSDictionary *dict = [info objectAtIndex:i];
            UIImage *image = [dict objectForKey:MMPhotoOriginalImage];
            if (picker.isOrigin) { //原图
                [imageArray addObject:image];
            } else {
                NSData *imageData = UIImageJPEGRepresentation(image,1.0);
                int size = (int)[imageData length]/1024;
                if (size < 100) {
                    imageData = UIImageJPEGRepresentation(image, 0.5);
                } else {
                    imageData = UIImageJPEGRepresentation(image, 0.1);
                }
                image = [UIImage imageWithData:imageData];
                [imageArray addObject:image];
            }
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            [self loadImageListView];
            [picker dismissViewControllerAnimated:YES completion:nil];
        });
    });
}

- (void)mmPhotoPickerControllerDidCancel:(MMPhotoPickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - 显示
- (void)loadImageListView
{
    for(UIView *sub in [contentView subviews]) {
        [sub removeFromSuperview];
    }
    CGFloat X = 0;
    CGFloat Y = 0;
    CGFloat ITEM_W = (self.view.width-20-3*5)/4;
    NSInteger count = 0;
    for (NSInteger i = 0;i < [imageArray count]; i ++)
    {
        UIImageView *imageV = [[UIImageView alloc] initWithFrame:CGRectMake(X, Y, ITEM_W, ITEM_W)];
        imageV.backgroundColor = [UIColor clearColor];
        imageV.image = [imageArray objectAtIndex:i];
        imageV.contentMode = UIViewContentModeScaleAspectFill;
        imageV.contentScaleFactor = [[UIScreen mainScreen] scale];
        imageV.clipsToBounds = YES;
        [contentView addSubview:imageV];
        
        count ++;
        X = (ITEM_W+5)*count;
        if (count !=0 && count%4==0) {
            X = 0;
            count = 0;
            Y += ITEM_W+5;
        }
    }
    
    CGFloat H = Y+ITEM_W;
    if (count%4 == 0) {
        H -= ITEM_W;
    }
}

#pragma mark -
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
