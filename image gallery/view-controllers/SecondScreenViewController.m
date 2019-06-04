//
//  SecondScreenViewController.m
//  image gallery
//
//  Created by Фёдор Морев on 6/1/19.
//  Copyright © 2019 Фёдор Морев. All rights reserved.
//

#import "SecondScreenViewController.h"

typedef void (^completionHandler)(NSData *data, NSURLResponse *response, NSError *error);

@interface SecondScreenViewController ()
@property (nonatomic, copy) void (^onImagePress)(CustomImage *);
@property(nonatomic, strong) NSURL *imageURL;
@property(nonatomic, strong) UIActivityIndicatorView *loader;
@property(nonatomic, assign) int imageHeight;
@property(nonatomic, assign) int imagesAmount;
@end

@implementation SecondScreenViewController

- (id)initWithHandler:(void (^)(CustomImage *))onImagePress {
    self = [super init];
    if (self) {
        _onImagePress = onImagePress;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _imageHeight = 100;
    _imagesAmount = 30;
    self.navigationItem.title = @"Select Item";
    
    UIBarButtonItem *barButtonClose = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemStop target:self action:@selector(handleClosePress:)];
    barButtonClose.tintColor = [UIColor redColor];
    self.navigationItem.rightBarButtonItem = barButtonClose;
    
    self.navigationItem.hidesBackButton = YES;
}

- (void)viewDidAppear:(BOOL)animated {
//    UILoader *loader = [[UILoader alloc] initWithHandlerBlock:^void () {
//        [self generateImages];
//        [self.loader stopAnimating];
//    }];
//    loader.color = [UIColor grayColor];
//    loader.center = self.view.center;
//    _loader = loader;
//    [loader startAnimating];
//
//    [self.view addSubview:loader];
    
    CGSize controllerSize = self.view.frame.size;
    CGSize navBarSize = self.navigationController.navigationBar.frame.size;
    
    NSString *urlStr = [NSString stringWithFormat:@"https://picsum.photos/%i/%i", (int)controllerSize.width, _imageHeight];
    _imageURL = [NSURL URLWithString:urlStr];
    
    self.mainScrollView.contentSize = CGSizeMake(controllerSize.width, (_imagesAmount * _imageHeight) + navBarSize.height);
    self.mainScrollView.userInteractionEnabled = YES;
    
    [self generateImages];
}

- (void)viewDidLayoutSubviews {
    
}

-(void)generateImages {
    for (int index = 0; index < _imagesAmount; index++) {
        CustomImage *view = [self generateImageViewForIndex:index];
        [self.mainScrollView addSubview:view];
    }
}

- (void)handleImagePress:(id)sender {
    self.onImagePress((CustomImage *)[sender view]);
}

- (CustomImage *)generateImageViewForIndex:(int)index {
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:_imageURL cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:15.0];
    [request setHTTPMethod:@"HEAD"];
    NSURLResponse *response = nil;
    [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:nil];
    NSURL *finalURL = response.URL;
    
    CustomImage *imageView = [[CustomImage alloc] initWithUrl:finalURL];
    
    NSData *imageData = [NSData dataWithContentsOfURL:finalURL];
    UIImage *image = [[UIImage alloc] initWithData:imageData];

    imageView.frame = CGRectMake(0, index * image.size.height, image.size.width, image.size.height);
    imageView.image = image;
    imageView.imageDescription = [finalURL absoluteString];
    
    UILabel *label = [UILabel new];
    label.text = [finalURL absoluteString];
    [label sizeToFit];
    label.frame = CGRectMake(
                             (image.size.width / 2) - (label.frame.size.width / 2),
                             (image.size.height / 2) - (label.frame.size.height / 2),
                             label.frame.size.width,
                             label.frame.size.height
                             );
    label.textColor = [self randomColor];
    
    [imageView addSubview:label];
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]
                                          initWithTarget:self
                                          action:@selector(handleImagePress:)
                                          ];
    imageView.userInteractionEnabled = YES;
    [imageView setTag:index];
    [imageView addGestureRecognizer:tapGesture];
    
    return imageView;
}

- (UIColor *)randomColor {
    return [UIColor colorWithHue:drand48() saturation:1.0 brightness:1.0 alpha:1.0];
}

- (void)handleClosePress:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
