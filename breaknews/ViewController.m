//
//  ViewController.m
//  breaknews
//
//  Created by roboca on 15/9/10.
//  Copyright (c) 2015年 roboca. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize frametable;
@synthesize poems;
@synthesize count;
@synthesize timer;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    poems = [NSArray arrayWithObjects:@"锄禾日当午",@"汗滴禾下土",@"谁知盘中餐",@"粒粒皆辛苦",@"锄禾日当午", nil];
    count = 0;
    
    frametable = [[UITableView alloc] initWithFrame:CGRectMake(50, 50, self.view.bounds.size.width-100, 40) style:UITableViewStylePlain];
    frametable.delegate = self;
    frametable.dataSource = self;
    frametable.separatorStyle = UITableViewCellSeparatorStyleNone;
    frametable.indicatorStyle = UIScrollViewIndicatorStyleWhite;
    frametable.scrollEnabled = NO;
    [self.view addSubview:frametable];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    btn.frame = CGRectMake(50, 150, 60, 40);
    [btn setTitle:@"scroll" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(startTimer) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    timer = [NSTimer scheduledTimerWithTimeInterval:2.0f target:self selector:@selector(scrollTable) userInfo:nil repeats:YES];
}

-(void)startTimer{
    
}

-(void)scrollTable{
    count++;
    NSIndexPath *scrollpath = [NSIndexPath indexPathForRow:0 inSection:count];
    [frametable scrollToRowAtIndexPath:scrollpath atScrollPosition:UITableViewScrollPositionNone animated:YES];
    if (count == 4) {
        count = 0;
        [self performSelector:@selector(scrollToFront) withObject:nil afterDelay:0.3f];
    }
}

-(void)scrollToFront{
    NSIndexPath *scrollpath = [NSIndexPath indexPathForRow:0 inSection:count];
    [frametable scrollToRowAtIndexPath:scrollpath atScrollPosition:UITableViewScrollPositionNone animated:NO];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *reuseidentifier = @"reuseCell";
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseidentifier];
    cell.textLabel.text = [poems objectAtIndex:indexPath.section];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 40;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return [poems count];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
