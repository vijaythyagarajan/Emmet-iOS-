//
//  NAtomYoutubeRequest.h
//  News
//
//  Created by vijaythyagarajan on 03/05/18.
//  Copyright © 2018 vijaythyagarajan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YoutubeVideoModel.h"

@interface NAtomYoutubeRequest : NSObject

+(NAtomYoutubeRequest *) sharedInstance;

@property (strong,nonatomic) YoutubeVideoModel *youtubeModel;

-(void) getVideoIdForText:(NSString *) title;
@end
