//
//  ViewController.m
//  ALCalendarPickerDemo
//
//  Created by Arclin on 2017/6/16.
//  Copyright © 2017年 arclin. All rights reserved.
//

#import "ViewController.h"
#import "ALCalendarPicker.h"
#import "ALCalendarHelper.h"
#import <Masonry/Masonry.h>

@interface ViewController () <ALCalendarPickerDelegate>

@property (nonatomic, weak) ALCalendarPicker *calP;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.view.backgroundColor = [UIColor grayColor];
}
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    
    ALCalendarPicker *calP = [[ALCalendarPicker alloc] initWithFrame:CGRectMake(0, 64, screenSize.width, ALPickerHeight)];
    calP.delegate = self;
    // 起始日期
    calP.beginYearMonth = @"2017-01";
    // 结束日期
    calP.endYearMonth = @"2019-12";
    calP.hightLightItems = @[@"2017-06-01",@"2017-05-22",@"2017-06-12"];
    calP.hightlightPriority = NO;

    // 高亮颜色
    [calP setupHightLightItemStyle:^(UIColor *__autoreleasing *backgroundColor, NSNumber *__autoreleasing *backgroundCornerRadius, UIColor *__autoreleasing *titleColor) {
        *backgroundColor = [UIColor colorWithRed:234.0/255.0 green:240.0/255.0 blue:243.0/255.0 alpha:1];
        *backgroundCornerRadius = @(5.0);
        *titleColor = [UIColor colorWithRed:44.0/255.0 green:49.0/255.0 blue:53.0/255.0 alpha:1];
    }];

    // 今天日期颜色
    [calP setupTodayItemStyle:^(UIColor *__autoreleasing *backgroundColor, NSNumber *__autoreleasing *backgroundCornerRadius, UIColor *__autoreleasing *titleColor) {
        *backgroundColor = [UIColor colorWithRed:78.0/255.0 green:133.0/255.0 blue:222.0/255.0 alpha:1];
        *backgroundCornerRadius = @(screenSize.width / 20); // 因为宽度是屏幕宽度,宽度 / 10 是cell 宽高 , cell宽高 / 2 为圆形
        *titleColor = [UIColor whiteColor];
    }];

    // 选择日期颜色
    [calP setupSelectedItemStyle:^(UIColor *__autoreleasing *backgroundColor, NSNumber *__autoreleasing *backgroundCornerRadius, UIColor *__autoreleasing *titleColor) {
        *backgroundColor = [[UIColor redColor] colorWithAlphaComponent:0.5];
        *backgroundCornerRadius = @(screenSize.width / 20); // 因为宽度是屏幕宽度,宽度 / 10 是cell 宽高 , cell宽高 / 2 为圆形
        *titleColor = [UIColor whiteColor];
    }];
    
    [self.view addSubview:calP];
    
    self.calP = calP;
}

- (void)calendarPicker:(ALCalendarPicker *)picker didSelectItem:(ALCalendarDate *)date date:(NSDate *)dateObj dateString:(NSString *)dateStr
{
    NSLog(@"%@ %@ %@ %@",picker,date,dateStr,dateObj);

    // 动态添加选择日期
    NSMutableArray *array = [NSMutableArray arrayWithArray: picker.selectedItems];
    [array addObject:dateStr];
    picker.selectedItems = array;
}

- (void)calendarPicker:(ALCalendarPicker *)picker didScrollToYearMonth:(NSString *)yearMonth isScroll:(BOOL)isScroll
{
    NSLog(@"%d %@",isScroll,yearMonth);
}

- (void)calendarPicker:(ALCalendarPicker *)picker willClickToYearMonth:(NSString *)yearMonth
{
    NSLog(@"%@",yearMonth);
}

- (IBAction)jumpBtnClicked:(id)sender {
//    NSDate *date = [ALCalendarHelper dateStringToDate:@"2019-09" format:@"yyyy-MM"];
//    [self.calP jumpToYearMonth:date];
    [self.calP jumpToYearMonthByStr:@"2019-09"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
