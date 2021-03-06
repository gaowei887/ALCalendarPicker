//
//  ALCalendarDate.h
//  ALCalendarPickerDemo
//
//  Created by Arclin on 2017/6/17.
//  Copyright © 2017年 arclin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ALCalendarDate : NSObject

/** 日期(号数) */
@property (nonatomic, copy) NSString *date;

/** 是上个月 */
@property (nonatomic, assign) BOOL isLastMonth;

/** 是下个月 */
@property (nonatomic, assign) BOOL isNextMonth;

/** 不是这个月 */
@property (nonatomic, assign) BOOL notThisMonth;

/** 是今天 */
@property (nonatomic, assign) BOOL isToday;

+ (instancetype)lastMonthDateWith:(NSString *)dateStr;

+ (instancetype)nextMonthDateWith:(NSString *)dateStr;

@end
