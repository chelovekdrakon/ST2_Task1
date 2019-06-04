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
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]
                                          initWithTarget:self
                                          action:@selector(handleScrollViewPress:)
                                          ];
    [scrollView addGestureRecognizer:tapGesture];
    
    [self.view addSubview:scrollView];
    _mainScrollView = scrollView;
}

- (void)handleScrollViewPress:(id)sender {
    self.navigationItem.title = @"Image Gallery";
}

- (void)handleCustomViewPress:(id)sender {
    CustomView *customView = (CustomView *)[sender view];
    self.navigationItem.title = customView.imageDescription;
}

- (void)handleAddPress:(id)sender {
      SecondScreenViewController *vc = [[SecondScreenViewController alloc] initWithHandler:^void (CustomImage *imageView) {
          CustomView *customView = [[CustomView alloc]
                                    initWithImage:imageView.image andDescription:imageView.imageDescription];
        
          UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]
                                                initWithTarget:self
                                                action:@selector(handleCustomViewPress:)
                                                ];
          customView.userInteractionEnabled = YES;
          [customView addGestureRecognizer:tapGesture];
          customView.center = self.mainScrollView.center;
        
          [self.mainScrollView addSubview:customView];
        
          [self.navigationController popViewControllerAnimated:YES];
    }];
    
    vc.view.backgroundColor = [UIColor whiteColor];
    
    [self.navigationController pushViewController:vc animated:YES];
}

@end
