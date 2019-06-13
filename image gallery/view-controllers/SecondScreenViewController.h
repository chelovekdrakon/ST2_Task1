//
//  SecondScreenViewController.h
//  image gallery
//
//  Created by Фёдор Морев on 6/3/19.
//  Copyright © 2019 Фёдор Морев. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "CustomImage.h"


@interface SecondScreenViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIScrollView *mainScrollView;
- (id)initWithHandler:(void (^)(CustomImage *))onImagePress;
@end

