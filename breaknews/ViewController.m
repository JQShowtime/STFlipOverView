//
//  ViewController.m
//  breaknews
//
//  Created by roboca on 15/9/10.
//  Copyright (c) 2015年 roboca. All rights reserved.
//

#import "ViewController.h"
#import "STFlipOverView.h"

@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    poems = [NSArray arrayWithObjects:@"锄禾日当午",@"汗滴禾下土",@"谁知盘中餐",@"粒粒皆辛苦",@"锄禾日当午", nil];
    STFlipOverItem *item1 = [STFlipOverItem itemWithText:@"锄禾日当午" andItemTapHandler:^ {
        NSLog(@"锄禾日当午");
    }];
    
    STFlipOverItem *item2 = [STFlipOverItem itemWithText:@"汗滴禾下土" andItemTapHandler:^ {
        NSLog(@"汗滴禾下土");
    }];
    
    STFlipOverItem *item3 = [STFlipOverItem itemWithText:@"谁知盘中餐" andItemTapHandler:^ {
        NSLog(@"谁知盘中餐");
    }];
    
    STFlipOverItem *item4 = [STFlipOverItem itemWithText:@"粒粒皆辛苦" andItemTapHandler:^ {
        NSLog(@"粒粒皆辛苦");
    }];
    
    NSArray *array = @[item1, item2, item3, item4];
    
    STFlipOverView *label = [[STFlipOverView alloc] initWithFrame:CGRectMake(100, 200, 150, 50)];
    label.itemList = array;
    label.duration = 2;
    [self.view addSubview:label];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
