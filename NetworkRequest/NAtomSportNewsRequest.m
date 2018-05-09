//
//  NAtomSportNewsRequest.m
//  News
//
//  Created by vijaythyagarajan on 24/04/18.
//  Copyright © 2018 vijaythyagarajan. All rights reserved.
//

#import "NAtomSportNewsRequest.h"
#define API_KEY @"0e223511e8094dd7ba6984191336659b"
#define SPORT_NEW_URL @"https://newsapi.org/v2/top-headlines?sources=espn&apiKey="
#define SPORT_NEW_CRICK_URL @"https://newsapi.org/v2/top-headlines?sources=espn-cric-info&apiKey="

@implementation NAtomSportNewsRequest

static NAtomSportNewsRequest *instance = nil;

+(NAtomSportNewsRequest *)sharedInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

-(BOOL) getAllSportNews {
    NSString *URL = [NSString stringWithFormat:@"%@%@",SPORT_NEW_URL,API_KEY];
   // NSString *factURL = [NSString stringWithFormat:@"http://history.muffinlabs.com/date"];
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
        
        _sportNewsModel = [[SportNewsModel alloc] initWithData:trendingNewsResponse];
        
         
        if([_sportNewsModel.responseStatus isEqualToString:@"ok"]){
            return YES;
        }
    }
    return NO;
}

-(BOOL) getCricketNews {
    NSString *URL = [NSString stringWithFormat:@"%@%@",SPORT_NEW_CRICK_URL,API_KEY];
    // NSString *factURL = [NSString stringWithFormat:@"http://history.muffinlabs.com/date"];
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
        
        _sportCrickDataModel = [[SportCrickDataModel alloc] initWithData:trendingNewsResponse];
        
        
        if([_sportCrickDataModel.responseStatus isEqualToString:@"ok"]){
            return YES;
        }
    }
    return NO;
}

@end
