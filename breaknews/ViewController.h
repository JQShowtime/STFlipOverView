//
//  ViewController.h
//  breaknews
//
//  Created by roboca on 15/9/10.
//  Copyright (c) 2015年 roboca. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>;

@property(strong , nonatomic) UITableView *frametable;
@property(strong, nonatomic) NSArray *poems;
@property(assign, nonatomic) NSInteger count;
@property(strong, nonatomic) NSTimer *timer;
@end

