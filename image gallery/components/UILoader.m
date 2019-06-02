//
//  UILoader.m
//  image gallery
//
//  Created by Фёдор Морев on 6/2/19.
//  Copyright © 2019 Фёдор Морев. All rights reserved.
//

#import "UILoader.h"

@interface UILoader()
@property (nonatomic, copy) void (^handler)(void);
@end

@implementation UILoader

- (id)initWithHandlerBlock:(void (^)(void))handler {
    self = [super init];
    
    if (self) {
        _handler = handler;
    }
    return self;
}

- (void)didMoveToSuperview {
    self.handler();
}

@end
