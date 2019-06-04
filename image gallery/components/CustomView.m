//
//  CustomView.m
//  image gallery
//
//  Created by Фёдор Морев on 6/4/19.
//  Copyright © 2019 Фёдор Морев. All rights reserved.
//

#import "CustomView.h"

@implementation CustomView

- (id)initWithImage:(UIImage *)image description:(NSString *)description {
    self = [super initWithImage:(UIImage *)image];
    
    if (self) {
        _imageDescription = description;
        
        UIPanGestureRecognizer *panRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handleMove:)];
        [panRecognizer setMinimumNumberOfTouches:1];
        [panRecognizer setMaximumNumberOfTouches:1];
        [self addGestureRecognizer:panRecognizer];
    }
    
    return self;
}

- (void)handleMove:(UIPanGestureRecognizer *)sender {
    if (sender.state == UIGestureRecognizerStateBegan) {
        if ([self.delegate respondsToSelector:@selector(handleCustomViewMovement:)]) {
            [self.delegate handleCustomViewMovement:self];
        }
        
    } else if (sender.state == UIGestureRecognizerStateChanged) {
        CGPoint translatedPoint = [sender translationInView:sender.view.superview];
        self.center = CGPointMake(self.center.x + translatedPoint.x,
                                  self.center.y + translatedPoint.y);
        [sender setTranslation:CGPointMake(0, 0) inView:self];
    } else if (sender.state == UIGestureRecognizerStateEnded) {
        
    }
    
    
    
//    NSLog(@"Point, %@", NSStringFromCGPoint(translatedPoint));
}

@end


/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */
