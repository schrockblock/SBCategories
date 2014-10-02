//
//  NSDateRelativeTimeTests.m
//  SBCategories
//
//  Created by Elliot Schrock on 10/2/14.
//  Copyright (c) 2014 Elliot. All rights reserved.
//

#import "NSDate+RelativeTime.h"

SpecBegin(NSDateRelativeTimeSpecs)

describe(@"test before", ^{
    __block NSDate *date;
    __block NSDate *testDate;
    
    beforeAll(^{
        date = [NSDate date];
    });
    
    it(@"identifies earlier date as before", ^{
        testDate = [NSDate dateWithTimeInterval:-1 sinceDate:date];
        expect([testDate isBefore:date]).to.beTruthy;
    });
    
    it(@"identifies later date as not before", ^{
        testDate = [NSDate dateWithTimeInterval:1 sinceDate:date];
        expect([testDate isBefore:date]).to.beFalsy;
    });
    
    it(@"identifies equivalent date as not before", ^{
        testDate = [NSDate dateWithTimeInterval:0 sinceDate:date];
        expect([testDate isBefore:date]).to.beFalsy;
    });
});

describe(@"test after", ^{
    __block NSDate *date;
    __block NSDate *testDate;
    
    beforeAll(^{
        date = [NSDate date];
    });
    
    it(@"identifies earlier date as not after", ^{
        testDate = [NSDate dateWithTimeInterval:-1 sinceDate:date];
        expect([testDate isBefore:date]).to.beFalsy;
    });
    
    it(@"identifies later date as after", ^{
        testDate = [NSDate dateWithTimeInterval:1 sinceDate:date];
        expect([testDate isBefore:date]).to.beTruthy;
    });
    
    it(@"identifies equivalent date as not after", ^{
        testDate = [NSDate dateWithTimeInterval:0 sinceDate:date];
        expect([testDate isBefore:date]).to.beFalsy;
    });
});

describe(@"test unit incrementation", ^{
    __block NSDateFormatter *formatter;
    __block NSDate *date;
    __block NSDate *testDate;
    
    beforeAll(^{
        formatter = [[NSDateFormatter alloc] init];
        formatter.dateFormat = @"yyyy-MM-dd hh:mm:ss";
    });
    
    it(@"increments days by one", ^{
        date = [formatter dateFromString:@"2014-10-02 10:00:00"];
        testDate = [date incrementUnit:NSCalendarUnitDay by:1];
        expect([formatter stringFromDate:testDate]).to.equal(@"2014-10-03 10:00:00");
    });
    
    it(@"increments days by negative one", ^{
        date = [formatter dateFromString:@"2014-10-02 10:00:00"];
        testDate = [date incrementUnit:NSCalendarUnitDay by:-1];
        expect([formatter stringFromDate:testDate]).to.equal(@"2014-10-01 10:00:00");
    });
    
    it(@"increments days by zero", ^{
        date = [formatter dateFromString:@"2014-10-02 10:00:00"];
        testDate = [date incrementUnit:NSCalendarUnitDay by:0];
        expect([formatter stringFromDate:testDate]).to.equal(@"2014-10-02 10:00:00");
    });
    
    it(@"increments weeks by one", ^{
        date = [formatter dateFromString:@"2014-10-02 10:00:00"];
        testDate = [date incrementUnit:NSCalendarUnitWeekOfYear by:1];
        expect([formatter stringFromDate:testDate]).to.equal(@"2014-10-09 10:00:00");
    });
    
    it(@"increments weeks by negative one", ^{
        date = [formatter dateFromString:@"2014-10-02 10:00:00"];
        testDate = [date incrementUnit:NSCalendarUnitWeekOfYear by:-1];
        expect([formatter stringFromDate:testDate]).to.equal(@"2014-09-25 10:00:00");
    });
    
    it(@"increments weeks by zero", ^{
        date = [formatter dateFromString:@"2014-10-02 10:00:00"];
        testDate = [date incrementUnit:NSCalendarUnitWeekOfYear by:0];
        expect([formatter stringFromDate:testDate]).to.equal(@"2014-10-02 10:00:00");
    });
    
    it(@"increments months by one", ^{
        date = [formatter dateFromString:@"2014-10-02 10:00:00"];
        testDate = [date incrementUnit:NSCalendarUnitMonth by:1];
        expect([formatter stringFromDate:testDate]).to.equal(@"2014-11-02 10:00:00");
    });
    
    it(@"increments months by negative one", ^{
        date = [formatter dateFromString:@"2014-10-02 10:00:00"];
        testDate = [date incrementUnit:NSCalendarUnitMonth by:-1];
        expect([formatter stringFromDate:testDate]).to.equal(@"2014-09-02 10:00:00");
    });
    
    it(@"increments months by zero", ^{
        date = [formatter dateFromString:@"2014-10-02 10:00:00"];
        testDate = [date incrementUnit:NSCalendarUnitMonth by:0];
        expect([formatter stringFromDate:testDate]).to.equal(@"2014-10-02 10:00:00");
    });
    
    it(@"increments hours by one", ^{
        date = [formatter dateFromString:@"2014-10-02 10:00:00"];
        testDate = [date incrementUnit:NSCalendarUnitHour by:1];
        expect([formatter stringFromDate:testDate]).to.equal(@"2014-10-02 11:00:00");
    });
    
    it(@"increments hours by negative one", ^{
        date = [formatter dateFromString:@"2014-10-02 10:00:00"];
        testDate = [date incrementUnit:NSCalendarUnitHour by:-1];
        expect([formatter stringFromDate:testDate]).to.equal(@"2014-10-02 09:00:00");
    });
    
    it(@"increments hours by zero", ^{
        date = [formatter dateFromString:@"2014-10-02 10:00:00"];
        testDate = [date incrementUnit:NSCalendarUnitHour by:0];
        expect([formatter stringFromDate:testDate]).to.equal(@"2014-10-02 10:00:00");
    });
    
    it(@"increments minutes by one", ^{
        date = [formatter dateFromString:@"2014-10-02 10:00:00"];
        testDate = [date incrementUnit:NSCalendarUnitMinute by:1];
        expect([formatter stringFromDate:testDate]).to.equal(@"2014-10-02 10:01:00");
    });
    
    it(@"increments minutes by negative one", ^{
        date = [formatter dateFromString:@"2014-10-02 10:00:00"];
        testDate = [date incrementUnit:NSCalendarUnitMinute by:-1];
        expect([formatter stringFromDate:testDate]).to.equal(@"2014-10-02 09:59:00");
    });
    
    it(@"increments minutes by zero", ^{
        date = [formatter dateFromString:@"2014-10-02 10:00:00"];
        testDate = [date incrementUnit:NSCalendarUnitMinute by:0];
        expect([formatter stringFromDate:testDate]).to.equal(@"2014-10-02 10:00:00");
    });
    
    it(@"increments seconds by one", ^{
        date = [formatter dateFromString:@"2014-10-02 10:00:00"];
        testDate = [date incrementUnit:NSCalendarUnitSecond by:1];
        expect([formatter stringFromDate:testDate]).to.equal(@"2014-10-02 10:00:01");
    });
    
    it(@"increments seconds by negative one", ^{
        date = [formatter dateFromString:@"2014-10-02 10:00:00"];
        testDate = [date incrementUnit:NSCalendarUnitSecond by:-1];
        expect([formatter stringFromDate:testDate]).to.equal(@"2014-10-02 09:59:59");
    });
    
    it(@"increments seconds by zero", ^{
        date = [formatter dateFromString:@"2014-10-02 10:00:00"];
        testDate = [date incrementUnit:NSCalendarUnitSecond by:0];
        expect([formatter stringFromDate:testDate]).to.equal(@"2014-10-02 10:00:00");
    });
});

SpecEnd
