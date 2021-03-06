//
//  JHKStereoImage.m
//  Stereopsis
//
//  Created by Justus Kandzi on 10/09/14.
//  Copyright (c) 2014 Justus Kandzi. All rights reserved.
//

#import "JHKStereoImage.h"
#import <YLGIFImage/YLGIFImage.h>

@interface JHKStereoImage ()
@property (nonatomic) NSString *prefix;
@property (nonatomic) BOOL animated;
@end

@implementation JHKStereoImage

- (instancetype)initWithImagePrefix:(NSString *)prefix animated:(BOOL)animated {
    self = [super init];
    if (self) {
        _prefix = prefix;
        _animated = animated;
    }
    return self;
}

- (UIImage *)leftImage {
    return [self imageWithPostfix:@"L"];
}

- (UIImage *)rightImage {
    return [self imageWithPostfix:@"R"];
}

- (UIImage *)imageWithPostfix:(NSString *)postfix {
    if (self.animated) {
        return [YLGIFImage imageNamed:[NSString stringWithFormat:@"%@%@.gif", self.prefix, postfix]];
    } else {
        return [UIImage imageNamed:[NSString stringWithFormat:@"%@%@", self.prefix, postfix]];
    }
}

@end
