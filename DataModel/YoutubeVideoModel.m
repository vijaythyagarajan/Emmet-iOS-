//
//  YoutubeVideoModel.m
//  News
//
//  Created by vijaythyagarajan on 03/05/18.
//  Copyright © 2018 vijaythyagarajan. All rights reserved.
//

#import "YoutubeVideoModel.h"

@implementation YoutubeVideoModel

-(instancetype) initData:(NSData *)data {
    self = [super init];
    
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    NSArray *items = [json valueForKey:@"items"];
    if(json) {
        _items = [json valueForKey:@"items"];
        for ( NSDictionary *dict in _items) {
            _itemId = [dict objectForKey:@"id"];
            _videoId = [_itemId valueForKey:@"videoId"];
        }
    }
    
    return self;
}
@end
