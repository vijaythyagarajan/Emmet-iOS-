//
//  NAtomTrendingNewsRequest.h
//  News
//
//  Created by vijaythyagarajan on 23/04/18.
//  Copyright © 2018 vijaythyagarajan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TrendingNewsModel.h"

@interface NAtomTrendingNewsRequest : NSObject

+(NAtomTrendingNewsRequest *) sharedInstance;

@property (strong,nonatomic) TrendingNewsModel *trendingNewsModel;

-(BOOL) getAllNews;
@end
