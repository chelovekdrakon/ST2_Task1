//
//  UILoader.h
//  image gallery
//
//  Created by Фёдор Морев on 6/2/19.
//  Copyright © 2019 Фёдор Морев. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILoader : UIActivityIndicatorView
- (id)initWithHandlerBlock:(void (^)(void))handler;
@end
