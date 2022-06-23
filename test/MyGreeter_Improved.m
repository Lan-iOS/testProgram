//
//  MyGreeter_Improved.m
//  test
//
//  Created by Lan on 2022/6/23.
//

#import "MyGreeter_Improved.h"

@implementation MyGreeter_Improved


+ (MyGreeter_Improved *)sharedVariables
{
    static MyGreeter_Improved *singleObject;
    static dispatch_once_t onceToken;
    @synchronized(self){
        dispatch_once(&onceToken, ^{
            singleObject = [[super allocWithZone:NULL] init];
        });
    }
    
    return singleObject;
}

+ (void)sendMessage
{
    NSString *string = @"";
    if ([self isBetweenFromHour:6 toHour:12]) {
        string = @"Good morning";
    }
    if ([self isBetweenFromHour:12 toHour:18]) {
        string = @"Good afternoon";
    }
    if ([self isBetweenFromHour:18 toHour:6]) {
        string = @"Good evening";
    }
    NSLog(@"%@", string);
}

+ (BOOL)isBetweenFromHour:(NSInteger)fromHour toHour:(NSInteger)toHour
{
    NSDate *dateFrom = [self getCustomDateWithHour:fromHour];
    NSDate *dateTo = [self getCustomDateWithHour:toHour];
    
    NSDate *currentDate = [NSDate date];
    
    if ([currentDate compare:dateFrom]==NSOrderedDescending && [currentDate compare:dateTo]==NSOrderedAscending)
    {
//        DLog(@"该时间在 %ld:00-%ld:00 之间！", fromHour, toHour);
        return YES;
    }
    return NO;
}


+ (NSDate *)getCustomDateWithHour:(NSInteger)hour
{
    //获取当前时间
    NSDate *currentDate = [NSDate date];
    NSCalendar *currentCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *currentComps = [[NSDateComponents alloc] init];
    
    NSInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    
    currentComps = [currentCalendar components:unitFlags fromDate:currentDate];
    
    //设置当天的某个点
    NSDateComponents *resultComps = [[NSDateComponents alloc] init];
    [resultComps setYear:[currentComps year]];
    [resultComps setMonth:[currentComps month]];
    [resultComps setDay:[currentComps day]];
    [resultComps setHour:hour];
    
    NSCalendar *resultCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    return [resultCalendar dateFromComponents:resultComps];
}


@end
