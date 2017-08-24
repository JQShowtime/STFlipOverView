//
//  STFlipOverItem.m
//  breaknews
//
//  Created by Showtime on 2017/8/24.
//  Copyright © 2017年 Showtime. All rights reserved.
//

#import "STFlipOverItem.h"

@interface STFlipOverItem ()<NSCopying>

@end

@implementation STFlipOverItem

+ (instancetype)itemWithText:(NSString *)text
           andItemTapHandler:(STFlipOverItemTapHandler)tapHandler{
    STFlipOverItem *item = [STFlipOverItem new];
    item.text = text;
    item.tapHandler = [tapHandler copy];
    return item;
}

- (instancetype)copyWithZone:(NSZone *)zone{
    STFlipOverItem *item = [[STFlipOverItem allocWithZone:zone] init];
    item.text = self.text;
    item.tapHandler = [self.tapHandler copy];
    return self;
}

@end
