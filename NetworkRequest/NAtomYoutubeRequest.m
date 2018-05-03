//
//  NAtomYoutubeRequest.m
//  News
//
//  Created by vijaythyagarajan on 03/05/18.
//  Copyright © 2018 vijaythyagarajan. All rights reserved.
//

#import "NAtomYoutubeRequest.h"
#import "Helper.h"

#define YOUTUBE_SEARCH_URL @"https://www.googleapis.com/youtube/v3/search?q="
#define MAX_RESULT @"1"
#define YOUTUBE_API_KEY @"AIzaSyD-CBkxvnwDjLXvbQEG0ct1fgU2bmCnRdQ"

@implementation NAtomYoutubeRequest

static NAtomYoutubeRequest *instance = nil;

+(NAtomYoutubeRequest *) sharedInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

-(void) getVideoIdForText:(NSString *)title {
    NSString *searchParamater = [Helper generateVideoSearchTextForNewsTitle:title];
    
    NSString *youTube_URL = [NSString stringWithFormat:@"%@%@&maxResults=%@&part=snippet&key=%@",YOUTUBE_SEARCH_URL,searchParamater,MAX_RESULT,YOUTUBE_API_KEY];
    NSMutableURLRequest *request =
    [NSMutableURLRequest requestWithURL:[NSURL URLWithString:youTube_URL]
                            cachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData
                        timeoutInterval:10
     ];
    
    [request setHTTPMethod: @"GET"];
    
    NSError *requestError = nil;
    NSURLResponse *urlResponse = nil;
    
    NSData *youTubeResponse = [NSURLConnection sendSynchronousRequest:request
                                    
                                                         returningResponse:&urlResponse error:&requestError];
    _youtubeModel = [[YoutubeVideoModel alloc] initData:youTubeResponse];
}

@end
