//
//  ViewController.m
//  image gallery
//
//  Created by Фёдор Морев on 6/1/19.
//  Copyright © 2019 Фёдор Морев. All rights reserved.
//

#import "FirstScreenViewController.h"
#import "SecondScreenViewController.h"

@interface FirstScreenViewController ()

@end

@implementation FirstScreenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Image Gallery";
    
    UIBarButtonItem *barButtonAdd = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(handleAddPress:)];
    barButtonAdd.tintColor = [UIColor redColor];
    self.navigationItem.rightBarButtonItem = barButtonAdd;
}

- (void)handleAddPress:(id)sender {
    SecondScreenViewController *vc = [[SecondScreenViewController alloc] init];
    vc.view.backgroundColor = [UIColor whiteColor];
    
    [self.navigationController pushViewController:vc animated:YES];
}

@end
