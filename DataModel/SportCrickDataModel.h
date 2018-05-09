//
//  SportCrickDataModel.h
//  News
//
//  Created by vijaythyagarajan on 08/05/18.
//  Copyright © 2018 vijaythyagarajan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SportCrickDataModel : NSObject

-(instancetype) initWithData:(NSData *)data;


@property (strong,nonatomic) NSArray *authorName;
@property (strong,nonatomic) NSArray *statusTitle;
@property (strong,nonatomic) NSArray *descrptionText;
@property (strong, nonatomic) NSArray *dateAndTime;
@property (strong,nonatomic) NSArray *DisplayImage;
@property (strong,nonatomic) NSDictionary *articlesDictionary;

@property BOOL isCricketRequestSent;
@property NSString *responseStatus;
@property NSInteger count;

@end
