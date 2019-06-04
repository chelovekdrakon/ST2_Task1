//
//  CustomView.h
//  image gallery
//
//  Created by Фёдор Морев on 6/4/19.
//  Copyright © 2019 Фёдор Морев. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface CustomView : UIImageView
@property(nonatomic, strong) NSString *imageDescription;
- (id)initWithImage:(UIImage *)image andDescription:(NSString *)description;
@end

