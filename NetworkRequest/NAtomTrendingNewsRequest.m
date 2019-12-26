//
//  NAtomTrendingNewsRequest.m
//  News
//
//  Created by vijaythyagarajan on 23/04/18.
//  Copyright © 2018 vijaythyagarajan. All rights reserved.
//

#import "NAtomTrendingNewsRequest.h"
#import "Helper.h"

#define API_KEY @"0e223511e8094dd7ba6984191336659b"

#define TRENDING_NEWS_URL @"https://newsapi.org/v2/top-headlines?country=IN&apiKey="

#define SPORT_NEW_URL @"https://newsapi.org/v2/top-headlines?sources=bbc-sport&apiKey="
@implementation NAtomTrendingNewsRequest

static NAtomTrendingNewsRequest *instance = nil;

+(NAtomTrendingNewsRequest *)sharedInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

-(BOOL)getAllNews {
    NSString *URL = [NSString stringWithFormat:@"%@%@",TRENDING_NEWS_URL,API_KEY];
    if([Helper isNetworkAvailable]){
        NSMutableURLRequest *request =
        [NSMutableURLRequest requestWithURL:[NSURL URLWithString:URL]
                                cachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData
                            timeoutInterval:10
         ];
        
        [request setHTTPMethod: @"GET"];
        
        NSError *requestError = nil;
        NSURLResponse *urlResponse = nil;
        
        NSData *trendingNewsResponse = [NSURLConnection sendSynchronousRequest:request
                                                             returningResponse:&urlResponse error:&requestError];
        
            _trendingNewsModel = [[TrendingNewsModel alloc] initWithData:trendingNewsResponse];
            
            if([_trendingNewsModel.status isEqualToString:@"ok"]){
                return YES;
            }
        }
    return NO;
}


@end
