//
//  STFlipOverItem.h
//  breaknews
//
//  Created by Showtime on 2017/8/24.
//  Copyright © 2017年 Showtime. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^STFlipOverItemTapHandler)();

@interface STFlipOverItem : NSObject

@property(copy, nonatomic) NSString *text;
@property(copy, nonatomic) STFlipOverItemTapHandler tapHandler;

+ (instancetype)itemWithText:(NSString *)text
           andItemTapHandler:(STFlipOverItemTapHandler)tapHandler;

@end
