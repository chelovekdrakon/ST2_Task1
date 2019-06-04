//
//  CustomView.m
//  image gallery
//
//  Created by Фёдор Морев on 6/4/19.
//  Copyright © 2019 Фёдор Морев. All rights reserved.
//

#import "CustomView.h"

@implementation CustomView

- (id)initWithImage:(UIImage *)image andDescription:(NSString *)description {
    self = [super initWithImage:(UIImage *)image];
    
    if (self) {
        _imageDescription = description;
    }
    
    return self;
}

@end


/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */
