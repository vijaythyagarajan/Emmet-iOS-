//
//  Helper.m
//  News
//
//  Created by vijaythyagarajan on 24/04/18.
//  Copyright © 2018 vijaythyagarajan. All rights reserved.
//

#import "Helper.h"

@implementation Helper

+(NSString *)currentTime {
    NSString *defaultLocalTime = @"2018-04-24";
    NSDateFormatter *dateFormat = [NSDateFormatter new];
    [dateFormat setDateFormat:@"yyyy-MM-dd"];
    NSLog(@"current date:%@",[dateFormat stringFromDate:[NSDate date]]);
    if(![[dateFormat stringFromDate:[NSDate date]] isEqual:[NSNull null]]){
        return [dateFormat stringFromDate:[NSDate date]];
    }
    return defaultLocalTime;
}

+(BOOL)isNetworkAvailable {
    Reachability *reachability = [Reachability reachabilityForInternetConnection];
    
    if([reachability isReachable]) {
        return YES;
    }
    return NO;
}

+(BOOL) stringNull:(NSString *)string {
    if ( ( ![string isEqual:[NSNull null]] ) && ( [string length] != 0 ) ) {
        return YES;
    }
    return NO;
}
@end
