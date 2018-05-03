//
//  TrendingNewsModel.m
//  News
//
//  Created by vijaythyagarajan on 23/04/18.
//  Copyright © 2018 vijaythyagarajan. All rights reserved.
//

#import "TrendingNewsModel.h"

@implementation TrendingNewsModel

-(instancetype) initWithData:(NSData *)data {
    self = [super init];
    
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    NSArray *articles = [json valueForKey:@"articles"];
    _status = [json valueForKey:@"status"];
    if(json) {
        NSLog(@"dic %@",json);
        self.articlesKey = [json valueForKey:@"articles"];
        
        _statusText = [self.articlesKey valueForKey:@"title"];
        _descriptionText = [self.articlesKey valueForKey:@"description"];
        _trendingImage = [self.articlesKey valueForKey:@"urlToImage"];
        _dateAndTime = [self.articlesKey valueForKey:@"publishedAt"];
        _authorName = [self.articlesKey valueForKeyPath:@"source.name"];
        _url = [self.articlesKey valueForKey:@"url"];
        if([articles count]>20){
            _count = 20;
    }
        else{
            _count=[articles count];
        }
    }
    return self;
}


+(NSString *) timeAndDate:(NSString *)yourString {
    //yyyy-MM-dd'T'HH:mm:ssZyyyy-MM-dd'T'HH:mm:ssZ
    NSArray* components = [yourString componentsSeparatedByString:@"T"];
    return components[0];
}

+(BOOL) didTrendingArticleChange:(NSDictionary *)newArticles andOldArticle:(NSDictionary *) oldArticle
{
    NSInteger count = 0;
    if(newArticles.count > 0){
        for(NSDictionary *dictNew in newArticles) {
            for(NSDictionary *dictOld in oldArticle){
                if( ! [dictNew isEqualToDictionary:dictOld])
                    count = count +1;
            }
        }
    }
    if(count > 0){
        return YES;
    }
    return NO;
}
@end
