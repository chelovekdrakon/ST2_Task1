//
//  SecondScreenViewController.m
//  image gallery
//
//  Created by Фёдор Морев on 6/1/19.
//  Copyright © 2019 Фёдор Морев. All rights reserved.
//

#import "SecondScreenViewController.h"

@interface SecondScreenViewController ()

@end

@implementation SecondScreenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // self.navigationItem.backBarButtonItem hidesBackButton
    
    UIBarButtonItem *barButtonClose = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(handleClosePress:)];
    barButtonClose.tintColor = [UIColor redColor];
    self.navigationItem.rightBarButtonItem = barButtonClose;
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
