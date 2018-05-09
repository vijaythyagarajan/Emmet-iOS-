//
//  SportCrickDataModel.m
//  News
//
//  Created by vijaythyagarajan on 08/05/18.
//  Copyright © 2018 vijaythyagarajan. All rights reserved.
//

#import "SportCrickDataModel.h"

@implementation SportCrickDataModel
-(instancetype) initWithData:(NSData *)data {
    self = [super init];
    
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    _articlesDictionary = [json valueForKey:@"articles"];
    _responseStatus = [json valueForKey:@"status"];
    if(json)
    {
        NSLog(@"dic %@",json);
        _statusTitle = [self.articlesDictionary valueForKey:@"title"];
        _descrptionText = [_articlesDictionary valueForKey:@"description"];
        _DisplayImage = [_articlesDictionary valueForKey:@"urlToImage"];
        _dateAndTime = [_articlesDictionary valueForKey:@"publishedAt"];
        _authorName = [_articlesDictionary valueForKeyPath:@"source.name"];
        if([_articlesDictionary count]>20){
            _count = 20;
        }
        else{
            _count=[_articlesDictionary count];
        }
        
    }
    
    return self;
}
@end
