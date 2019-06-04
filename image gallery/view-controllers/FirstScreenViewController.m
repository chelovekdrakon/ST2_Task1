//
//  ViewController.m
//  image gallery
//
//  Created by Фёдор Морев on 6/1/19.
//  Copyright © 2019 Фёдор Морев. All rights reserved.
//

#import "FirstScreenViewController.h"
#import "SecondScreenViewController.h"
#import "CustomView.h"
#import "CustomImage.h"


typedef void (^BlockHandler)(id);

@implementation FirstScreenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"Image Gallery";
    
    UIBarButtonItem *barButtonAdd = [[UIBarButtonItem alloc]
                                     initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                     target:self
                                     action:@selector(handleAddPress:)];
    barButtonAdd.tintColor = [UIColor redColor];
    self.navigationItem.rightBarButtonItem = barButtonAdd;
    
    CGSize controllerSize = self.view.frame.size;
    
    UIScrollView *scrollView = [[UIScrollView alloc]
                                initWithFrame:CGRectMake(0, 0, controllerSize.width, controllerSize.height)];
    scrollView.contentSize = controllerSize;
    scrollView.userInteractionEnabled = YES;
    
    [self.view addSubview:scrollView];
    _mainScrollView = scrollView;
}

- (void)handleCustomViewPress:(id)sender {
    CustomView *customView = (CustomView *)[sender view];
    self.navigationItem.title = customView.imageDescription;
    NSLog(@"CustomView have been pressed: %@", customView);
}

- (void)handleAddPress:(id)sender {
    BlockHandler onCustomViewPress = ^void(CustomView *customView) {
        NSLog(@"CustomView have been pressed: %@", customView);
        self.navigationController.title = customView.imageDescription;
    };
    
    SecondScreenViewController *vc = [[SecondScreenViewController alloc] initWithHandler:^void (CustomImage *imageView) {
        CustomView *customView = [[CustomView alloc] initWithImage:imageView.image description:imageView.imageDescription andPressHandler:onCustomViewPress];
        
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]
                                              initWithTarget:self
                                              action:@selector(handleCustomViewPress:)
                                              ];
        customView.userInteractionEnabled = YES;
//        [imageView setTag:index];
        [customView addGestureRecognizer:tapGesture];
        
        [self.mainScrollView addSubview:customView];
        
        [self.navigationController popViewControllerAnimated:YES];
    }];
    
    vc.view.backgroundColor = [UIColor whiteColor];
    
    [self.navigationController pushViewController:vc animated:YES];
}

@end
