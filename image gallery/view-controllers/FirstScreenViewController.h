//
//  ViewController.h
//  image gallery
//
//  Created by Фёдор Морев on 6/1/19.
//  Copyright © 2019 Фёдор Морев. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomView.h"

@interface FirstScreenViewController : UIViewController <CustomViewDelegate>
@property(weak, nonatomic) UIScrollView* mainScrollView;

- (void)handleCustomViewMovement:(CustomView *)view;
@end

