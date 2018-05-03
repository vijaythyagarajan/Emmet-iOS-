//
//  Helper.h
//  News
//
//  Created by vijaythyagarajan on 24/04/18.
//  Copyright © 2018 vijaythyagarajan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Reachability.h"

@interface Helper : NSObject

+(NSString *) currentTime;
+(BOOL)isNetworkAvailable;
@end
