//
//  CustomImage.h
//  image gallery
//
//  Created by Фёдор Морев on 6/4/19.
//  Copyright © 2019 Фёдор Морев. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CustomImage : UIImageView
@property(nonatomic, strong) NSString *imageDescription;
- (id)initWithUrl:(NSURL *)url;
@end

NS_ASSUME_NONNULL_END
