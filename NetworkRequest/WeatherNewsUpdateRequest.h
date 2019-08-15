//
//  WeatherNewsUpdateRequest.h
//  News
//
//  Created by Vijay on 09/09/18.
//  Copyright © 2018 vijaythyagarajan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WeatherNewsUpdateRequest : NSObject

+(WeatherNewsUpdateRequest *) sharedInstance ;

+(void) getNews;
@end
