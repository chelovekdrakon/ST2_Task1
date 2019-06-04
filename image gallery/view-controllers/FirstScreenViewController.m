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
    
    self.title = @"Image Gallery";
    
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

- (void)handleCustomViewPress:(CustomView *)customView {
    NSLog(@"CustomView have been pressed: %@", customView);
}

- (void)handleAddPress:(id)sender {
    BlockHandler onCustomViewPress = ^void(CustomView *customView) {
        NSLog(@"CustomView have been pressed: %@", customView);
    };
    
    SecondScreenViewController *vc = [[SecondScreenViewController alloc] initWithHandler:^void (CustomImage *imageView) {
        [self.mainScrollView addSubview:imageView];
        
        CustomView *customView = [[CustomView alloc] initWithImage:imageView.image];
        [customView setHandler:onCustomViewPress];
        
        [self.navigationController popViewControllerAnimated:YES];
    }];
    
    vc.view.backgroundColor = [UIColor whiteColor];
    
    [self.navigationController pushViewController:vc animated:YES];
}

@end
