//
//  SecondScreenViewController.m
//  image gallery
//
//  Created by Фёдор Морев on 6/1/19.
//  Copyright © 2019 Фёдор Морев. All rights reserved.
//

#import "SecondScreenViewController.h"

@interface SecondScreenViewController ()
@property(nonatomic, strong) NSURL *imageUrl;
@end

@implementation SecondScreenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Select Item";
    
//    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    CGSize controllerSize = self.view.frame.size;
    NSString *urlStr = [NSString stringWithFormat:@"https://picsum.photos/%i/%i", (int)controllerSize.width, 100];
    _imageUrl = [NSURL URLWithString:urlStr];
    
    
    UIBarButtonItem *barButtonClose = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemStop target:self action:@selector(handleClosePress:)];
    barButtonClose.tintColor = [UIColor redColor];
    self.navigationItem.rightBarButtonItem = barButtonClose;
    
    self.navigationItem.hidesBackButton = YES;
    
    for (int i = 0; i <= 30; i++) {
        NSData *imageData = [NSData dataWithContentsOfURL:_imageUrl];
        UIImage *image = [[UIImage alloc] initWithData:imageData];
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, i * image.size.height, image.size.width, image.size.height)];
        imageView.image = image;
        [self.view addSubview:imageView];
        NSLog(@"");
    }
    
    
}

- (void)handleClosePress:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
