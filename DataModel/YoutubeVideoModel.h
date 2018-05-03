//
//  YoutubeVideoModel.h
//  News
//
//  Created by vijaythyagarajan on 03/05/18.
//  Copyright © 2018 vijaythyagarajan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YoutubeVideoModel : NSObject

-(instancetype) initData:(NSData *) data;

@property (strong,nonatomic) NSArray *items;
@property (strong,nonatomic) NSArray *itemId;

@property (strong,nonatomic) NSString *videoId;
@end
