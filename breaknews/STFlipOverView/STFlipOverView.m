//
//  STFlipOverView.m
//  breaknews
//
//  Created by Showtime on 2017/8/24.
//  Copyright © 2017年 Showtime. All rights reserved.
//

#import "STFlipOverView.h"

@interface STFlipOverView ()<UITableViewDelegate, UITableViewDataSource>

@property(strong, nonatomic) UITableView *tableView;
@property(strong, nonatomic) NSTimer *timer;
@property(assign, nonatomic) NSInteger currentIndex;

@end

@implementation STFlipOverView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        _tableView = [[UITableView alloc] initWithFrame:self.bounds style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.indicatorStyle = UIScrollViewIndicatorStyleWhite;
        _tableView.scrollEnabled = NO;
        [self addSubview:_tableView];
    }
    return self;
}

- (void)setItemList:(NSArray<STFlipOverItem *> *)itemList{
    STFlipOverItem *obj = [[itemList firstObject] copy];
    _itemList = [itemList arrayByAddingObject:obj];
    [_tableView reloadData];
}

- (void)setDuration:(NSInteger)duration{
    _duration = duration;
    _timer = [NSTimer scheduledTimerWithTimeInterval:duration target:self selector:@selector(scrollText) userInfo:nil repeats:YES];
}

-(void)scrollText{
    _currentIndex++;
    NSIndexPath *scrollpath = [NSIndexPath indexPathForRow:0 inSection:_currentIndex];
    [_tableView scrollToRowAtIndexPath:scrollpath atScrollPosition:UITableViewScrollPositionNone animated:YES];
    if (_currentIndex == _itemList.count - 1) {
        _currentIndex = 0;
        [self performSelector:@selector(scrollToTop) withObject:nil afterDelay:0.3f];
    }
}

-(void)scrollToTop{
    [_tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]
                      atScrollPosition:UITableViewScrollPositionNone animated:NO];
}

#pragma mark - UITableView delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return _itemList.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return self.frame.size.height;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *reuseidentifier = @"reuseCell";
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseidentifier];
    cell.textLabel.text = _itemList[indexPath.section].text;
    if (_textColor) {
        cell.textLabel.textColor = _textColor;
    }
    if (_font) {
        cell.textLabel.font = _font;
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    STFlipOverItem *item = _itemList[indexPath.section];
    if (item.tapHandler) {
        item.tapHandler();
    }
}

@end
