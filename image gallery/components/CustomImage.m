//
//  CustomImage.m
//  image gallery
//
//  Created by Фёдор Морев on 6/4/19.
//  Copyright © 2019 Фёдор Морев. All rights reserved.
//

#import "CustomImage.h"

@implementation CustomImage

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (id)initWithUrl:(NSURL *)url {
    NSData *imageData = [NSData dataWithContentsOfURL:url];
    UIImage *image = [[UIImage alloc] initWithData:imageData];
    
    self = [super init];
    
    if (self) {
        self.image = image;
        self.imageDescription = [url absoluteString];
    }
    
    return self;
}

@end
