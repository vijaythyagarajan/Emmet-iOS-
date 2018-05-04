//
//  Helper.m
//  News
//
//  Created by vijaythyagarajan on 24/04/18.
//  Copyright © 2018 vijaythyagarajan. All rights reserved.
//

#import "Helper.h"

@implementation Helper

+(NSString *)currentTime {
    NSString *defaultLocalTime = @"2018-04-24";
    NSDateFormatter *dateFormat = [NSDateFormatter new];
    [dateFormat setDateFormat:@"yyyy-MM-dd"];
    NSLog(@"current date:%@",[dateFormat stringFromDate:[NSDate date]]);
    if(![[dateFormat stringFromDate:[NSDate date]] isEqual:[NSNull null]]){
        return [dateFormat stringFromDate:[NSDate date]];
    }
    return defaultLocalTime;
}

+(BOOL)isNetworkAvailable {
    Reachability *reachability = [Reachability reachabilityForInternetConnection];
    
    if([reachability isReachable]) {
        return YES;
    }
    return NO;
}

+(BOOL) stringNull:(NSString *)string {
    if ( ( ![string isEqual:[NSNull null]] ) && ( [string length] != 0 ) ) {
        return YES;
    }
    return NO;
}

+(NSString *)generateVideoSearchTextForNewsTitle:(NSString *)newsTitle {
    NSMutableArray *searchTextArray = [NSMutableArray new];
    NSString * result;
    NSLinguisticTagger *tagger = [[NSLinguisticTagger alloc] initWithTagSchemes:[NSArray arrayWithObject:NSLinguisticTagSchemeLexicalClass] options:~NSLinguisticTaggerOmitWords];
    [tagger setString:newsTitle];
    [tagger enumerateTagsInRange:NSMakeRange(0, [newsTitle length])
                          scheme:NSLinguisticTagSchemeLexicalClass
                         options:~NSLinguisticTaggerOmitWords
                      usingBlock:^(NSString *tag, NSRange tokenRange, NSRange sentenceRange, BOOL *stop) {
                          NSLog(@"found: %@ (%@)", [newsTitle substringWithRange:tokenRange], tag);
                          if([tag isEqualToString:@"Noun"]){
                              [searchTextArray addObject:[newsTitle substringWithRange:tokenRange]];
                          }
                      }];
    if(searchTextArray.count>0){
    result = [[searchTextArray valueForKey:@"description"] componentsJoinedByString:@"-"];
    }
    else {
        result = [newsTitle stringByReplacingOccurrencesOfString:@" " withString:@"-"];
    }
    return result;
}
@end
