//
//  STFlipOverView.h
//  breaknews
//
//  Created by Showtime on 2017/8/24.
//  Copyright © 2017年 Showtime. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "STFlipOverItem.h"

@interface STFlipOverView : UIView

@property(strong, nonatomic) NSArray<STFlipOverItem *> *itemList;
@property(strong, nonatomic) UIColor *textColor;
@property(strong, nonatomic) UIFont *font;
@property(assign, nonatomic) NSInteger duration;

@end
