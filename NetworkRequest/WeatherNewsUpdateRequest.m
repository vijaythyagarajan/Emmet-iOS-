//
//  WeatherNewsUpdateRequest.m
//  News
//
//  Created by Vijay on 09/09/18.
//  Copyright © 2018 vijaythyagarajan. All rights reserved.
//

#import "WeatherNewsUpdateRequest.h"
#import "Helper.h"
#define url @"api.openweathermap.org/data/2.5/weather?q=%@"

@implementation WeatherNewsUpdateRequest

static WeatherNewsUpdateRequest *instance = nil;

+(WeatherNewsUpdateRequest *)sharedInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

//+(void) getNews {
//    NSString *URL = [NSString stringWithFormat:@"%@%@",url,API_KEY];
//    if([Helper isNetworkAvailable]){
//        NSMutableURLRequest *request =
//        [NSMutableURLRequest requestWithURL:[NSURL URLWithString:URL]
//                                cachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData
//                            timeoutInterval:10
//         ];
//        
//        [request setHTTPMethod: @"GET"];
//        
//        NSError *requestError = nil;
//        NSURLResponse *urlResponse = nil;
//        
//        NSData *weatherUpdate = [NSURLConnection sendSynchronousRequest:request
//                                                             returningResponse:&urlResponse error:&requestError];
//        
////        _trendingNewsModel = [[TrendingNewsModel alloc] initWithData:trendingNewsResponse];
////
////        if([_trendingNewsModel.status isEqualToString:@"ok"]){
////            return YES;
////        }
//    }
//    return NO;
//}
@end
