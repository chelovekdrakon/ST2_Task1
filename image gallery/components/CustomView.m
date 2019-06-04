//
//  CustomView.m
//  image gallery
//
//  Created by Фёдор Морев on 6/4/19.
//  Copyright © 2019 Фёдор Морев. All rights reserved.
//

#import "CustomView.h"

typedef void (^BlockHandler)(id);

@interface CustomView()
@property (nonatomic, copy) void (^onPressBlock)(CustomView *);
@end

@implementation CustomView

- (id)initWithImage:(UIImage *)image {
    return [[NSString alloc] init];
}

- (id)initWithImage:(UIImage *)image description:(NSString *)description andPressHandler:(void (^)(CustomView *))onPressBlock {
    self = [super initWithImage:(UIImage *)image];
    
    if (self) {
        _onPressBlock = onPressBlock;
    }
    
    return self;
}

- (void)setHandler:(void (^)(CustomView *))onPressBlock {
    _onPressBlock = onPressBlock;
}

@end


/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */
