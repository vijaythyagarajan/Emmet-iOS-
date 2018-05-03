//
//  TrendingNewsModel.h
//  News
//
//  Created by vijaythyagarajan on 23/04/18.
//  Copyright © 2018 vijaythyagarajan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TrendingNewsModel : NSObject

-(instancetype) initWithData:(NSData *) data;

@property (strong,nonatomic) NSArray *statusText;
@property (strong,nonatomic) NSArray *descriptionText;
@property (strong,nonatomic) NSArray *authorName;
@property (strong,nonatomic) NSArray *dateAndTime;
@property (strong,nonatomic) NSArray *trendingImage;
@property (strong,nonatomic) NSString *status;
@property (strong,nonatomic) NSArray *url;
@property  NSInteger count;

@property (strong,nonatomic) NSDictionary *articlesKey;

+(NSArray *) timeAndDate:(NSString *)yourString;

+(BOOL) didTrendingArticleChange:(NSDictionary *)newArticles andOldArticle:(NSDictionary *) oldArticle;
@end
